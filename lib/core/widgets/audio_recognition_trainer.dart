import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import '../../data/models/topic_content_model.dart';
import '../theme/app_theme.dart';

class AudioRecognitionTrainer extends StatefulWidget {
  final AudioChallengeBlock block;
  const AudioRecognitionTrainer({super.key, required this.block});

  @override
  State<AudioRecognitionTrainer> createState() =>
      _AudioRecognitionTrainerState();
}

class _AudioRecognitionTrainerState extends State<AudioRecognitionTrainer>
    with TickerProviderStateMixin {
  late final AudioPlayer _player;
  late final AnimationController _waveController;
  bool _isPlaying = false;
  bool _hasListened = false;
  int? _selectedIndex;
  bool _answered = false;
  int _listenCount = 0;
  bool _playerReady = false;
  bool _playerError = false;

  static const _letters = ['A', 'B', 'C', 'D', 'E', 'F'];
  static const _tealBg = Color(0xFFF0FDFA);

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    _waveController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _initAudio();
  }

  Future<void> _initAudio() async {
    try {
      await _player.setAsset(widget.block.audioAssetPath);
      _player.playerStateStream.listen((state) {
        if (!mounted) return;
        final playing = state.playing;
        final completed =
            state.processingState == ProcessingState.completed;
        setState(() {
          _isPlaying = playing && !completed;
        });
        if (playing && !completed) {
          _waveController.repeat();
        } else {
          _waveController.stop();
        }
        if (completed) {
          _player.seek(Duration.zero);
          _player.pause();
        }
      });
      setState(() => _playerReady = true);
    } catch (_) {
      setState(() => _playerError = true);
    }
  }

  Future<void> _togglePlayPause() async {
    if (_isPlaying) {
      await _player.pause();
    } else {
      if (!_hasListened) {
        setState(() => _hasListened = true);
      }
      setState(() => _listenCount++);
      await _player.seek(Duration.zero);
      await _player.play();
    }
  }

  Future<void> _replay() async {
    setState(() => _listenCount++);
    await _player.seek(Duration.zero);
    await _player.play();
  }

  void _onOptionTap(int index) {
    if (_answered || !_hasListened) return;
    setState(() {
      _selectedIndex = index;
      _answered = true;
    });
  }

  @override
  void dispose() {
    _player.dispose();
    _waveController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final block = widget.block;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: _tealBg,
        borderRadius: BorderRadius.circular(AppTheme.radiusMD),
        border: const Border(
          left: BorderSide(color: AppTheme.accentTeal, width: 3),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x08000000),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.spacingMD),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              children: [
                Text(
                  'AUDIO RECOGNITION',
                  style: GoogleFonts.inter(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.accentTeal,
                    letterSpacing: 1.2,
                  ),
                ),
                const Spacer(),
                if (_listenCount > 0)
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: AppTheme.accentTeal.withValues(alpha: 0.12),
                      borderRadius:
                          BorderRadius.circular(AppTheme.radiusSM),
                    ),
                    child: Text(
                      '$_listenCount listen${_listenCount == 1 ? '' : 's'}',
                      style: GoogleFonts.inter(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.accentTeal,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 10),

            // Title
            Text(
              block.title,
              style: GoogleFonts.sourceSerif4(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppTheme.primaryNavy,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 16),

            // Play button + waveform
            _buildAudioControls(),
            const SizedBox(height: 16),

            // Options — visible only after at least one listen
            if (_hasListened)
              ...List.generate(block.options.length, (i) {
                final isCorrect = i == block.correctIndex;
                final isSelected = i == _selectedIndex;

                Color borderColor;
                Color bgColor;
                Widget? trailing;

                if (!_answered) {
                  borderColor = AppTheme.gray300;
                  bgColor = Colors.white;
                  trailing = null;
                } else if (isCorrect) {
                  borderColor = AppTheme.successGreen;
                  bgColor = const Color(0xFFECFDF5);
                  trailing = const Icon(Icons.check_circle_rounded,
                      color: AppTheme.successGreen, size: 20);
                } else if (isSelected) {
                  borderColor = AppTheme.dangerRed;
                  bgColor = const Color(0xFFFEF2F2);
                  trailing = const Icon(Icons.cancel_rounded,
                      color: AppTheme.dangerRed, size: 20);
                } else {
                  borderColor = AppTheme.gray200;
                  bgColor = const Color(0xFFF8FAFC);
                  trailing = null;
                }

                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: GestureDetector(
                    onTap: () => _onOptionTap(i),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 10),
                      decoration: BoxDecoration(
                        color: bgColor,
                        borderRadius:
                            BorderRadius.circular(AppTheme.radiusSM),
                        border:
                            Border.all(color: borderColor, width: 1.5),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 26,
                            height: 26,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _answered && isCorrect
                                  ? AppTheme.successGreen
                                  : _answered && isSelected
                                      ? AppTheme.dangerRed
                                      : AppTheme.gray200,
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              i < _letters.length ? _letters[i] : '${i + 1}',
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color:
                                    _answered && (isCorrect || isSelected)
                                        ? Colors.white
                                        : AppTheme.textSecondary,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              block.options[i],
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                height: 1.5,
                                color: AppTheme.textPrimary,
                                fontWeight: _answered && isCorrect
                                    ? FontWeight.w600
                                    : FontWeight.w400,
                              ),
                            ),
                          ),
                          if (trailing != null) ...[
                            const SizedBox(width: 8),
                            trailing,
                          ],
                        ],
                      ),
                    ),
                  ),
                );
              }),

            if (!_hasListened)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  'Listen to the audio clip, then classify what you hear.',
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    fontStyle: FontStyle.italic,
                    color: AppTheme.textSecondary,
                    height: 1.5,
                  ),
                ),
              ),

            // Post-answer feedback
            AnimatedCrossFade(
              firstChild: const SizedBox.shrink(),
              secondChild: _buildFeedback(),
              crossFadeState: _answered
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: AppTheme.durationNormal,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAudioControls() {
    if (_playerError) {
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppTheme.radiusSM),
          border: Border.all(color: AppTheme.gray200),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.audio_file, color: AppTheme.textSecondary, size: 20),
            const SizedBox(width: 8),
            Text(
              'Audio coming soon',
              style: GoogleFonts.inter(
                fontSize: 14,
                color: AppTheme.textSecondary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppTheme.radiusMD),
        border: Border.all(color: AppTheme.gray200),
      ),
      child: Row(
        children: [
          // Play / pause button
          GestureDetector(
            onTap: _playerReady ? _togglePlayPause : null,
            child: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _playerReady
                    ? AppTheme.accentTeal
                    : AppTheme.gray300,
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.accentTeal.withValues(alpha: 0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Icon(
                _isPlaying
                    ? Icons.pause_rounded
                    : Icons.play_arrow_rounded,
                color: Colors.white,
                size: 28,
              ),
            ),
          ),
          const SizedBox(width: 16),

          // Waveform bars
          Expanded(
            child: SizedBox(
              height: 36,
              child: AnimatedBuilder(
                animation: _waveController,
                builder: (context, _) {
                  return CustomPaint(
                    painter: _WaveformPainter(
                      progress: _waveController.value,
                      isPlaying: _isPlaying,
                      color: AppTheme.accentTeal,
                    ),
                    size: Size.infinite,
                  );
                },
              ),
            ),
          ),
          const SizedBox(width: 16),

          // Replay button
          if (_hasListened && !_isPlaying)
            GestureDetector(
              onTap: _replay,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: AppTheme.accentTeal.withValues(alpha: 0.1),
                  borderRadius:
                      BorderRadius.circular(AppTheme.radiusSM),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.replay_rounded,
                        color: AppTheme.accentTeal, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      'Replay',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.accentTeal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildFeedback() {
    final block = widget.block;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 4),
        // Explanation
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(AppTheme.radiusSM),
            border: const Border(
              left: BorderSide(color: AppTheme.successGreen, width: 3),
            ),
          ),
          child: Text(
            block.explanation,
            style: GoogleFonts.inter(
              fontSize: 13,
              height: 1.6,
              color: AppTheme.textPrimary,
            ),
          ),
        ),
        const SizedBox(height: 12),

        // Transcript with highlighted key features
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(AppTheme.radiusSM),
            border: Border.all(color: AppTheme.gray200),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.format_quote_rounded,
                      color: AppTheme.accentTeal, size: 18),
                  const SizedBox(width: 6),
                  Text(
                    'TRANSCRIPT',
                    style: GoogleFonts.inter(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.accentTeal,
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              _buildHighlightedTranscript(
                  block.transcript, block.keyFeatures),
            ],
          ),
        ),
        const SizedBox(height: 12),

        // Key distinguishing features
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFFF0FDFA),
            borderRadius: BorderRadius.circular(AppTheme.radiusSM),
            border: Border.all(
                color: AppTheme.accentTeal.withValues(alpha: 0.2)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'KEY DISTINGUISHING FEATURES',
                style: GoogleFonts.inter(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.accentTeal,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 8),
              ...block.keyFeatures.map((feature) => Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 7, left: 4),
                          width: 6,
                          height: 6,
                          decoration: const BoxDecoration(
                            color: AppTheme.accentTeal,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            feature,
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              height: 1.6,
                              color: AppTheme.textPrimary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ],
    );
  }

  /// Builds transcript text with key features highlighted in bold teal.
  Widget _buildHighlightedTranscript(
      String transcript, List<String> keyFeatures) {
    if (keyFeatures.isEmpty) {
      return Text(
        transcript,
        style: GoogleFonts.inter(
          fontSize: 14,
          fontStyle: FontStyle.italic,
          height: 1.7,
          color: AppTheme.textPrimary,
        ),
      );
    }

    // Build a regex that matches any key feature (case-insensitive)
    final escapedFeatures =
        keyFeatures.map((f) => RegExp.escape(f)).join('|');
    final regex = RegExp('($escapedFeatures)', caseSensitive: false);
    final parts = transcript.split(regex);
    final matches = regex.allMatches(transcript).map((m) => m.group(0)!).toList();

    final spans = <TextSpan>[];
    for (int i = 0; i < parts.length; i++) {
      if (parts[i].isNotEmpty) {
        spans.add(TextSpan(
          text: parts[i],
          style: GoogleFonts.inter(
            fontSize: 14,
            fontStyle: FontStyle.italic,
            height: 1.7,
            color: AppTheme.textPrimary,
          ),
        ));
      }
      if (i < matches.length) {
        spans.add(TextSpan(
          text: matches[i],
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.italic,
            height: 1.7,
            color: AppTheme.accentTeal,
          ),
        ));
      }
    }

    return Text.rich(TextSpan(children: spans));
  }
}

