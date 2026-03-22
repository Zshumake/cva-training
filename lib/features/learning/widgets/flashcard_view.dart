import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../data/models/flashcard_model.dart';
import '../../../core/theme/app_theme.dart';

class FlashcardView extends StatefulWidget {
  final List<Flashcard> cards;
  final String title;

  const FlashcardView({super.key, required this.cards, required this.title});

  @override
  State<FlashcardView> createState() => _FlashcardViewState();
}

class _FlashcardViewState extends State<FlashcardView>
    with TickerProviderStateMixin {
  int _currentIndex = 0;
  bool _showBack = false;
  int _knewIt = 0;
  int _needsWork = 0;

  late AnimationController _flipController;
  late Animation<double> _flipAnimation;
  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;

  Flashcard get _card => widget.cards[_currentIndex];
  bool get _isLast => _currentIndex >= widget.cards.length - 1;

  @override
  void initState() {
    super.initState();

    _flipController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _flipAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _flipController, curve: Curves.easeInOutCubic),
    );

    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    )..repeat(reverse: true);
    _pulseAnimation = Tween<double>(begin: 0.4, end: 0.9).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _flipController.dispose();
    _pulseController.dispose();
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

  void _next(bool knew) {
    setState(() {
      if (knew) {
        _knewIt++;
      } else {
        _needsWork++;
      }
    });
    if (_isLast) {
      _showResults();
    } else {
      _flipController.reset();
      setState(() {
        _currentIndex++;
        _showBack = false;
      });
    }
  }

  void _showResults() {
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      enableDrag: false,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => _FlashcardResultsSheet(
        knewIt: _knewIt,
        needsWork: _needsWork,
        total: widget.cards.length,
        onDone: () {
          Navigator.of(ctx).pop();
          Navigator.of(context).pop();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Text(
                '${_currentIndex + 1}/${widget.cards.length}',
                style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.white.withValues(alpha: 0.85),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Progress
            ClipRRect(
              borderRadius: BorderRadius.circular(2),
              child: LinearProgressIndicator(
                value: (_currentIndex + 1) / widget.cards.length,
                backgroundColor: AppTheme.borderSubtle.withValues(alpha: 0.5),
                valueColor: AlwaysStoppedAnimation(
                  AppTheme.accentTeal.withValues(alpha: 0.85),
                ),
                minHeight: 4,
              ),
            ),
            const SizedBox(height: 24),
            // Card with 3D flip
            Expanded(
              child: GestureDetector(
                onTap: _flip,
                child: AnimatedBuilder(
                  animation: _flipAnimation,
                  builder: (context, child) {
                    final angle = _flipAnimation.value * pi;
                    final showFront = angle <= pi / 2;

                    return Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..rotateY(angle),
                      child: showFront
                          ? _buildFrontCard()
                          : Transform(
                              alignment: Alignment.center,
                              transform: Matrix4.identity()..rotateY(pi),
                              child: _buildBackCard(),
                            ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Buttons
            if (_showBack)
              Row(
                children: [
                  Expanded(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            AppTheme.dangerRed,
                            AppTheme.dangerRed.withValues(alpha: 0.85),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                            color: AppTheme.dangerRed.withValues(alpha: 0.25),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: ElevatedButton.icon(
                        onPressed: () => _next(false),
                        icon: const Icon(
                          Icons.refresh_rounded,
                          size: 18,
                          semanticLabel: 'Review again',
                        ),
                        label: Text(
                          'Needs Work',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            AppTheme.successGreen,
                            AppTheme.successGreen.withValues(alpha: 0.85),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                            color:
                                AppTheme.successGreen.withValues(alpha: 0.25),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: ElevatedButton.icon(
                        onPressed: () => _next(true),
                        icon: const Icon(
                          Icons.check_rounded,
                          size: 18,
                          semanticLabel: 'Knew the answer',
                        ),
                        label: Text(
                          'Knew It',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            else
              const SizedBox(height: 52),
          ],
        ),
      ),
    );
  }

  Widget _buildFrontCard() {
    return Container(
      key: ValueKey('front-$_currentIndex'),
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppTheme.surfaceWarm,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: AppTheme.borderSubtle.withValues(alpha: 0.6),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
          // Inner shadow illusion via gradient
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 4,
            spreadRadius: -2,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Subtle dot pattern
          Positioned.fill(
            child: CustomPaint(
              painter: _DotPatternPainter(
                color: AppTheme.borderSubtle.withValues(alpha: 0.2),
              ),
            ),
          ),
          // Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'QUESTION',
                  style: GoogleFonts.inter(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.8,
                    color: AppTheme.textSecondary.withValues(alpha: 0.7),
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  _card.front,
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    height: 1.5,
                    color: AppTheme.textPrimary,
                    letterSpacing: -0.2,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 28),
                FadeTransition(
                  opacity: _pulseAnimation,
                  child: Text(
                    'Tap to reveal answer',
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      color: AppTheme.textSecondary.withValues(alpha: 0.5),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackCard() {
    return Container(
      key: ValueKey('back-$_currentIndex'),
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: const Color(0xFFF5FDFB),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: AppTheme.accentTeal.withValues(alpha: 0.25),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: AppTheme.accentTeal.withValues(alpha: 0.08),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 4,
            spreadRadius: -2,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Thin teal top accent
          Container(
            width: 60,
            height: 3,
            decoration: BoxDecoration(
              color: AppTheme.accentTeal.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'ANSWER',
                    style: GoogleFonts.inter(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.8,
                      color: AppTheme.accentTeal.withValues(alpha: 0.7),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    _card.back,
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 19,
                      fontWeight: FontWeight.w700,
                      height: 1.45,
                      color: AppTheme.textPrimary,
                      letterSpacing: -0.2,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DotPatternPainter extends CustomPainter {
  final Color color;

  _DotPatternPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    const spacing = 24.0;
    const radius = 1.0;

    for (double x = spacing; x < size.width; x += spacing) {
      for (double y = spacing; y < size.height; y += spacing) {
        canvas.drawCircle(Offset(x, y), radius, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant _DotPatternPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}

class _FlashcardResultsSheet extends StatefulWidget {
  final int knewIt;
  final int needsWork;
  final int total;
  final VoidCallback onDone;

  const _FlashcardResultsSheet({
    required this.knewIt,
    required this.needsWork,
    required this.total,
    required this.onDone,
  });

  @override
  State<_FlashcardResultsSheet> createState() => _FlashcardResultsSheetState();
}

class _FlashcardResultsSheetState extends State<_FlashcardResultsSheet>
    with SingleTickerProviderStateMixin {
  late AnimationController _counterController;
  late Animation<double> _counterAnimation;

  @override
  void initState() {
    super.initState();
    _counterController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _counterAnimation = CurvedAnimation(
      parent: _counterController,
      curve: Curves.easeOutCubic,
    );
    _counterController.forward();
  }

  @override
  void dispose() {
    _counterController.dispose();
    super.dispose();
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
          // Handle bar
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: AppTheme.borderSubtle,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 32),

          Text(
            'Session Complete',
            style: GoogleFonts.playfairDisplay(
              fontSize: 26,
              fontWeight: FontWeight.w700,
              color: AppTheme.primaryNavy,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 32),

          AnimatedBuilder(
            animation: _counterAnimation,
            builder: (context, child) {
              final knewItAnimated =
                  (widget.knewIt * _counterAnimation.value).round();
              final needsWorkAnimated =
                  (widget.needsWork * _counterAnimation.value).round();

              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildStatColumn(
                    value: '$knewItAnimated',
                    label: 'Knew It',
                    color: AppTheme.successGreen,
                    icon: Icons.check_circle_rounded,
                  ),
                  Container(
                    width: 1,
                    height: 60,
                    color: AppTheme.borderSubtle,
                  ),
                  _buildStatColumn(
                    value: '$needsWorkAnimated',
                    label: 'Needs Work',
                    color: AppTheme.dangerRed,
                    icon: Icons.refresh_rounded,
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 36),

          SizedBox(
            width: double.infinity,
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    AppTheme.primaryNavy,
                    AppTheme.secondaryNavy,
                  ],
                ),
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.primaryNavy.withValues(alpha: 0.25),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ElevatedButton(
                onPressed: widget.onDone,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
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
          ),
        ],
      ),
    );
  }

  Widget _buildStatColumn({
    required String value,
    required String label,
    required Color color,
    required IconData icon,
  }) {
    return Column(
      children: [
        Icon(
          icon,
          color: color,
          size: 28,
          semanticLabel: label,
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: GoogleFonts.inter(
            fontSize: 40,
            fontWeight: FontWeight.w800,
            color: color,
            letterSpacing: -1,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 13,
            color: AppTheme.textSecondary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
