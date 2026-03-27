import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';
import '../../data/models/topic_content_model.dart';
import '../theme/app_theme.dart';

class VideoAtlasViewer extends StatefulWidget {
  final VideoAtlasBlock block;
  const VideoAtlasViewer({super.key, required this.block});

  @override
  State<VideoAtlasViewer> createState() => _VideoAtlasViewerState();
}

class _VideoAtlasViewerState extends State<VideoAtlasViewer> {
  VideoPlayerController? _controller;
  bool _initialized = false;
  bool _hasError = false;
  bool _hasWatched = false;
  bool _showAnnotations = false;
  double _playbackSpeed = 1.0;
  double _currentPosition = 0.0;
  Timer? _positionTimer;

  @override
  void initState() {
    super.initState();
    _initVideo();
  }

  Future<void> _initVideo() async {
    try {
      final controller =
          VideoPlayerController.asset(widget.block.videoAssetPath);
      _controller = controller;
      await controller.initialize();
      controller.addListener(_onVideoUpdate);
      if (mounted) {
        setState(() => _initialized = true);
      }
    } catch (_) {
      if (mounted) {
        setState(() => _hasError = true);
      }
    }
  }

  void _onVideoUpdate() {
    if (!mounted || _controller == null) return;
    final ctrl = _controller!;
    final position = ctrl.value.position.inMilliseconds / 1000.0;
    final isPlaying = ctrl.value.isPlaying;

    if (isPlaying && !_hasWatched) {
      setState(() => _hasWatched = true);
    }

    // Detect completion
    if (ctrl.value.position >= ctrl.value.duration &&
        ctrl.value.duration > Duration.zero) {
      _positionTimer?.cancel();
    }

    setState(() {
      _currentPosition = position;
    });
  }

  void _togglePlayPause() {
    final ctrl = _controller;
    if (ctrl == null || !_initialized) return;

    if (ctrl.value.isPlaying) {
      ctrl.pause();
      _positionTimer?.cancel();
    } else {
      // Reset if at end
      if (ctrl.value.position >= ctrl.value.duration &&
          ctrl.value.duration > Duration.zero) {
        ctrl.seekTo(Duration.zero);
      }
      ctrl.play();
      // High-frequency position updates for smooth annotation fade
      _positionTimer?.cancel();
      _positionTimer = Timer.periodic(
        const Duration(milliseconds: 100),
        (_) {
          if (!mounted || _controller == null) return;
          setState(() {
            _currentPosition =
                _controller!.value.position.inMilliseconds / 1000.0;
          });
        },
      );
    }
  }

  void _cycleSpeed() {
    final ctrl = _controller;
    if (ctrl == null) return;
    setState(() {
      if (_playbackSpeed == 1.0) {
        _playbackSpeed = 0.5;
      } else if (_playbackSpeed == 0.5) {
        _playbackSpeed = 2.0;
      } else {
        _playbackSpeed = 1.0;
      }
      ctrl.setPlaybackSpeed(_playbackSpeed);
    });
  }

  void _seekTo(double seconds) {
    _controller?.seekTo(Duration(milliseconds: (seconds * 1000).round()));
  }