// ─── Decorative waveform painter ───

class _WaveformPainter extends CustomPainter {
  final double progress;
  final bool isPlaying;
  final Color color;

  _WaveformPainter({
    required this.progress,
    required this.isPlaying,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    const barCount = 28;
    final barWidth = (size.width / barCount) * 0.6;
    final gap = (size.width / barCount) * 0.4;

    final paint = Paint()
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;

    for (int i = 0; i < barCount; i++) {
      final x = i * (barWidth + gap);
      double heightFraction;
      if (isPlaying) {
        // Animated pulsing: each bar oscillates at a slightly different phase
        final phase = (progress * 2 * pi) + (i * 0.4);
        heightFraction = 0.3 + 0.7 * ((sin(phase) + 1) / 2);
      } else {
        // Static: random-looking but deterministic heights
        heightFraction = 0.15 + 0.15 * sin(i * 1.7 + 0.5).abs();
      }

      final barHeight = size.height * heightFraction;
      final top = (size.height - barHeight) / 2;

      paint.color = isPlaying
          ? color.withValues(alpha: 0.4 + 0.6 * heightFraction)
          : color.withValues(alpha: 0.25);

      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(x, top, barWidth, barHeight),
          const Radius.circular(2),
        ),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(_WaveformPainter oldDelegate) =>
      oldDelegate.progress != progress ||
      oldDelegate.isPlaying != isPlaying;
}
