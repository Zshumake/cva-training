import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/quiz_model.dart';
import '../theme/app_theme.dart';
import '../../data/progress_service.dart';
import '../../data/spaced_repetition_service.dart';
import 'shared_widgets.dart';

class QuizSessionView extends StatefulWidget {
  final List<QuizQuestion> questions;
  final String title;

  const QuizSessionView({
    super.key,
    required this.questions,
    required this.title,
  });

  @override
  State<QuizSessionView> createState() => _QuizSessionViewState();
}

class _QuizSessionViewState extends State<QuizSessionView>
    with TickerProviderStateMixin {
  int _currentIndex = 0;
  int? _selectedIndex;
  bool _answered = false;
  int _correct = 0;
  int _total = 0;
  bool _hintVisible = false;
  bool _quizComplete = false;

  late AnimationController _slideController;
  late Animation<Offset> _slideAnimation;
  late AnimationController _nextButtonController;
  late Animation<double> _nextButtonFade;
  late Animation<Offset> _nextButtonSlide;
  late AnimationController _optionStaggerController;
  late AnimationController _hintController;
  late Animation<double> _hintAnimation;

  // Per-option scale controllers for selection animation
  final List<AnimationController> _optionScaleControllers = [];
  final List<Animation<double>> _optionScaleAnimations = [];

  QuizQuestion get _currentQuestion => widget.questions[_currentIndex];
  bool get _isLastQuestion => _currentIndex >= widget.questions.length - 1;

  @override
  void initState() {
    super.initState();

    _slideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.easeOutCubic,
    ));
    _slideController.value = 1.0;

    _nextButtonController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _nextButtonFade = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _nextButtonController, curve: Curves.easeOut),
    );
    _nextButtonSlide = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _nextButtonController,
      curve: Curves.easeOut,
    ));

    _optionStaggerController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _optionStaggerController.value = 1.0;

    _hintController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    _hintAnimation = CurvedAnimation(
      parent: _hintController,
      curve: Curves.easeOutCubic,
    );

    _buildOptionScaleControllers();
  }

  void _buildOptionScaleControllers() {
    for (final c in _optionScaleControllers) {
      c.dispose();
    }
    _optionScaleControllers.clear();
    _optionScaleAnimations.clear();

    for (int i = 0; i < 6; i++) {
      final controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 150),
      );
      final animation = Tween<double>(begin: 1.0, end: 1.02).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeInOut),
      );
      _optionScaleControllers.add(controller);
      _optionScaleAnimations.add(animation);
    }
  }

  @override
  void dispose() {
    _slideController.dispose();
    _nextButtonController.dispose();
    _optionStaggerController.dispose();
    _hintController.dispose();
    for (final c in _optionScaleControllers) {
      c.dispose();
    }
    super.dispose();
  }

  void _selectAnswer(int index) {
    if (_answered) return;

    if (index < _optionScaleControllers.length) {
      _optionScaleControllers[index]
          .forward()
          .then((_) => _optionScaleControllers[index].reverse());
    }

    setState(() {
      _selectedIndex = index;
      _answered = true;
      _total++;
      if (index == _currentQuestion.correctIndex) _correct++;
    });

    // Register with spaced repetition service
    final moduleId = _currentQuestion.moduleId ?? widget.title;
    final questionIndex = _currentIndex;
    final itemId = 'qz_${moduleId}_$questionIndex';
    final quality = (index == _currentQuestion.correctIndex) ? 4 : 1;
    SpacedRepetitionService.saveReview(itemId, quality);

    _nextButtonController.forward();
  }

  void _nextQuestion() {
    if (_isLastQuestion) {
      _showResults();
      return;
    }

    _nextButtonController.reset();
    _hintController.reset();

    _slideController.reset();
    _optionStaggerController.reset();

    setState(() {
      _currentIndex++;
      _selectedIndex = null;
      _answered = false;
      _hintVisible = false;
    });

    _slideController.forward();
    _optionStaggerController.forward();
  }

  void _toggleHint() {
    setState(() {
      _hintVisible = !_hintVisible;
    });
    if (_hintVisible) {
      _hintController.forward();
    } else {
      _hintController.reverse();
    }
  }

  void _showResults() {
    final percentage = ((_correct / _total) * 100).round();

    setState(() => _quizComplete = true);
    ProgressService.saveQuizScore(widget.title, _correct, _total);

    showModalBottomSheet(
      context: context,
      isDismissible: false,
      enableDrag: false,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => _QuizResultsSheet(
        correct: _correct,
        total: _total,
        percentage: percentage,
        onDone: () {
          Navigator.of(ctx).pop();
          Navigator.of(context).pop();
        },
      ),
    );
  }

  Color _getOptionBgColor(int index) {
    if (!_answered) return Colors.white;
    if (index == _currentQuestion.correctIndex) return const Color(0xFFF0FDF4);
    if (index == _selectedIndex) return const Color(0xFFFEF2F2);
    return Colors.white;
  }

  Color _getOptionBorderColor(int index) {
    if (!_answered) {
      return index == _selectedIndex
          ? AppTheme.accentTeal
          : const Color(0xFFE2E8F0);
    }
    if (index == _currentQuestion.correctIndex) {
      return AppTheme.successGreen.withValues(alpha: 0.4);
    }
    if (index == _selectedIndex) {
      return AppTheme.dangerRed.withValues(alpha: 0.4);
    }
    return const Color(0xFFE2E8F0);
  }

  Color _getLeftBorderColor(int index) {
    if (!_answered) return Colors.transparent;
    if (index == _currentQuestion.correctIndex) return AppTheme.successGreen;
    if (index == _selectedIndex) return AppTheme.dangerRed;
    return Colors.transparent;
  }

  Color _getCircleBgColor(int index) {
    if (!_answered) {
      return index == _selectedIndex
          ? AppTheme.accentTeal
          : AppTheme.surfaceLight;
    }
    if (index == _currentQuestion.correctIndex) return AppTheme.successGreen;
    if (index == _selectedIndex) return AppTheme.dangerRed;
    return AppTheme.surfaceLight;
  }

  Color _getCircleTextColor(int index) {
    if (!_answered) {
      return index == _selectedIndex ? Colors.white : AppTheme.gray400;
    }
    if (index == _currentQuestion.correctIndex) return Colors.white;
    if (index == _selectedIndex) return Colors.white;
    return AppTheme.gray400;
  }

  IconData? _getCircleIcon(int index) {
    if (!_answered) return null;
    if (index == _currentQuestion.correctIndex) return Icons.check_rounded;
    if (index == _selectedIndex) return Icons.close_rounded;
    return null;
  }

  Future<bool> _confirmLeave() async {
    return confirmLeaveDialog(
      context: context,
      title: 'Leave Quiz?',
      body:
          'You\'ve answered $_total of ${widget.questions.length} questions. Your progress will be lost.',
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: _quizComplete,
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
      body: SlideTransition(
        position: _slideAnimation,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
                child: Column(
                  key: ValueKey<int>(_currentIndex),
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Segmented progress display
                    Row(
                      children: [
                        Text(
                          'Question ${_currentIndex + 1} of ${widget.questions.length}',
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: AppTheme.textSecondary,
                          ),
                        ),
                        if (_currentQuestion.boardReadiness != null) ...[
                          const SizedBox(width: 10),
                          BoardReadinessChip(
                              boardReadiness: _currentQuestion.boardReadiness),
                        ],
                      ],
                    ),
                    const SizedBox(height: 10),

                    // Thin teal progress bar with rounded ends
                    ClipRRect(
                      borderRadius: BorderRadius.circular(1.5),
                      child: LinearProgressIndicator(
                        value: (_currentIndex + 1) / widget.questions.length,
                        backgroundColor:
                            AppTheme.borderSubtle.withValues(alpha: 0.5),
                        valueColor: const AlwaysStoppedAnimation(
                          AppTheme.accentTeal,
                        ),
                        minHeight: 3,
                      ),
                    ),
                    const SizedBox(height: 28),

                    // Question text
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 680),
                      child: Text(
                        _currentQuestion.question,
                        style: GoogleFonts.sourceSerif4(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          height: 1.5,
                          color: AppTheme.primaryNavy,
                        ),
                      ),
                    ),

                    // Hint system
                    if (_currentQuestion.hint != null) ...[
                      const SizedBox(height: 14),
                      GestureDetector(
                        onTap: _toggleHint,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFFBEB),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: const Color(0xFFFDE68A),
                              width: 1,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.lightbulb_outline_rounded,
                                size: 16,
                                color: Color(0xFF92400E),
                              ),
                              const SizedBox(width: 6),
                              Text(
                                _hintVisible ? 'Hide Hint' : 'Show Hint',
                                style: GoogleFonts.inter(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF92400E),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizeTransition(
                        sizeFactor: _hintAnimation,
                        axisAlignment: -1.0,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.lightbulb_rounded,
                                size: 16,
                                color: Color(0xFFD97706),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  _currentQuestion.hint!,
                                  style: GoogleFonts.inter(
                                    fontSize: 14,
                                    fontStyle: FontStyle.italic,
                                    height: 1.5,
                                    color: const Color(0xFF78350F),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],

                    const SizedBox(height: 24),

                    // Answer options
                    ...List.generate(_currentQuestion.options.length, (i) {
                      final optionLetter =
                          String.fromCharCode(65 + i); // A, B, C, D
                      final icon = _getCircleIcon(i);
                      final scaleAnim = i < _optionScaleAnimations.length
                          ? _optionScaleAnimations[i]
                          : const AlwaysStoppedAnimation<double>(1.0);

                      // Stagger delay for option fade-in
                      final staggerInterval = i * 50 / 300;
                      final optionFade = _optionStaggerController.drive(
                        Tween<double>(begin: 0.0, end: 1.0).chain(
                          CurveTween(
                            curve: Interval(
                              staggerInterval.clamp(0.0, 0.8),
                              (staggerInterval + 0.5).clamp(0.0, 1.0),
                              curve: Curves.easeOut,
                            ),
                          ),
                        ),
                      );

                      return FadeTransition(
                        opacity: optionFade,
                        child: ScaleTransition(
                          scale: scaleAnim,
                          child: GestureDetector(
                            onTap: () => _selectAnswer(i),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.easeOut,
                              width: double.infinity,
                              margin: const EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                color: _getOptionBgColor(i),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: _getOptionBorderColor(i),
                                  width: 1,
                                ),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Left accent border for answered state
                                  AnimatedContainer(
                                    duration: const Duration(milliseconds: 200),
                                    width: 3,
                                    constraints:
                                        const BoxConstraints(minHeight: 56),
                                    decoration: BoxDecoration(
                                      color: _getLeftBorderColor(i),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(12),
                                        bottomLeft: Radius.circular(12),
                                      ),
                                    ),
                                  ),
                                  // Option letter circle
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 12,
                                      top: 12,
                                      bottom: 12,
                                    ),
                                    child: AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 200),
                                      width: 32,
                                      height: 32,
                                      decoration: BoxDecoration(
                                        color: _getCircleBgColor(i),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(
                                        child: icon != null
                                            ? Icon(
                                                icon,
                                                size: 16,
                                                color:
                                                    _getCircleTextColor(i),
                                              )
                                            : Text(
                                                optionLetter,
                                                style: GoogleFonts.inter(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700,
                                                  color:
                                                      _getCircleTextColor(i),
                                                ),
                                              ),
                                      ),
                                    ),
                                  ),
                                  // Option text
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 12,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            _currentQuestion.options[i],
                                            style: GoogleFonts.inter(
                                              fontSize: 15,
                                              height: 1.6,
                                              color: AppTheme.textPrimary,
                                              fontWeight:
                                                  (_answered &&
                                                          i ==
                                                              _currentQuestion
                                                                  .correctIndex)
                                                      ? FontWeight.w600
                                                      : FontWeight.w400,
                                            ),
                                          ),
                                          // Rationale below correct answer
                                          if (_answered &&
                                              i ==
                                                  _currentQuestion
                                                      .correctIndex &&
                                              _currentQuestion
                                                  .explanation.isNotEmpty)
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10),
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.only(
                                                        left: 10),
                                                decoration:
                                                    const BoxDecoration(
                                                  border: Border(
                                                    left: BorderSide(
                                                      color: AppTheme
                                                          .successGreen,
                                                      width: 2,
                                                    ),
                                                  ),
                                                ),
                                                child: Text(
                                                  _currentQuestion
                                                      .explanation,
                                                  style: GoogleFonts.inter(
                                                    fontSize: 13,
                                                    height: 1.6,
                                                    color:
                                                        const Color(
                                                            0xFF065F46),
                                                  ),
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),

            // Next button at bottom
            if (_answered)
              FadeTransition(
                opacity: _nextButtonFade,
                child: SlideTransition(
                  position: _nextButtonSlide,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
                    child: SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: _nextQuestion,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.accentTeal,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          _isLastQuestion
                              ? 'See Results'
                              : 'Next Question  \u2192',
                          style: GoogleFonts.inter(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Results bottom sheet
// ---------------------------------------------------------------------------

class _QuizResultsSheet extends StatefulWidget {
  final int correct;
  final int total;
  final int percentage;
  final VoidCallback onDone;

  const _QuizResultsSheet({
    required this.correct,
    required this.total,
    required this.percentage,
    required this.onDone,
  });

  @override
  State<_QuizResultsSheet> createState() => _QuizResultsSheetState();
}

class _QuizResultsSheetState extends State<_QuizResultsSheet>
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
    final ratio = widget.correct / widget.total;
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
            'Quiz Complete',
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
                        (widget.correct / widget.total) * _ringAnimation.value,
                    color: _scoreColor,
                    trackColor: AppTheme.borderSubtle.withValues(alpha: 0.4),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '${widget.correct}',
                          style: GoogleFonts.sourceSerif4(
                            fontSize: 36,
                            fontWeight: FontWeight.w700,
                            color: _scoreColor,
                            height: 1.0,
                          ),
                        ),
                        Text(
                          'of ${widget.total}',
                          style: GoogleFonts.inter(
                            fontSize: 13,
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
          const SizedBox(height: 20),

          Text(
            'You got ${widget.correct} out of ${widget.total} correct',
            style: GoogleFonts.inter(
              fontSize: 15,
              color: AppTheme.textSecondary,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 32),

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

