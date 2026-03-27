import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../data/models/flashcard_model.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/widgets/shared_widgets.dart';
import '../../../data/progress_service.dart';
import '../../../data/spaced_repetition_service.dart';

class FlashcardView extends StatefulWidget {
  final List<Flashcard> cards;
  final String title;
  final Color? moduleColor;

  const FlashcardView({
    super.key,
    required this.cards,
    required this.title,
    this.moduleColor,
  });

  @override
  State<FlashcardView> createState() => _FlashcardViewState();
}

class _FlashcardViewState extends State<FlashcardView>
    with TickerProviderStateMixin {
  int _currentIndex = 0;
  bool _showBack = false;
  int _knewIt = 0;
  int _needsReview = 0;
  bool _sessionComplete = false;
  final List<int> _missedIndices = [];

  late AnimationController _flipController;
  late Animation<double> _flipAnimation;
  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;
  late AnimationController _needsReviewBtnController;
  late Animation<double> _needsReviewBtnScale;
  late AnimationController _gotItBtnController;
  late Animation<double> _gotItBtnScale;

  // Swipe state
  double _swipeDx = 0;
  static const double _swipeThreshold = 100;

  Flashcard get _card => widget.cards[_currentIndex];
  bool get _isLast => _currentIndex >= widget.cards.length - 1;
  Color get _moduleColor => widget.moduleColor ?? AppTheme.accentTeal;

  @override
  void initState() {
    super.initState();

    _flipController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _flipAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _flipController,
        curve: Curves.easeInOutCubic,
      ),
    );

    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    )..repeat(reverse: true);
    _pulseAnimation = Tween<double>(begin: 0.4, end: 0.9).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    _needsReviewBtnController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    _needsReviewBtnScale = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(
        parent: _needsReviewBtnController,
        curve: Curves.easeInOut,
      ),
    );

    _gotItBtnController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    _gotItBtnScale = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(
        parent: _gotItBtnController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _flipController.dispose();
    _pulseController.dispose();
    _needsReviewBtnController.dispose();
    _gotItBtnController.dispose();
    super.dispose();
  }

  void _flip() {
    if (_showBack) {
      _flipController.reverse();
    } else {
      _flipController.forward();
    }
    setState(() => _showBack = !_showBack);
  }

  void _handleGotIt() {
    _gotItBtnController.forward().then((_) {
      _gotItBtnController.reverse();
    });
    _advance(true);
  }

  void _handleNeedsReview() {
    _needsReviewBtnController.forward().then((_) {
      _needsReviewBtnController.reverse();
    });
    _advance(false);
  }

  void _advance(bool knew) {
    setState(() {
      if (knew) {
        _knewIt++;
      } else {
        _needsReview++;
        _missedIndices.add(_currentIndex);
      }
    });

    // Register with spaced repetition service
    final moduleId = _card.moduleId ?? widget.title;
    final itemId = 'fc_${moduleId}_$_currentIndex';
    final quality = knew ? 4 : 1;
    SpacedRepetitionService.saveReview(itemId, quality);

    if (_isLast) {
      _showResults();
    } else {
      _flipController.reset();
      setState(() {
        _currentIndex++;
        _showBack = false;
        _swipeDx = 0;
      });
    }
  }

  void _showResults() {
    final total = widget.cards.length;
    final percentage = (((_knewIt) / total) * 100).round();

    setState(() => _sessionComplete = true);
    ProgressService.saveFlashcardProgress(widget.title, _knewIt, total);

    showModalBottomSheet(
      context: context,
      isDismissible: false,
      enableDrag: false,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => _FlashcardResultsSheet(
        knewIt: _knewIt,
        needsReview: _needsReview,
        total: total,
        percentage: percentage,
        hasMissed: _missedIndices.isNotEmpty,
        onReviewMissed: () {
          Navigator.of(ctx).pop();
          final missedCards =
              _missedIndices.map((i) => widget.cards[i]).toList();
          setState(() {
            _currentIndex = 0;
            _showBack = false;
            _knewIt = 0;
            _needsReview = 0;
            _missedIndices.clear();
            _flipController.reset();
          });
          // Replace current cards with missed ones by pushing new view
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (_) => FlashcardView(
                cards: missedCards,
                title: '${widget.title} (Review)',
                moduleColor: widget.moduleColor,
              ),
            ),
          );
        },
        onDone: () {
          Navigator.of(ctx).pop();
          Navigator.of(context).pop();
        },
      ),
    );
  }

  // Swipe tint color based on direction
  Color? get _swipeTintColor {
    if (_swipeDx.abs() < 20) return null;
    if (_swipeDx > 0) {
      return AppTheme.successGreen
          .withValues(alpha: (_swipeDx / _swipeThreshold).clamp(0.0, 0.15));
    }
    return AppTheme.dangerRed
        .withValues(alpha: (_swipeDx.abs() / _swipeThreshold).clamp(0.0, 0.15));
  }

  Future<bool> _confirmLeave() async {
    final reviewed = _knewIt + _needsReview;
    return confirmLeaveDialog(
      context: context,
      title: 'Leave Flashcards?',
      body: 'You\'ve reviewed $reviewed of ${widget.cards.length} cards.',
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: _sessionComplete,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        final shouldLeave = await _confirmLeave();
        if (shouldLeave && context.mounted) {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Progress display
            Text(
              'Card ${_currentIndex + 1} of ${widget.cards.length}',
              style: GoogleFonts.inter(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: AppTheme.textSecondary,
              ),
            ),
            const SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(1.5),
              child: LinearProgressIndicator(
                value: (_currentIndex + 1) / widget.cards.length,
                backgroundColor: AppTheme.borderSubtle.withValues(alpha: 0.5),
                valueColor: const AlwaysStoppedAnimation(AppTheme.accentTeal),
                minHeight: 3,
              ),
            ),
            const SizedBox(height: 24),

            // Card with 3D flip and swipe
            Expanded(
              child: GestureDetector(
                onTap: _flip,
                onHorizontalDragUpdate: _showBack
                    ? (details) {
                        setState(() {
                          _swipeDx += details.delta.dx;
                        });
                      }
                    : null,
                onHorizontalDragEnd: _showBack
                    ? (details) {
                        if (_swipeDx > _swipeThreshold) {
                          _handleGotIt();
                        } else if (_swipeDx < -_swipeThreshold) {
                          _handleNeedsReview();
                        }
                        setState(() => _swipeDx = 0);
                      }
                    : null,
                child: AnimatedBuilder(
                  animation: _flipAnimation,
                  builder: (context, child) {
                    final angle = _flipAnimation.value * pi;
                    final showFront = angle <= pi / 2;

                    // Shadow shrinks at midpoint, grows back
                    final shadowProgress =
                        (1.0 - ((_flipAnimation.value - 0.5).abs() * 2))
                            .clamp(0.0, 1.0);
                    final shadowBlur = 20.0 - (shadowProgress * 14.0);
                    final shadowOffset = 8.0 - (shadowProgress * 5.0);

                    return Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..rotateY(angle)
                        ..translateByDouble(_swipeDx * 0.3, 0.0, 0.0, 0.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.06),
                              blurRadius: shadowBlur,
                              offset: Offset(0, shadowOffset),
                            ),
                          ],
                        ),
                        child: showFront
                            ? _buildFrontCard()
                            : Transform(
                                alignment: Alignment.center,
                                transform: Matrix4.identity()..rotateY(pi),
                                child: _buildBackCard(),
                              ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Action buttons
            if (_showBack)
              Row(
                children: [
                  // Needs Review button
                  Expanded(
                    child: ScaleTransition(
                      scale: _needsReviewBtnScale,
                      child: SizedBox(
                        height: 48,
                        child: OutlinedButton.icon(
                          onPressed: _handleNeedsReview,
                          icon: const Icon(Icons.close_rounded, size: 18),
                          label: Text(
                            'Needs Review',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: AppTheme.dangerRed,
                            backgroundColor: Colors.white,
                            side: const BorderSide(
                              color: AppTheme.dangerRed,
                              width: 1,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Got It button
                  Expanded(
                    child: ScaleTransition(
                      scale: _gotItBtnScale,
                      child: SizedBox(
                        height: 48,
                        child: ElevatedButton.icon(
                          onPressed: _handleGotIt,
                          icon: const Icon(Icons.check_rounded, size: 18),
                          label: Text(
                            'Got It',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppTheme.accentTeal,
                            foregroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            else
              const SizedBox(height: 48),
          ],
        ),
      ),
      ),
    );
  }

  Widget _buildFrontCard() {
    final tintColor = _swipeTintColor;

    return Container(
      key: ValueKey('front-$_currentIndex'),
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppTheme.borderSubtle.withValues(alpha: 0.6),
          width: 1,
        ),
      ),
      child: Stack(
        children: [
          // Swipe tint overlay
          if (tintColor != null)
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  color: tintColor,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          Column(
            children: [
              // Module color top accent bar
              Container(
                height: 3,
                width: double.infinity,
                color: _moduleColor,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(),
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 500),
                        child: Text(
                          _card.front,
                          style: GoogleFonts.sourceSerif4(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            height: 1.5,
                            color: AppTheme.primaryNavy,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const Spacer(),
                      // Tap to flip hint with pulse
                      FadeTransition(
                        opacity: _pulseAnimation,
                        child: Text(
                          'Tap to flip',
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            color: AppTheme.gray400,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBackCard() {
    final tintColor = _swipeTintColor;

    return Container(
      key: ValueKey('back-$_currentIndex'),
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: const Color(0xFFF0FDFA),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppTheme.accentTeal.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Stack(
        children: [
          // Swipe tint overlay
          if (tintColor != null)
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  color: tintColor,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          Column(
            children: [
              // Module color top accent bar
              Container(
                height: 3,
                width: double.infinity,
                color: _moduleColor,
              ),
              Expanded(
                child: Stack(
                  children: [
                    // Board readiness chip in top-right
                    if (_card.boardReadiness != null)
                      Positioned(
                        top: 16,
                        right: 16,
                        child:
                            BoardReadinessChip(boardReadiness: _card.boardReadiness),
                      ),
                    // Content centered
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(32),
                        child: SingleChildScrollView(
                          child: Text(
                            _card.back,
                            style: GoogleFonts.inter(
                              fontSize: 15,
                              height: 1.7,
                              color: AppTheme.textPrimary,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    // Swipe direction indicators
                    if (_swipeDx > 20)
                      Positioned(
                        right: 16,
                        top: 0,
                        bottom: 0,
                        child: Center(
                          child: Icon(
                            Icons.check_circle_rounded,
                            color: AppTheme.successGreen
                                .withValues(alpha: (_swipeDx / _swipeThreshold).clamp(0.0, 0.7)),
                            size: 36,
                          ),
                        ),
                      ),
                    if (_swipeDx < -20)
                      Positioned(
                        left: 16,
                        top: 0,
                        bottom: 0,
                        child: Center(
                          child: Icon(
                            Icons.cancel_rounded,
                            color: AppTheme.dangerRed
                                .withValues(alpha: (_swipeDx.abs() / _swipeThreshold).clamp(0.0, 0.7)),
                            size: 36,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Results bottom sheet
// ---------------------------------------------------------------------------

class _FlashcardResultsSheet extends StatefulWidget {
  final int knewIt;
  final int needsReview;
  final int total;
  final int percentage;
  final bool hasMissed;
  final VoidCallback onReviewMissed;
  final VoidCallback onDone;

  const _FlashcardResultsSheet({
    required this.knewIt,
    required this.needsReview,
    required this.total,
    required this.percentage,
    required this.hasMissed,
    required this.onReviewMissed,
    required this.onDone,
  });

  @override
  State<_FlashcardResultsSheet> createState() =>
      _FlashcardResultsSheetState();
}

class _FlashcardResultsSheetState extends State<_FlashcardResultsSheet>
    with SingleTickerProviderStateMixin {
  late AnimationController _ringController;
  late Animation<double> _ringAnimation;

  @override
  void initState() {
    super.initState();
    _ringController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _ringAnimation = CurvedAnimation(
      parent: _ringController,
      curve: Curves.easeOutCubic,
    );
    _ringController.forward();
  }

  @override
  void dispose() {
    _ringController.dispose();
    super.dispose();
  }

  Color get _scoreColor {
    final ratio = widget.knewIt / widget.total;
    if (ratio >= 0.8) return AppTheme.successGreen;
    if (ratio >= 0.6) return AppTheme.warningAmber;
    return AppTheme.dangerRed;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(28),
          topRight: Radius.circular(28),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 40),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const BottomSheetHandle(),
          const SizedBox(height: 32),

          Text(
            'Session Complete',
            style: GoogleFonts.sourceSerif4(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: AppTheme.primaryNavy,
            ),
          ),
          const SizedBox(height: 28),

          // Circular score ring
          AnimatedBuilder(
            animation: _ringAnimation,
            builder: (context, child) {
              return SizedBox(
                width: 120,
                height: 120,
                child: CustomPaint(
                  painter: ScoreRingPainter(
                    progress:
                        (widget.knewIt / widget.total) * _ringAnimation.value,
                    color: _scoreColor,
                    trackColor: AppTheme.borderSubtle.withValues(alpha: 0.4),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '${widget.percentage}%',
                          style: GoogleFonts.sourceSerif4(
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                            color: _scoreColor,
                            height: 1.0,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'known',
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            color: AppTheme.textSecondary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 24),

          // Stats row
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _StatBadge(
                icon: Icons.check_circle_rounded,
                color: AppTheme.successGreen,
                label: 'Known',
                value: '${widget.knewIt}',
              ),
              const SizedBox(width: 32),
              _StatBadge(
                icon: Icons.refresh_rounded,
                color: AppTheme.dangerRed,
                label: 'Needs Review',
                value: '${widget.needsReview}',
              ),
            ],
          ),
          const SizedBox(height: 32),

          // Review Missed Cards button
          if (widget.hasMissed) ...[
            SizedBox(
              width: double.infinity,
              height: 48,
              child: OutlinedButton(
                onPressed: widget.onReviewMissed,
                style: OutlinedButton.styleFrom(
                  foregroundColor: _scoreColor,
                  side: BorderSide(color: _scoreColor, width: 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Review Missed Cards',
                  style: GoogleFonts.inter(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
          ],

          // Done button
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: widget.onDone,
              style: ElevatedButton.styleFrom(
                backgroundColor: _scoreColor,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Done',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatBadge extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;
  final String value;

  const _StatBadge({
    required this.icon,
    required this.color,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: color, size: 24),
        const SizedBox(height: 6),
        Text(
          value,
          style: GoogleFonts.inter(
            fontSize: 28,
            fontWeight: FontWeight.w800,
            color: color,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 12,
            color: AppTheme.textSecondary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

