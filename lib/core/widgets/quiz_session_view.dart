import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/quiz_model.dart';
import '../theme/app_theme.dart';

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

  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;

  QuizQuestion get _currentQuestion => widget.questions[_currentIndex];
  bool get _isLastQuestion => _currentIndex >= widget.questions.length - 1;

  @override
  void initState() {
    super.initState();
    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.97).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _scaleController.dispose();
    super.dispose();
  }

  void _selectAnswer(int index) {
    if (_answered) return;
    _scaleController.forward().then((_) => _scaleController.reverse());
    setState(() {
      _selectedIndex = index;
      _answered = true;
      _total++;
      if (index == _currentQuestion.correctIndex) _correct++;
    });
  }

  void _nextQuestion() {
    if (_isLastQuestion) {
      _showResults();
      return;
    }
    setState(() {
      _currentIndex++;
      _selectedIndex = null;
      _answered = false;
    });
  }

  void _showResults() {
    final percentage = ((_correct / _total) * 100).round();
    final passed = _correct / _total >= 0.7;

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
        passed: passed,
        onDone: () {
          Navigator.of(ctx).pop();
          Navigator.of(context).pop();
        },
      ),
    );
  }

  Color _getOptionColor(int index) {
    if (!_answered) return Colors.white;
    if (index == _currentQuestion.correctIndex) return const Color(0xFFF0FDF4);
    if (index == _selectedIndex) return const Color(0xFFFEF2F2);
    return Colors.white;
  }

  Color _getLeftBorderColor(int index) {
    if (!_answered) {
      return index == _selectedIndex
          ? AppTheme.accentTeal
          : Colors.transparent;
    }
    if (index == _currentQuestion.correctIndex) return AppTheme.successGreen;
    if (index == _selectedIndex) return AppTheme.dangerRed;
    return Colors.transparent;
  }

  Color _getOptionBorderColor(int index) {
    if (!_answered) {
      return index == _selectedIndex
          ? AppTheme.accentTeal.withValues(alpha: 0.4)
          : AppTheme.borderSubtle;
    }
    if (index == _currentQuestion.correctIndex) {
      return AppTheme.successGreen.withValues(alpha: 0.3);
    }
    if (index == _selectedIndex) {
      return AppTheme.dangerRed.withValues(alpha: 0.3);
    }
    return AppTheme.borderSubtle.withValues(alpha: 0.5);
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
                '${_currentIndex + 1}/${widget.questions.length}',
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 350),
          switchInCurve: Curves.easeOut,
          switchOutCurve: Curves.easeIn,
          transitionBuilder: (child, animation) {
            return FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0.04, 0),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              ),
            );
          },
          child: Column(
            key: ValueKey<int>(_currentIndex),
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Progress bar
              ClipRRect(
                borderRadius: BorderRadius.circular(2),
                child: LinearProgressIndicator(
                  value: (_currentIndex + 1) / widget.questions.length,
                  backgroundColor: AppTheme.borderSubtle.withValues(alpha: 0.5),
                  valueColor: AlwaysStoppedAnimation(
                    AppTheme.accentTeal.withValues(alpha: 0.85),
                  ),
                  minHeight: 4,
                ),
              ),
              const SizedBox(height: 28),

              // Question
              Text(
                _currentQuestion.question,
                style: GoogleFonts.playfairDisplay(
                  fontSize: 19,
                  fontWeight: FontWeight.w700,
                  height: 1.35,
                  color: AppTheme.textPrimary,
                  letterSpacing: -0.3,
                ),
              ),
              const SizedBox(height: 24),

              // Options
              ...List.generate(_currentQuestion.options.length, (i) {
                final isSelected = _selectedIndex == i;
                return GestureDetector(
                  onTap: () => _selectAnswer(i),
                  child: AnimatedScale(
                    scale: (_answered && isSelected) ? 1.0 : 1.0,
                    duration: const Duration(milliseconds: 150),
                    child: ScaleTransition(
                      scale: (isSelected && _answered)
                          ? _scaleAnimation
                          : const AlwaysStoppedAnimation(1.0),
                      child: Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          color: _getOptionColor(i),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: _getOptionBorderColor(i),
                            width: 1,
                          ),
                          boxShadow: [
                            if (!_answered)
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.03),
                                blurRadius: 6,
                                offset: const Offset(0, 2),
                              ),
                          ],
                        ),
                        child: Row(
                          children: [
                            // Left accent border
                            Container(
                              width: 4,
                              height: 52,
                              decoration: BoxDecoration(
                                color: _getLeftBorderColor(i),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  bottomLeft: Radius.circular(12),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 14,
                                  vertical: 14,
                                ),
                                child: Text(
                                  _currentQuestion.options[i],
                                  style: GoogleFonts.inter(
                                    fontSize: 14,
                                    height: 1.45,
                                    color: AppTheme.textPrimary,
                                    fontWeight: (_answered &&
                                            i ==
                                                _currentQuestion.correctIndex)
                                        ? FontWeight.w600
                                        : FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                            if (_answered &&
                                i == _currentQuestion.correctIndex)
                              const Padding(
                                padding: EdgeInsets.only(right: 14),
                                child: Icon(
                                  Icons.check_circle_rounded,
                                  color: AppTheme.successGreen,
                                  size: 20,
                                  semanticLabel: 'Correct answer',
                                ),
                              ),
                            if (_answered &&
                                i == _selectedIndex &&
                                i != _currentQuestion.correctIndex)
                              const Padding(
                                padding: EdgeInsets.only(right: 14),
                                child: Icon(
                                  Icons.cancel_rounded,
                                  color: AppTheme.dangerRed,
                                  size: 20,
                                  semanticLabel: 'Incorrect answer',
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),

              // Explanation
              if (_answered) ...[
                const SizedBox(height: 16),
                Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        AppTheme.pearlBackground,
                        Color(0xFFFFF8E1),
                        Color(0xFFFFFDF5),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: AppTheme.pearlBorder.withValues(alpha: 0.25),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 4,
                        decoration: BoxDecoration(
                          color: AppTheme.accentCopper,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(14),
                            bottomLeft: Radius.circular(14),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.school_rounded,
                                    color: AppTheme.accentCopper,
                                    size: 18,
                                    semanticLabel: 'Explanation',
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    'Explanation',
                                    style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w700,
                                      color: const Color(0xFF92400E),
                                      fontSize: 14,
                                      letterSpacing: -0.1,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Text(
                                _currentQuestion.explanation,
                                style: GoogleFonts.inter(
                                  fontSize: 13,
                                  height: 1.6,
                                  color: const Color(0xFF78350F),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // Next button with gradient
                SizedBox(
                  width: double.infinity,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          AppTheme.accentTeal,
                          Color(0xFF0F766E),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: AppTheme.accentTeal.withValues(alpha: 0.3),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      onPressed: _nextQuestion,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        _isLastQuestion ? 'See Results' : 'Next Question',
                        style: GoogleFonts.inter(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.1,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _QuizResultsSheet extends StatelessWidget {
  final int correct;
  final int total;
  final int percentage;
  final bool passed;
  final VoidCallback onDone;

  const _QuizResultsSheet({
    required this.correct,
    required this.total,
    required this.percentage,
    required this.passed,
    required this.onDone,
  });

  @override
  Widget build(BuildContext context) {
    final scoreColor = passed ? AppTheme.successGreen : AppTheme.dangerRed;

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
            'Quiz Complete',
            style: GoogleFonts.playfairDisplay(
              fontSize: 26,
              fontWeight: FontWeight.w700,
              color: AppTheme.primaryNavy,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 28),

          // Circular score indicator
          SizedBox(
            width: 140,
            height: 140,
            child: CustomPaint(
              painter: _ScoreRingPainter(
                progress: correct / total,
                color: scoreColor,
                trackColor: AppTheme.borderSubtle.withValues(alpha: 0.4),
              ),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '$percentage%',
                      style: GoogleFonts.inter(
                        fontSize: 36,
                        fontWeight: FontWeight.w800,
                        color: scoreColor,
                        letterSpacing: -1,
                      ),
                    ),
                    Text(
                      '$correct / $total',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: AppTheme.textSecondary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),

          Text(
            passed ? 'Great work!' : 'Keep studying!',
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: scoreColor,
            ),
          ),
          const SizedBox(height: 32),

          SizedBox(
            width: double.infinity,
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
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
                onPressed: onDone,
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
}

class _ScoreRingPainter extends CustomPainter {
  final double progress;
  final Color color;
  final Color trackColor;

  _ScoreRingPainter({
    required this.progress,
    required this.color,
    required this.trackColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 8;
    const strokeWidth = 8.0;

    // Track
    final trackPaint = Paint()
      ..color = trackColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, trackPaint);

    // Progress
    final progressPaint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      2 * pi * progress,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant _ScoreRingPainter oldDelegate) {
    return oldDelegate.progress != progress || oldDelegate.color != color;
  }
}
