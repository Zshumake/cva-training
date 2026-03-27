import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

/// An image-based exercise where the learner taps to identify an abnormality
/// on a medical image (CT/MRI).
class SpotTheFindingChallenge extends StatefulWidget {
  final String imagePath;
  final String? annotatedImagePath;
  final Offset targetCenter; // normalized 0.0-1.0
  final double targetRadius; // normalized 0.0-1.0
  final String findingName;
  final String teachingPoint;
  final String? title;

  const SpotTheFindingChallenge({
    super.key,
    required this.imagePath,
    this.annotatedImagePath,
    required this.targetCenter,
    required this.targetRadius,
    required this.findingName,
    required this.teachingPoint,
    this.title,
  });

  @override
  State<SpotTheFindingChallenge> createState() =>
      _SpotTheFindingChallengeState();
}

enum _ChallengeState { waiting, tapped, correct, incorrect }

class _SpotTheFindingChallengeState extends State<SpotTheFindingChallenge>
    with TickerProviderStateMixin {
  Offset? _tapPosition; // normalized
  _ChallengeState _state = _ChallengeState.waiting;

  late final AnimationController _pulseController;
  late final Animation<double> _pulseAnimation;

  late final AnimationController _revealController;
  late final Animation<double> _revealAnimation;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat(reverse: true);
    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.4).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    _revealController = AnimationController(
      vsync: this,
      duration: AppTheme.durationSlow,
    );
    _revealAnimation = CurvedAnimation(
      parent: _revealController,
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _revealController.dispose();
    super.dispose();
  }

  void _onTapImage(TapDownDetails details, Size imageSize) {
    if (_state == _ChallengeState.correct ||
        _state == _ChallengeState.incorrect) {
      return;
    }
    final normalized = Offset(
      details.localPosition.dx / imageSize.width,
      details.localPosition.dy / imageSize.height,
    );
    setState(() {
      _tapPosition = normalized;
      _state = _ChallengeState.tapped;
    });
  }

  void _onSubmit() {
    if (_tapPosition == null) return;
    final dx = _tapPosition!.dx - widget.targetCenter.dx;
    final dy = _tapPosition!.dy - widget.targetCenter.dy;
    final distance = sqrt(dx * dx + dy * dy);

    setState(() {
      _state = distance <= widget.targetRadius
          ? _ChallengeState.correct
          : _ChallengeState.incorrect;
    });
    _pulseController.stop();
    _revealController.forward();
  }

  void _onReset() {
    setState(() {
      _tapPosition = null;
      _state = _ChallengeState.waiting;
    });
    _revealController.reset();
    _pulseController.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    final isRevealed =
        _state == _ChallengeState.correct || _state == _ChallengeState.incorrect;

    return Padding(
      padding: const EdgeInsets.only(bottom: AppTheme.spacingMD),
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.cardBackground,
          borderRadius: BorderRadius.circular(AppTheme.radiusLG),
          border: Border.all(color: AppTheme.borderSubtle),
          boxShadow: AppTheme.shadowCard,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppTheme.spacingMD,
                AppTheme.spacingMD,
                AppTheme.spacingMD,
                AppTheme.spacingSM,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (widget.title != null) ...[
                    Text(
                      widget.title!,
                      style: GoogleFonts.sourceSerif4(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.primaryNavy,
                        letterSpacing: -0.3,
                      ),
                    ),
                    const SizedBox(height: AppTheme.spacingXS),
                  ],
                  Row(
                    children: [
                      Icon(
                        isRevealed ? Icons.check_circle : Icons.touch_app,
                        size: 16,
                        color: isRevealed
                            ? AppTheme.successGreen
                            : AppTheme.accentTeal,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        isRevealed
                            ? 'Finding revealed'
                            : 'Tap the abnormality',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: isRevealed
                              ? AppTheme.successGreen
                              : AppTheme.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Image area
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(AppTheme.radiusLG),
                bottomRight: Radius.circular(AppTheme.radiusLG),
              ),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Interactive image with overlays
                      GestureDetector(
                        onTapDown: (details) => _onTapImage(
                          details,
                          Size(constraints.maxWidth, constraints.maxWidth),
                        ),
                        child: SizedBox(
                          width: constraints.maxWidth,
                          child: Stack(
                            children: [
                              // Base image or annotated image
                              if (isRevealed &&
                                  widget.annotatedImagePath != null)
                                AnimatedBuilder(
                                  animation: _revealAnimation,
                                  builder: (context, child) {
                                    return Opacity(
                                      opacity: _revealAnimation.value,
                                      child: Image.asset(
                                        widget.annotatedImagePath!,
                                        width: constraints.maxWidth,
                                        fit: BoxFit.fitWidth,
                                      ),
                                    );
                                  },
                                ),
                              Image.asset(
                                widget.imagePath,
                                width: constraints.maxWidth,
                                fit: BoxFit.fitWidth,
                                opacity: isRevealed &&
                                        widget.annotatedImagePath != null
                                    ? AlwaysStoppedAnimation(
                                        1.0 - _revealAnimation.value)
                                    : null,
                              ),

                              // User tap marker
                              if (_tapPosition != null)
                                Positioned(
                                  left: _tapPosition!.dx *
                                          constraints.maxWidth -
                                      12,
                                  top: _tapPosition!.dy *
                                          constraints.maxWidth -
                                      12,
                                  child: _buildTapMarker(),
                                ),

                              // Correct location marker (shown on incorrect)
                              if (_state == _ChallengeState.incorrect)
                                AnimatedBuilder(
                                  animation: _revealAnimation,
                                  builder: (context, child) {
                                    return Positioned(
                                      left: widget.targetCenter.dx *
                                              constraints.maxWidth -
                                          12,
                                      top: widget.targetCenter.dy *
                                              constraints.maxWidth -
                                          12,
                                      child: Opacity(
                                        opacity: _revealAnimation.value,
                                        child: _buildCorrectMarker(),
                                      ),
                                    );
                                  },
                                ),
                            ],
                          ),
                        ),
                      ),

                      // Bottom controls and feedback
                      _buildFeedbackArea(),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTapMarker() {
    final isCorrect = _state == _ChallengeState.correct;
    final isRevealed =
        _state == _ChallengeState.correct || _state == _ChallengeState.incorrect;

    final color = isRevealed
        ? (isCorrect ? AppTheme.successGreen : AppTheme.dangerRed)
        : AppTheme.accentTeal;

    if (!isRevealed) {
      return AnimatedBuilder(
        animation: _pulseAnimation,
        builder: (context, child) {
          return Container(
            width: 24 * _pulseAnimation.value,
            height: 24 * _pulseAnimation.value,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: color, width: 2.5),
              color: color.withValues(alpha: 0.15),
            ),
          );
        },
      );
    }

    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: color, width: 2.5),
        color: color.withValues(alpha: 0.2),
      ),
      child: Icon(
        isCorrect ? Icons.check : Icons.close,
        size: 14,
        color: color,
      ),
    );
  }

  Widget _buildCorrectMarker() {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppTheme.successGreen, width: 2.5),
        color: AppTheme.successGreen.withValues(alpha: 0.2),
      ),
      child: const Icon(
        Icons.check,
        size: 14,
        color: AppTheme.successGreen,
      ),
    );
  }

  Widget _buildFeedbackArea() {
    if (_state == _ChallengeState.waiting) {
      return const SizedBox.shrink();
    }

    if (_state == _ChallengeState.tapped) {
      return Padding(
        padding: const EdgeInsets.all(AppTheme.spacingMD),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: _onSubmit,
            icon: const Icon(Icons.send, size: 16),
            label: const Text('Submit'),
          ),
        ),
      );
    }

    // Revealed state (correct or incorrect)
    final isCorrect = _state == _ChallengeState.correct;
    return AnimatedBuilder(
      animation: _revealAnimation,
      builder: (context, child) {
        return Opacity(
          opacity: _revealAnimation.value,
          child: child,
        );
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(AppTheme.spacingMD),
        color: isCorrect
            ? AppTheme.successGreen.withValues(alpha: 0.06)
            : AppTheme.dangerRed.withValues(alpha: 0.06),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  isCorrect ? Icons.check_circle : Icons.info_outline,
                  size: 18,
                  color: isCorrect
                      ? AppTheme.successGreen
                      : AppTheme.dangerRed,
                ),
                const SizedBox(width: 8),
                Text(
                  isCorrect
                      ? 'Correct! ${widget.findingName}'
                      : 'The finding is here: ${widget.findingName}',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: isCorrect
                        ? AppTheme.successGreen
                        : AppTheme.dangerRed,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppTheme.spacingSM),
            Text(
              widget.teachingPoint,
              style: GoogleFonts.inter(
                fontSize: 13,
                color: AppTheme.textPrimary,
                height: 1.6,
              ),
            ),
            const SizedBox(height: AppTheme.spacingMD),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: _onReset,
                icon: const Icon(Icons.refresh, size: 16),
                label: const Text('Try Again'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppTheme.textSecondary,
                  side: const BorderSide(color: AppTheme.borderSubtle),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
