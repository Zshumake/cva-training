import 'dart:math';
import 'package:flutter/material.dart';
import '../../core/utils/responsive.dart';
import '../../data/models/flashcard_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import '../../data/module_data.dart';
import '../../data/module_registry.dart';
import '../../data/quiz_banks/stroke_quiz_bank.dart';
import '../../data/models/podcast_model.dart';
import '../../core/theme/app_theme.dart';
import '../../core/widgets/quiz_session_view.dart';
import '../../core/widgets/clinical_simulator_view.dart';
import '../../data/clinical_scenarios.dart';
import '../../data/models/clinical_scenario_model.dart';
import '../../data/spaced_repetition_service.dart';
import 'widgets/flashcard_view.dart';
import 'module_content_screen.dart';
import 'daily_review_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with TickerProviderStateMixin {
  late final AnimationController _heroController;
  late final AnimationController _cardsController;
  late final AnimationController _pulseController;
  AudioPlayer? _audioPlayer;

  int _srDueCount = 0;
  int _srStreak = 0;

  @override
  void initState() {
    super.initState();
    _heroController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    )..forward();
    _cardsController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);
    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) _cardsController.forward();
    });
    _loadSrStats();
  }

  Future<void> _loadSrStats() async {
    final due = await SpacedRepetitionService.getDueCount();
    final streak = await SpacedRepetitionService.getStreak();
    if (mounted) {
      setState(() {
        _srDueCount = due;
        _srStreak = streak;
      });
    }
  }

  @override
  void dispose() {
    _audioPlayer?.dispose();
    _heroController.dispose();
    _cardsController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final modules = ModuleData.standardModules;
    final registry = ModuleRegistry.modules;
    final hPadding = Responsive.screenPadding(context).horizontal / 2;
    final columns = Responsive.moduleGridColumns(context);

    return Scaffold(
      backgroundColor: AppTheme.surfaceWarm,
      floatingActionButton: _buildRandomQuizFab(context),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: Responsive.contentMaxWidth(context),
          ),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              // ─── HERO HEADER ───
              SliverAppBar(
                expandedHeight: 200,
                pinned: true,
                stretch: true,
                backgroundColor: AppTheme.primaryNavy,
                flexibleSpace: FlexibleSpaceBar(
                  background: _buildHero(modules),
                  title: Text(
                    'CVA Training',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w700,
                      fontSize: 17,
                      letterSpacing: -0.3,
                    ),
                  ),
                  titlePadding: EdgeInsets.only(left: hPadding, bottom: 14),
                ),
              ),

              // ─── DAILY REVIEW BANNER ───
              if (_srDueCount > 0 || _srStreak > 0)
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(hPadding, 16, hPadding, 0),
                    child: _DailyReviewBanner(
                      dueCount: _srDueCount,
                      streak: _srStreak,
                      pulseController: _pulseController,
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const DailyReviewScreen(),
                          ),
                        );
                        _loadSrStats();
                      },
                    ),
                  ),
                ),

              // ─── QUICK ACTIONS ───
              SliverToBoxAdapter(
                child: FadeTransition(
                  opacity: CurvedAnimation(
                    parent: _cardsController,
                    curve: Curves.easeOut,
                  ),
                  child: SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0, 0.12),
                      end: Offset.zero,
                    ).animate(CurvedAnimation(
                      parent: _cardsController,
                      curve: Curves.easeOut,
                    )),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(hPadding, 20, hPadding, 0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: _QuickActionCard(
                                  icon: Icons.quiz_rounded,
                                  label: 'Quiz Bank',
                                  sublabel: '${ModuleRegistry.totalQuizCount} questions',
                                  accentColor: AppTheme.accentTeal,
                                  onTap: () => _showQuizPicker(context),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: _QuickActionCard(
                                  icon: Icons.style_rounded,
                                  label: 'Flashcards',
                                  sublabel: '${ModuleRegistry.totalFlashcardCount} cards',
                                  accentColor: AppTheme.accentCopper,
                                  onTap: () => _showFlashcardPicker(context),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Expanded(
                                child: _QuickActionCard(
                                  icon: Icons.headphones_rounded,
                                  label: 'Podcasts',
                                  sublabel: '${ModuleRegistry.modulesWithPodcasts.length} episodes',
                                  accentColor: const Color(0xFF4F46E5),
                                  onTap: () => _showPodcastPicker(context),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: _QuickActionCard(
                                  icon: Icons.medical_services_rounded,
                                  label: 'Clinical Cases',
                                  sublabel: '${StrokeClinicalScenarios.all.length} scenarios',
                                  accentColor: AppTheme.dangerRed,
                                  onTap: () => _showClinicalCasesPicker(context),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              // ─── SECTION HEADER ───
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(hPadding, 24, hPadding, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'STUDY MODULES',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.3,
                          color: AppTheme.primaryNavy,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        height: 1,
                        color: AppTheme.gray250,
                      ),
                      const SizedBox(height: 12),
                    ],
                  ),
                ),
              ),

              // ─── MODULE CARDS ───
              if (columns > 1)
                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: hPadding),
                  sliver: SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: columns,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 8,
                      mainAxisExtent: 140,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final entry = registry[index];
                        final module = modules[index];

                        return TweenAnimationBuilder<double>(
                          tween: Tween(begin: 0.0, end: 1.0),
                          duration: Duration(milliseconds: 200 + (index * 40)),
                          curve: Curves.easeOut,
                          builder: (context, value, child) {
                            return Opacity(
                              opacity: value.clamp(0.0, 1.0),
                              child: Transform.translate(
                                offset: Offset(0, 16 * (1 - value)),
                                child: child,
                              ),
                            );
                          },
                          child: _ModuleCard(
                            entry: entry,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      ModuleContentScreen(module: module),
                                ),
                              );
                            },
                          ),
                        );
                      },
                      childCount: registry.length,
                    ),
                  ),
                )
              else
                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: hPadding),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final entry = registry[index];
                        final module = modules[index];

                        return TweenAnimationBuilder<double>(
                          tween: Tween(begin: 0.0, end: 1.0),
                          duration: Duration(milliseconds: 200 + (index * 40)),
                          curve: Curves.easeOut,
                          builder: (context, value, child) {
                            return Opacity(
                              opacity: value.clamp(0.0, 1.0),
                              child: Transform.translate(
                                offset: Offset(0, 16 * (1 - value)),
                                child: child,
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: _ModuleCard(
                              entry: entry,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) =>
                                        ModuleContentScreen(module: module),
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      },
                      childCount: registry.length,
                    ),
                  ),
                ),

              // Bottom padding for FAB clearance
              const SliverToBoxAdapter(child: SizedBox(height: 80)),
            ],
          ),
        ),
      ),
    );
  }

  // ─── HERO ───
  Widget _buildHero(List modules) {
    return FadeTransition(
      opacity: CurvedAnimation(parent: _heroController, curve: Curves.easeOut),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF0F172A),
              Color(0xFF1E3A5F),
              Color(0xFF0F172A),
            ],
            stops: [0.0, 0.5, 1.0],
          ),
        ),
        child: Stack(
          children: [
            // Noise texture overlay at 3% opacity
            Positioned.fill(
              child: CustomPaint(painter: _NoiseTexturePainter()),
            ),
            // Content
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    Text(
                      'CVA Board Review',
                      style: GoogleFonts.sourceSerif4(
                        fontSize: 34,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        letterSpacing: -1.0,
                        height: 1.0,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Comprehensive Stroke Training',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.white.withValues(alpha: 0.7),
                        letterSpacing: -0.1,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      '${modules.length} Modules  ·  ${ModuleRegistry.totalFlashcardCount} Cards  ·  ${ModuleRegistry.totalQuizCount} Questions',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.white.withValues(alpha: 0.5),
                        letterSpacing: 0.5,
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
  }

  // ─── RANDOM QUIZ FAB ───
  Widget _buildRandomQuizFab(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        final questions = StrokeQuizBank.getRandomQuiz(10);
        if (questions.isNotEmpty) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => QuizSessionView(
                questions: questions,
                title: 'Random Quiz',
              ),
            ),
          );
        }
      },
      backgroundColor: AppTheme.accentTeal,
      elevation: 4,
      child: const Icon(Icons.shuffle_rounded, color: Colors.white, size: 26),
    );
  }

  // ─── QUIZ PICKER (BOTTOM SHEET) ───
  void _showQuizPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (ctx) => _CleanPickerSheet(
        title: 'Quiz Bank',
        allLabel: 'All Questions (${ModuleRegistry.totalQuizCount})',
        allColor: AppTheme.accentTeal,
        onAllTap: () {
          Navigator.pop(ctx);
          final questions = StrokeQuizBank.getRandomQuiz(10);
          if (questions.isNotEmpty) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => QuizSessionView(
                  questions: questions,
                  title: 'Board Review Quiz',
                ),
              ),
            );
          }
        },
        items: ModuleRegistry.modules.map((entry) {
          return _PickerItem(
            title: entry.title,
            count: '${entry.quizCount} questions',
            color: entry.color,
            icon: entry.icon,
            onTap: () {
              Navigator.pop(ctx);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => QuizSessionView(
                    questions: List.from(entry.quizQuestions())..shuffle(),
                    title: '${entry.title} Quiz',
                  ),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }

  // ─── FLASHCARD PICKER (BOTTOM SHEET) ───
  void _showFlashcardPicker(BuildContext context) {
    // Collect all cards for the "All" option
    final allCards = ModuleRegistry.modules
        .expand<Flashcard>((entry) => entry.flashcards())
        .toList();

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (ctx) => _CleanPickerSheet(
        title: 'Flashcard Decks',
        allLabel: 'All Cards (${allCards.length})',
        allColor: AppTheme.accentTeal,
        onAllTap: () {
          Navigator.pop(ctx);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => FlashcardView(
                cards: List.from(allCards)..shuffle(),
                title: 'All Flashcards',
              ),
            ),
          );
        },
        items: ModuleRegistry.modules.map((entry) {
          final cards = entry.flashcards();
          return _PickerItem(
            title: entry.title,
            count: '${cards.length} cards',
            color: entry.color,
            icon: entry.icon,
            onTap: () {
              Navigator.pop(ctx);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      FlashcardView(cards: cards, title: entry.title),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }

  // ─── PODCAST PICKER (BOTTOM SHEET) ───
  void _showPodcastPicker(BuildContext context) {
    final podcastModules = ModuleRegistry.modulesWithPodcasts;

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (ctx) => Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(ctx).size.height * 0.75,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Handle
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 12),
                width: 36,
                height: 4,
                decoration: BoxDecoration(
                  color: AppTheme.gray300,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
              child: Text(
                'Podcasts',
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.primaryNavy,
                  letterSpacing: -0.3,
                ),
              ),
            ),
            const Divider(height: 1, color: Color(0xFFE5E7EB)),
            Flexible(
              child: ListView.separated(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                shrinkWrap: true,
                itemCount: podcastModules.length,
                separatorBuilder: (_, _) => const SizedBox(height: 8),
                itemBuilder: (_, index) {
                  final entry = podcastModules[index];
                  return _PodcastTile(
                    episode: PodcastEpisode(
                      id: '${entry.id}-podcast',
                      title: entry.podcastTitle!,
                      description: entry.description,
                      moduleId: entry.id,
                      assetPath: entry.podcastAssetPath!,
                    ),
                    color: entry.color,
                    onTap: () async {
                      final messenger = ScaffoldMessenger.of(context);
                      Navigator.pop(ctx);
                      try {
                        _audioPlayer?.dispose();
                        _audioPlayer = AudioPlayer();
                        await _audioPlayer!.setAsset(entry.podcastAssetPath!);
                        await _audioPlayer!.play();
                      } catch (e) {
                        if (!mounted) return;
                        messenger.showSnackBar(
                          SnackBar(
                            content: Text('Unable to play podcast: $e'),
                            backgroundColor: AppTheme.accentCopper,
                          ),
                        );
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ─── CLINICAL CASES PICKER (BOTTOM SHEET) ───
  void _showClinicalCasesPicker(BuildContext context) {
    final scenarios = StrokeClinicalScenarios.all;

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (ctx) => Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(ctx).size.height * 0.75,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Handle
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 12),
                width: 36,
                height: 4,
                decoration: BoxDecoration(
                  color: AppTheme.gray300,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
              child: Text(
                'Clinical Cases',
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.primaryNavy,
                  letterSpacing: -0.3,
                ),
              ),
            ),
            const Divider(height: 1, color: Color(0xFFE5E7EB)),
            Flexible(
              child: ListView.separated(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                shrinkWrap: true,
                itemCount: scenarios.length,
                separatorBuilder: (_, _) => const SizedBox(height: 8),
                itemBuilder: (_, index) {
                  final scenario = scenarios[index];
                  return _ClinicalCaseTile(
                    scenario: scenario,
                    onTap: () {
                      Navigator.pop(ctx);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ClinicalSimulatorView(
                            scenario: scenario,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
// Clinical Case Tile
// ─────────────────────────────────────────────
class _ClinicalCaseTile extends StatelessWidget {
  final ClinicalScenario scenario;
  final VoidCallback onTap;

  const _ClinicalCaseTile({
    required this.scenario,
    required this.onTap,
  });

  Color get _difficultyColor {
    switch (scenario.difficulty) {
      case 'Advanced':
        return AppTheme.dangerRed;
      case 'Intermediate':
        return AppTheme.warningAmber;
      default:
        return AppTheme.successGreen;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
        child: Row(
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: _difficultyColor,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    scenario.title,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppTheme.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    scenario.patientSummary,
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: AppTheme.gray400,
                      height: 1.3,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: _difficultyColor.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          scenario.difficulty,
                          style: GoogleFonts.inter(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: _difficultyColor,
                          ),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        '${scenario.steps.length} steps',
                        style: GoogleFonts.inter(
                          fontSize: 10,
                          color: AppTheme.gray400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Icon(
              Icons.chevron_right_rounded,
              color: AppTheme.gray300,
              size: 22,
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
// Quick Action Card (top row)
// ─────────────────────────────────────────────
class _QuickActionCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String sublabel;
  final Color accentColor;
  final VoidCallback onTap;

  const _QuickActionCard({
    required this.icon,
    required this.label,
    required this.sublabel,
    required this.accentColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppTheme.gray250),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: accentColor.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: accentColor, size: 24),
              ),
              const SizedBox(height: 10),
              Text(
                label,
                style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.textPrimary,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                sublabel,
                style: GoogleFonts.inter(
                  fontSize: 11,
                  color: AppTheme.gray400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
// Module Card (list item)
// ─────────────────────────────────────────────
class _ModuleCard extends StatefulWidget {
  final ModuleEntry entry;
  final VoidCallback onTap;

  const _ModuleCard({
    required this.entry,
    required this.onTap,
  });

  @override
  State<_ModuleCard> createState() => _ModuleCardState();
}

class _ModuleCardState extends State<_ModuleCard> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    final entry = widget.entry;

    return GestureDetector(
      onTapDown: (_) => setState(() => _pressed = true),
      onTapUp: (_) {
        setState(() => _pressed = false);
        widget.onTap();
      },
      onTapCancel: () => setState(() => _pressed = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        decoration: BoxDecoration(
          color: _pressed ? const Color(0xFFF9FAFB) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppTheme.gray250),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Left accent strip
                Container(
                  width: 4,
                  decoration: BoxDecoration(
                    color: entry.color,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ),
                  ),
                ),
                // Content
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        // Icon circle
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: entry.color.withValues(alpha: 0.08),
                            shape: BoxShape.circle,
                          ),
                          child:
                              Icon(entry.icon, color: entry.color, size: 24),
                        ),
                        const SizedBox(width: 14),
                        // Text content
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                entry.title,
                                style: GoogleFonts.inter(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: AppTheme.primaryNavy,
                                  letterSpacing: -0.2,
                                ),
                              ),
                              const SizedBox(height: 3),
                              Text(
                                entry.description,
                                style: GoogleFonts.inter(
                                  fontSize: 13,
                                  color: const Color(0xFF6B7280),
                                  height: 1.3,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 8),
                              // Content count chips
                              Wrap(
                                spacing: 6,
                                runSpacing: 4,
                                children: [
                                  _ContentChip(
                                      label: '${entry.quizCount} quiz'),
                                  _ContentChip(
                                      label:
                                          '${entry.flashcardCount} cards'),
                                  if (entry.hasPodcast)
                                    const _ContentChip(label: 'podcast'),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        // Chevron
                        Icon(
                          Icons.chevron_right_rounded,
                          color: AppTheme.gray300,
                          size: 22,
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
  }
}

// ─────────────────────────────────────────────
// Content count chip
// ─────────────────────────────────────────────
class _ContentChip extends StatelessWidget {
  final String label;
  const _ContentChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        label,
        style: GoogleFonts.inter(
          fontSize: 10,
          fontWeight: FontWeight.w500,
          color: AppTheme.gray400,
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
// Clean Picker Bottom Sheet (shared by quiz + flashcards)
// ─────────────────────────────────────────────
class _PickerItem {
  final String title;
  final String count;
  final Color color;
  final IconData icon;
  final VoidCallback onTap;

  const _PickerItem({
    required this.title,
    required this.count,
    required this.color,
    required this.icon,
    required this.onTap,
  });
}

class _CleanPickerSheet extends StatelessWidget {
  final String title;
  final String allLabel;
  final Color allColor;
  final VoidCallback onAllTap;
  final List<_PickerItem> items;

  const _CleanPickerSheet({
    required this.title,
    required this.allLabel,
    required this.allColor,
    required this.onAllTap,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.75,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Handle bar
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 12),
              width: 36,
              height: 4,
              decoration: BoxDecoration(
                color: AppTheme.gray300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
            child: Text(
              title,
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppTheme.primaryNavy,
                letterSpacing: -0.3,
              ),
            ),
          ),
          const Divider(height: 1, color: Color(0xFFE5E7EB)),
          // "All" option
          InkWell(
            onTap: onAllTap,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
              child: Row(
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: allColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      allLabel,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.primaryNavy,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.chevron_right_rounded,
                    color: AppTheme.gray300,
                    size: 20,
                  ),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(height: 16, color: Color(0xFFF3F4F6)),
          ),
          // Module list
          Flexible(
            child: ListView.separated(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              shrinkWrap: true,
              itemCount: items.length,
              separatorBuilder: (_, _) => const SizedBox(height: 8),
              itemBuilder: (_, index) {
                final item = items[index];
                return InkWell(
                  borderRadius: BorderRadius.circular(8),
                  onTap: item.onTap,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
                    child: Row(
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: item.color,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            item.title,
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppTheme.textPrimary,
                            ),
                          ),
                        ),
                        Text(
                          item.count,
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            color: AppTheme.gray400,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Icon(
                          Icons.chevron_right_rounded,
                          color: AppTheme.gray300,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────
// Podcast Tile
// ─────────────────────────────────────────────
class _PodcastTile extends StatelessWidget {
  final PodcastEpisode episode;
  final Color color;
  final VoidCallback onTap;

  const _PodcastTile({
    required this.episode,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
        child: Row(
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                episode.title,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppTheme.textPrimary,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Icon(
              Icons.play_circle_outline_rounded,
              color: AppTheme.gray300,
              size: 22,
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
// Daily Review Banner
// ─────────────────────────────────────────────
class _DailyReviewBanner extends StatelessWidget {
  final int dueCount;
  final int streak;
  final AnimationController pulseController;
  final VoidCallback onTap;

  const _DailyReviewBanner({
    required this.dueCount,
    required this.streak,
    required this.pulseController,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: dueCount > 0
                  ? AppTheme.accentTeal.withValues(alpha: 0.3)
                  : AppTheme.gray250,
            ),
            gradient: dueCount > 0
                ? LinearGradient(
                    colors: [
                      AppTheme.accentTeal.withValues(alpha: 0.04),
                      Colors.white,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )
                : null,
          ),
          child: Row(
            children: [
              // Pulsing dot or static icon
              if (dueCount > 0)
                AnimatedBuilder(
                  animation: pulseController,
                  builder: (context, child) {
                    return Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppTheme.accentTeal
                            .withValues(alpha: 0.08 + pulseController.value * 0.07),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.replay_rounded,
                        color: AppTheme.accentTeal,
                        size: 22,
                      ),
                    );
                  },
                )
              else
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppTheme.successGreen.withValues(alpha: 0.08),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.check_circle_outline_rounded,
                    color: AppTheme.successGreen,
                    size: 22,
                  ),
                ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Daily Review',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.primaryNavy,
                        letterSpacing: -0.2,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      dueCount > 0
                          ? '$dueCount item${dueCount == 1 ? '' : 's'} due for review'
                          : 'All caught up! Keep your streak going.',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        color: AppTheme.textSecondary,
                        height: 1.3,
                      ),
                    ),
                  ],
                ),
              ),
              if (streak > 0) ...[
                const SizedBox(width: 8),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppTheme.accentCopper.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.local_fire_department_rounded,
                          size: 14, color: AppTheme.accentCopper),
                      const SizedBox(width: 3),
                      Text(
                        '$streak',
                        style: GoogleFonts.inter(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: AppTheme.accentCopper,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              const SizedBox(width: 8),
              Icon(
                Icons.chevron_right_rounded,
                color: AppTheme.gray300,
                size: 22,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
// Noise Texture Painter (replaces grid pattern)
// ─────────────────────────────────────────────
class _NoiseTexturePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final rng = Random(42); // Fixed seed for deterministic noise
    final paint = Paint()..style = PaintingStyle.fill;
    const step = 4.0;

    for (double x = 0; x < size.width; x += step) {
      for (double y = 0; y < size.height; y += step) {
        final brightness = rng.nextDouble();
        paint.color = Colors.white.withValues(alpha: brightness * 0.03);
        canvas.drawRect(Rect.fromLTWH(x, y, step, step), paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
