import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme/app_theme.dart';
import '../../core/widgets/shared_widgets.dart';
import '../../data/spaced_repetition_service.dart';
import '../../data/models/flashcard_model.dart';
import '../../core/models/quiz_model.dart';
import '../../data/module_registry.dart';

/// Daily Review screen presenting a mixed stack of spaced-repetition items.
class DailyReviewScreen extends StatefulWidget {
  const DailyReviewScreen({super.key});

  @override
  State<DailyReviewScreen> createState() => _DailyReviewScreenState();
}

class _DailyReviewScreenState extends State<DailyReviewScreen>
    with TickerProviderStateMixin {
  List<ReviewRecord> _stack = [];
  int _currentIndex = 0;
  bool _loading = true;
  bool _sessionComplete = false;
  int _streak = 0;
  int _correctCount = 0;
  int _reviewedCount = 0;

  // For flashcard-type items
  bool _showBack = false;
  late AnimationController _flipController;
  late Animation<double> _flipAnimation;

  // For quiz-type items
  int? _selectedOption;
  bool _answered = false;

  // Quality rating overlay state
  bool _showQualityRating = false;

  late AnimationController _slideController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _flipController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _flipAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _flipController, curve: Curves.easeInOutCubic),
    );
    _slideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.easeOutCubic,
    ));
    _slideController.value = 1.0;

    _loadStack();
  }

  @override
  void dispose() {
    _flipController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  Future<void> _loadStack() async {
    final stack = await SpacedRepetitionService.getDailyStack();
    final streak = await SpacedRepetitionService.getStreak();
    setState(() {
      _stack = stack;
      _streak = streak;
      _loading = false;
    });
  }

  ReviewRecord? get _currentRecord =>
      _currentIndex < _stack.length ? _stack[_currentIndex] : null;

  // Resolve the current item to a concrete content type
  _ResolvedItem? _resolveItem(ReviewRecord record) {
    final id = record.itemId;

    // Try flashcard: fc_{moduleId}_{index}
    if (id.startsWith('fc_')) {
      final parts = id.split('_');
      if (parts.length >= 3) {
        final moduleId = parts.sublist(1, parts.length - 1).join('_');
        final index = int.tryParse(parts.last);
        if (index != null) {
          final entry = ModuleRegistry.modules
              .where((m) => m.id == moduleId)
              .firstOrNull;
          if (entry != null) {
            final cards = entry.flashcards();
            if (index < cards.length) {
              return _ResolvedItem.flashcard(cards[index], entry.title);
            }
          }
        }
      }
    }

    // Try quiz: qz_{moduleId}_{index}
    if (id.startsWith('qz_')) {
      final parts = id.split('_');
      if (parts.length >= 3) {
        final moduleId = parts.sublist(1, parts.length - 1).join('_');
        final index = int.tryParse(parts.last);
        if (index != null) {
          final entry = ModuleRegistry.modules
              .where((m) => m.id == moduleId)
              .firstOrNull;
          if (entry != null) {
            final questions = entry.quizQuestions();
            if (index < questions.length) {
              return _ResolvedItem.quiz(questions[index], entry.title);
            }
          }
        }
      }
    }

    return null;
  }

  void _flip() {
    if (_showBack) {
      _flipController.reverse();
    } else {
      _flipController.forward();
    }
    setState(() => _showBack = !_showBack);
  }

  void _rateAndAdvance(int quality) {
    final record = _currentRecord;
    if (record == null) return;

    SpacedRepetitionService.saveReview(record.itemId, quality);

    setState(() {
      _reviewedCount++;
      if (quality >= 3) _correctCount++;
      _showQualityRating = false;
    });

    if (_currentIndex >= _stack.length - 1) {
      _completeSession();
    } else {
      _flipController.reset();
      _slideController.reset();
      setState(() {
        _currentIndex++;
        _showBack = false;
        _selectedOption = null;
        _answered = false;
      });
      _slideController.forward();
    }
  }

  void _selectQuizAnswer(int index, QuizQuestion question) {
    if (_answered) return;
    setState(() {
      _selectedOption = index;
      _answered = true;
    });

    // Auto-rate based on correctness
    final quality = (index == question.correctIndex) ? 4 : 1;

    // Delay to show answer feedback before advancing
    Future.delayed(const Duration(milliseconds: 1200), () {
      if (mounted) {
        _rateAndAdvance(quality);
      }
    });
  }

  void _completeSession() {
    setState(() => _sessionComplete = true);
    SpacedRepetitionService.getStreak().then((s) {
      if (mounted) setState(() => _streak = s);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return Scaffold(
        appBar: AppBar(title: const Text('Daily Review')),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    if (_stack.isEmpty) {
      return _buildEmptyState();
    }

    if (_sessionComplete) {
      return _buildCompletionScreen();
    }

    final record = _currentRecord!;
    final resolved = _resolveItem(record);

    return Scaffold(
      appBar: AppBar(title: const Text('Daily Review')),
      body: Column(
        children: [
          // Stats header
          _buildStatsHeader(),
          // Progress bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(1.5),
              child: LinearProgressIndicator(
                value: (_currentIndex + 1) / _stack.length,
                backgroundColor: AppTheme.borderSubtle.withValues(alpha: 0.5),
                valueColor:
                    const AlwaysStoppedAnimation(AppTheme.accentTeal),
                minHeight: 3,
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Content
          Expanded(
            child: SlideTransition(
              position: _slideAnimation,
              child: resolved != null
                  ? _buildItemCard(resolved)
                  : _buildUnresolvableCard(record),
            ),
          ),
          // Quality rating buttons for flashcards
          if (_showQualityRating) _buildQualityButtons(),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildStatsHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
      child: Row(
        children: [
          Text(
            'Card ${_currentIndex + 1} of ${_stack.length}',
            style: GoogleFonts.inter(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: AppTheme.textSecondary,
            ),
          ),
          const Spacer(),
          if (_streak > 0) ...[
            Icon(Icons.local_fire_department_rounded,
                size: 16, color: AppTheme.accentCopper),
            const SizedBox(width: 4),
            Text(
              '$_streak day streak',
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppTheme.accentCopper,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildItemCard(_ResolvedItem item) {
    switch (item.type) {
      case _ItemType.flashcard:
        return _buildFlashcardReview(item.flashcard!, item.moduleName);
      case _ItemType.quiz:
        return _buildQuizReview(item.question!, item.moduleName);
    }
  }

  Widget _buildFlashcardReview(Flashcard card, String moduleName) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          // Module label
          Align(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: AppTheme.accentCopper.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.style_rounded,
                          size: 12, color: AppTheme.accentCopper),
                      const SizedBox(width: 4),
                      Text(
                        'Flashcard',
                        style: GoogleFonts.inter(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.accentCopper,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                if (card.boardReadiness != null)
                  BoardReadinessChip(boardReadiness: card.boardReadiness),
              ],
            ),
          ),
          const SizedBox(height: 12),
          // Card
          Expanded(
            child: GestureDetector(
              onTap: () {
                if (!_showBack) {
                  _flip();
                }
              },
              child: AnimatedBuilder(
                animation: _flipAnimation,
                builder: (context, child) {
                  final angle = _flipAnimation.value * 3.14159;
                  final showFront = angle <= 3.14159 / 2;
                  return Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateY(angle),
                    child: showFront
                        ? _buildFlashcardFront(card)
                        : Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.identity()..rotateY(3.14159),
                            child: _buildFlashcardBack(card),
                          ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Show quality buttons after flip
          if (_showBack && !_showQualityRating)
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => setState(() => _showQualityRating = true),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.accentTeal,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: Text(
                  'Rate Your Recall',
                  style: GoogleFonts.inter(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildFlashcardFront(Flashcard card) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppTheme.borderSubtle.withValues(alpha: 0.6),
        ),
        boxShadow: AppTheme.shadowCard,
      ),
      child: Column(
        children: [
          Container(height: 3, color: AppTheme.accentCopper),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Center(
                child: Text(
                  card.front,
                  style: GoogleFonts.sourceSerif4(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    height: 1.5,
                    color: AppTheme.primaryNavy,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
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
    );
  }

  Widget _buildFlashcardBack(Flashcard card) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFF0FDFA),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppTheme.accentTeal.withValues(alpha: 0.2),
        ),
        boxShadow: AppTheme.shadowCard,
      ),
      child: Column(
        children: [
          Container(height: 3, color: AppTheme.accentTeal),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Center(
                child: SingleChildScrollView(
                  child: Text(
                    card.back,
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
          ),
        ],
      ),
    );
  }

  Widget _buildQuizReview(QuizQuestion question, String moduleName) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Type label
          Row(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: AppTheme.accentTeal.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.quiz_rounded,
                        size: 12, color: AppTheme.accentTeal),
                    const SizedBox(width: 4),
                    Text(
                      'Quiz',
                      style: GoogleFonts.inter(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.accentTeal,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              if (question.boardReadiness != null)
                BoardReadinessChip(boardReadiness: question.boardReadiness),
            ],
          ),
          const SizedBox(height: 16),
          // Question
          Text(
            question.question,
            style: GoogleFonts.sourceSerif4(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              height: 1.5,
              color: AppTheme.primaryNavy,
            ),
          ),
          const SizedBox(height: 20),
          // Options
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(question.options.length, (i) {
                  final letter = String.fromCharCode(65 + i);
                  final isCorrect = i == question.correctIndex;
                  final isSelected = i == _selectedOption;

                  Color bgColor = Colors.white;
                  Color borderColor = const Color(0xFFE2E8F0);
                  Color leftBorder = Colors.transparent;

                  if (_answered) {
                    if (isCorrect) {
                      bgColor = const Color(0xFFF0FDF4);
                      borderColor =
                          AppTheme.successGreen.withValues(alpha: 0.4);
                      leftBorder = AppTheme.successGreen;
                    } else if (isSelected) {
                      bgColor = const Color(0xFFFEF2F2);
                      borderColor =
                          AppTheme.dangerRed.withValues(alpha: 0.4);
                      leftBorder = AppTheme.dangerRed;
                    }
                  }

                  return GestureDetector(
                    onTap: () => _selectQuizAnswer(i, question),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: double.infinity,
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        color: bgColor,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: borderColor),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            width: 3,
                            constraints:
                                const BoxConstraints(minHeight: 56),
                            decoration: BoxDecoration(
                              color: leftBorder,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(12),
                                bottomLeft: Radius.circular(12),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 12, top: 12, bottom: 12),
                            child: Container(
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                color: _answered && isCorrect
                                    ? AppTheme.successGreen
                                    : _answered && isSelected
                                        ? AppTheme.dangerRed
                                        : AppTheme.surfaceLight,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: _answered && isCorrect
                                    ? const Icon(Icons.check_rounded,
                                        size: 16, color: Colors.white)
                                    : _answered && isSelected
                                        ? const Icon(Icons.close_rounded,
                                            size: 16,
                                            color: Colors.white)
                                        : Text(
                                            letter,
                                            style: GoogleFonts.inter(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700,
                                              color: AppTheme.gray400,
                                            ),
                                          ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 12),
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    question.options[i],
                                    style: GoogleFonts.inter(
                                      fontSize: 15,
                                      height: 1.6,
                                      color: AppTheme.textPrimary,
                                      fontWeight: _answered && isCorrect
                                          ? FontWeight.w600
                                          : FontWeight.w400,
                                    ),
                                  ),
                                  if (_answered &&
                                      isCorrect &&
                                      question.explanation.isNotEmpty)
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(top: 10),
                                      child: Container(
                                        padding: const EdgeInsets.only(
                                            left: 10),
                                        decoration: const BoxDecoration(
                                          border: Border(
                                            left: BorderSide(
                                              color:
                                                  AppTheme.successGreen,
                                              width: 2,
                                            ),
                                          ),
                                        ),
                                        child: Text(
                                          question.explanation,
                                          style: GoogleFonts.inter(
                                            fontSize: 13,
                                            height: 1.6,
                                            color:
                                                const Color(0xFF065F46),
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
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQualityButtons() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
      child: Column(
        children: [
          Text(
            'How well did you know this?',
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppTheme.textSecondary,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              _QualityButton(
                label: 'Again',
                quality: 1,
                color: AppTheme.dangerRed,
                onTap: () => _rateAndAdvance(1),
              ),
              const SizedBox(width: 8),
              _QualityButton(
                label: 'Hard',
                quality: 3,
                color: AppTheme.warningAmber,
                onTap: () => _rateAndAdvance(3),
              ),
              const SizedBox(width: 8),
              _QualityButton(
                label: 'Good',
                quality: 4,
                color: AppTheme.successGreen,
                onTap: () => _rateAndAdvance(4),
              ),
              const SizedBox(width: 8),
              _QualityButton(
                label: 'Easy',
                quality: 5,
                color: AppTheme.accentTeal,
                onTap: () => _rateAndAdvance(5),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildUnresolvableCard(ReviewRecord record) {
    // Item can't be resolved (content removed?), skip it
    Future.microtask(() => _rateAndAdvance(4));
    return const Center(child: CircularProgressIndicator());
  }

  Widget _buildEmptyState() {
    return Scaffold(
      appBar: AppBar(title: const Text('Daily Review')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: AppTheme.successGreen.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check_circle_rounded,
                  size: 40,
                  color: AppTheme.successGreen,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'All Caught Up',
                style: GoogleFonts.sourceSerif4(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.primaryNavy,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'No items due for review right now.\nComplete quizzes and flashcards to build your review stack.',
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  height: 1.6,
                  color: AppTheme.textSecondary,
                ),
              ),
              if (_streak > 0) ...[
                const SizedBox(height: 20),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.local_fire_department_rounded,
                        size: 20, color: AppTheme.accentCopper),
                    const SizedBox(width: 6),
                    Text(
                      '$_streak day streak',
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.accentCopper,
                      ),
                    ),
                  ],
                ),
              ],
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.accentTeal,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Back to Home',
                    style: GoogleFonts.inter(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
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

  Widget _buildCompletionScreen() {
    final accuracy = _reviewedCount > 0
        ? ((_correctCount / _reviewedCount) * 100).round()
        : 0;

    Color scoreColor;
    if (accuracy >= 80) {
      scoreColor = AppTheme.successGreen;
    } else if (accuracy >= 60) {
      scoreColor = AppTheme.warningAmber;
    } else {
      scoreColor = AppTheme.dangerRed;
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Daily Review')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Score ring
              SizedBox(
                width: 120,
                height: 120,
                child: CustomPaint(
                  painter: ScoreRingPainter(
                    progress: _reviewedCount > 0
                        ? _correctCount / _reviewedCount
                        : 0,
                    color: scoreColor,
                    trackColor: AppTheme.borderSubtle.withValues(alpha: 0.4),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '$accuracy%',
                          style: GoogleFonts.sourceSerif4(
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                            color: scoreColor,
                            height: 1.0,
                          ),
                        ),
                        Text(
                          'accuracy',
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
              ),
              const SizedBox(height: 24),
              Text(
                'Session Complete',
                style: GoogleFonts.sourceSerif4(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.primaryNavy,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                '$_reviewedCount items reviewed',
                style: GoogleFonts.inter(
                  fontSize: 15,
                  color: AppTheme.textSecondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),
              // Stats
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _CompletionStat(
                    icon: Icons.check_circle_rounded,
                    color: AppTheme.successGreen,
                    value: '$_correctCount',
                    label: 'Correct',
                  ),
                  const SizedBox(width: 32),
                  _CompletionStat(
                    icon: Icons.refresh_rounded,
                    color: AppTheme.dangerRed,
                    value: '${_reviewedCount - _correctCount}',
                    label: 'To Review',
                  ),
                  if (_streak > 0) ...[
                    const SizedBox(width: 32),
                    _CompletionStat(
                      icon: Icons.local_fire_department_rounded,
                      color: AppTheme.accentCopper,
                      value: '$_streak',
                      label: 'Streak',
                    ),
                  ],
                ],
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: scoreColor,
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
        ),
      ),
    );
  }
}

// ─── HELPER TYPES ───

enum _ItemType { flashcard, quiz }

class _ResolvedItem {
  final _ItemType type;
  final Flashcard? flashcard;
  final QuizQuestion? question;
  final String moduleName;

  _ResolvedItem.flashcard(Flashcard card, this.moduleName)
      : type = _ItemType.flashcard,
        flashcard = card,
        question = null;

  _ResolvedItem.quiz(QuizQuestion q, this.moduleName)
      : type = _ItemType.quiz,
        question = q,
        flashcard = null;
}

// ─── QUALITY BUTTON ───

class _QualityButton extends StatelessWidget {
  final String label;
  final int quality;
  final Color color;
  final VoidCallback onTap;

  const _QualityButton({
    required this.label,
    required this.quality,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 44,
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: color.withValues(alpha: 0.12),
            foregroundColor: color,
            elevation: 0,
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(color: color.withValues(alpha: 0.3)),
            ),
          ),
          child: Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 13,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}

// ─── COMPLETION STAT ───

class _CompletionStat extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String value;
  final String label;

  const _CompletionStat({
    required this.icon,
    required this.color,
    required this.value,
    required this.label,
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