  @override
  void dispose() {
    _positionTimer?.cancel();
    _controller?.removeListener(_onVideoUpdate);
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final block = widget.block;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppTheme.radiusMD),
        border: Border.all(color: AppTheme.borderSubtle),
        boxShadow: const [
          BoxShadow(
            color: Color(0x08000000),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title bar
          Padding(
            padding: const EdgeInsets.fromLTRB(
                AppTheme.spacingMD, 14, AppTheme.spacingMD, 10),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'CLINICAL VIDEO ATLAS',
                        style: GoogleFonts.inter(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: AppTheme.accentTeal,
                          letterSpacing: 1.2,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        block.title,
                        style: GoogleFonts.sourceSerif4(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.primaryNavy,
                          height: 1.3,
                        ),
                      ),
                    ],
                  ),
                ),
                if (block.boardRelevance != null)
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color:
                          AppTheme.accentCopper.withValues(alpha: 0.12),
                      borderRadius:
                          BorderRadius.circular(AppTheme.radiusSM),
                    ),
                    child: Text(
                      block.boardRelevance!,
                      style: GoogleFonts.inter(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.accentCopper,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
              ],
            ),
          ),

          // Video area
          _buildVideoArea(),

          // Controls bar
          if (_initialized && !_hasError) _buildControls(),

          // Pre-watch prompt or post-watch reveal
          _buildBottomSection(),
        ],
      ),
    );
  }

  Widget _buildVideoArea() {
    if (_hasError) {
      return Container(
        height: 200,
        color: AppTheme.primaryNavy,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.videocam_off_rounded,
              color: Colors.white.withValues(alpha: 0.5),
              size: 40,
            ),
            const SizedBox(height: 8),
            Text(
              'Video coming soon',
              style: GoogleFonts.inter(
                fontSize: 14,
                color: Colors.white.withValues(alpha: 0.7),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      );
    }

    if (!_initialized) {
      return Container(
        height: 200,
        color: AppTheme.primaryNavy,
        alignment: Alignment.center,
        child: const CircularProgressIndicator(
          color: AppTheme.accentTeal,
          strokeWidth: 2,
        ),
      );
    }

    final ctrl = _controller!;
    final aspectRatio = ctrl.value.aspectRatio;

    return GestureDetector(
      onTap: _togglePlayPause,
      child: Container(
        color: AppTheme.primaryNavy,
        child: Stack(
          children: [
            // Video
            Center(
              child: AspectRatio(
                aspectRatio: aspectRatio > 0 ? aspectRatio : 16 / 9,
                child: VideoPlayer(ctrl),
              ),
            ),

            // Play/pause overlay
            if (!ctrl.value.isPlaying)
              Positioned.fill(
                child: Container(
                  color: Colors.black.withValues(alpha: 0.3),
                  alignment: Alignment.center,
                  child: Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withValues(alpha: 0.85),
                    ),
                    child: const Icon(
                      Icons.play_arrow_rounded,
                      color: AppTheme.primaryNavy,
                      size: 34,
                    ),
                  ),
                ),
              ),

            // Annotations overlay
            if (_showAnnotations)
              ..._buildAnnotationOverlay(ctrl),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildAnnotationOverlay(VideoPlayerController ctrl) {
    final annotations = widget.block.annotations;
    return annotations.map((annotation) {
      // Fade: visible within +/- 2 seconds of the annotation timestamp
      final diff = (_currentPosition - annotation.timestamp).abs();
      final opacity = diff <= 2.0 ? (1.0 - (diff / 2.0)).clamp(0.0, 1.0) : 0.0;
      if (opacity <= 0.0) return const SizedBox.shrink();

      return Positioned(
        left: 0,
        top: 0,
        right: 0,
        bottom: 0,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final left = annotation.x * constraints.maxWidth;
            final top = annotation.y * constraints.maxHeight;
            return Stack(
              children: [
                Positioned(
                  left: left.clamp(0, constraints.maxWidth - 120),
                  top: top.clamp(0, constraints.maxHeight - 32),
                  child: AnimatedOpacity(
                    opacity: opacity,
                    duration: const Duration(milliseconds: 200),
                    child: _AnnotationChip(label: annotation.label),
                  ),
                ),
              ],
            );
          },
        ),
      );
    }).toList();
  }

  Widget _buildControls() {
    final ctrl = _controller!;
    final duration = ctrl.value.duration.inMilliseconds / 1000.0;
    final position = _currentPosition.clamp(0.0, duration > 0 ? duration : 1.0);

    return Container(
      padding:
          const EdgeInsets.symmetric(horizontal: AppTheme.spacingMD, vertical: 8),
      color: AppTheme.primaryNavy,
      child: Column(
        children: [
          // Scrubber
          SliderTheme(
            data: SliderThemeData(
              trackHeight: 3,
              thumbShape:
                  const RoundSliderThumbShape(enabledThumbRadius: 6),
              overlayShape:
                  const RoundSliderOverlayShape(overlayRadius: 12),
              activeTrackColor: AppTheme.accentTeal,
              inactiveTrackColor: Colors.white.withValues(alpha: 0.2),
              thumbColor: AppTheme.accentTeal,
              overlayColor: AppTheme.accentTeal.withValues(alpha: 0.2),
            ),
            child: Slider(
              value: position,
              min: 0,
              max: duration > 0 ? duration : 1.0,
              onChanged: (v) => _seekTo(v),
            ),
          ),
          // Button row
          Row(
            children: [
              // Time label
              Text(
                '${_formatTime(position)} / ${_formatTime(duration)}',
                style: GoogleFonts.inter(
                  fontSize: 11,
                  color: Colors.white.withValues(alpha: 0.7),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              // Speed toggle
              GestureDetector(
                onTap: _cycleSpeed,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.15),
                    borderRadius:
                        BorderRadius.circular(AppTheme.radiusSM),
                  ),
                  child: Text(
                    '${_playbackSpeed}x',
                    style: GoogleFonts.inter(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              // Annotations toggle
              GestureDetector(
                onTap: () =>
                    setState(() => _showAnnotations = !_showAnnotations),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: _showAnnotations
                        ? AppTheme.accentTeal.withValues(alpha: 0.3)
                        : Colors.white.withValues(alpha: 0.15),
                    borderRadius:
                        BorderRadius.circular(AppTheme.radiusSM),
                    border: _showAnnotations
                        ? Border.all(
                            color: AppTheme.accentTeal
                                .withValues(alpha: 0.5),
                            width: 1)
                        : null,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        _showAnnotations
                            ? Icons.label_rounded
                            : Icons.label_outline_rounded,
                        color: Colors.white,
                        size: 14,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Annotations',
                        style: GoogleFonts.inter(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
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

  Widget _buildBottomSection() {
    if (!_hasWatched && !_hasError) {
      return Padding(
        padding: const EdgeInsets.all(AppTheme.spacingMD),
        child: Row(
          children: [
            Icon(
              Icons.visibility_rounded,
              color: AppTheme.accentTeal.withValues(alpha: 0.6),
              size: 18,
            ),
            const SizedBox(width: 8),
            Text(
              'What do you see? Watch the video, then review findings below.',
              style: GoogleFonts.inter(
                fontSize: 13,
                fontStyle: FontStyle.italic,
                color: AppTheme.textSecondary,
                height: 1.5,
              ),
            ),
          ],
        ),
      );
    }

    if (_hasWatched || _hasError) {
      return Padding(
        padding: const EdgeInsets.all(AppTheme.spacingMD),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'CLINICAL FINDINGS',
              style: GoogleFonts.inter(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: AppTheme.accentTeal,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.block.description,
              style: GoogleFonts.inter(
                fontSize: 14,
                height: 1.7,
                color: AppTheme.textPrimary,
              ),
            ),
            if (widget.block.boardRelevance != null) ...[
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppTheme.pearlBackground.withValues(alpha: 0.6),
                  borderRadius:
                      BorderRadius.circular(AppTheme.radiusSM),
                  border: const Border(
                    left: BorderSide(
                        color: AppTheme.accentCopper, width: 2),
                  ),
                ),
                child: Text(
                  'Board Relevance: ${widget.block.boardRelevance!}',
                  style: AppTheme.boardPearlStyle(),
                ),
              ),
            ],
          ],
        ),
      );
    }

    return const SizedBox.shrink();
  }

  String _formatTime(double seconds) {
    final mins = seconds ~/ 60;
    final secs = (seconds % 60).floor();
    return '${mins.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  }
}

// ─── Annotation Chip ───

class _AnnotationChip extends StatelessWidget {
  final String label;
  const _AnnotationChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppTheme.primaryNavy.withValues(alpha: 0.85),
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Small pointer triangle is implied by the chip shape
          Container(
            width: 4,
            height: 4,
            decoration: const BoxDecoration(
              color: AppTheme.accentTeal,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 6),
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
