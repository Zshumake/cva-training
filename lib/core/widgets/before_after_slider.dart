import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

/// A horizontal slider that reveals two overlaid images — normal vs. abnormal.
/// The user drags a handle to compare them side by side.
class BeforeAfterSlider extends StatefulWidget {
  final String beforeImage;
  final String afterImage;
  final String? title;
  final String? caption;

  const BeforeAfterSlider({
    super.key,
    required this.beforeImage,
    required this.afterImage,
    this.title,
    this.caption,
  });

  @override
  State<BeforeAfterSlider> createState() => _BeforeAfterSliderState();
}

class _BeforeAfterSliderState extends State<BeforeAfterSlider> {
  double _clipFraction = 0.5;
  bool _isDragging = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppTheme.spacingMD),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.title != null) ...[
            Text(
              widget.title!,
              style: GoogleFonts.sourceSerif4(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppTheme.primaryNavy,
                letterSpacing: -0.3,
                height: 1.2,
              ),
            ),
            const SizedBox(height: AppTheme.spacingSM),
          ],
          // Labels row
          Padding(
            padding: const EdgeInsets.only(bottom: AppTheme.spacingXS),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Normal',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.successGreen,
                    letterSpacing: 0.3,
                  ),
                ),
                Text(
                  'Abnormal',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.dangerRed,
                    letterSpacing: 0.3,
                  ),
                ),
              ],
            ),
          ),
          // Image comparison area
          ClipRRect(
            borderRadius: BorderRadius.circular(AppTheme.radiusMD),
            child: InteractiveViewer(
              panEnabled: !_isDragging,
              scaleEnabled: !_isDragging,
              minScale: 1.0,
              maxScale: 3.0,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return GestureDetector(
                    onHorizontalDragStart: (_) {
                      setState(() => _isDragging = true);
                    },
                    onHorizontalDragUpdate: (details) {
                      setState(() {
                        _clipFraction +=
                            details.delta.dx / constraints.maxWidth;
                        _clipFraction = _clipFraction.clamp(0.0, 1.0);
                      });
                    },
                    onHorizontalDragEnd: (_) {
                      setState(() => _isDragging = false);
                    },
                    child: Stack(
                      children: [
                        // Bottom layer: "after" / abnormal image (full width)
                        Image.asset(
                          widget.afterImage,
                          width: constraints.maxWidth,
                          fit: BoxFit.fitWidth,
                        ),
                        // Top layer: "before" / normal image (clipped)
                        ClipRect(
                          clipper: _LeftClipper(_clipFraction),
                          child: Image.asset(
                            widget.beforeImage,
                            width: constraints.maxWidth,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        // Vertical divider line
                        Positioned(
                          left: constraints.maxWidth * _clipFraction - 1,
                          top: 0,
                          bottom: 0,
                          child: Container(
                            width: 2,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.4),
                                  blurRadius: 4,
                                  offset: const Offset(0, 0),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Circular drag handle
                        Positioned(
                          left: constraints.maxWidth * _clipFraction - 16,
                          top: 0,
                          bottom: 0,
                          child: Center(
                            child: Container(
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color:
                                        Colors.black.withValues(alpha: 0.3),
                                    blurRadius: 6,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: const Icon(
                                Icons.drag_handle,
                                size: 18,
                                color: AppTheme.textSecondary,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          if (widget.caption != null) ...[
            const SizedBox(height: AppTheme.spacingSM),
            Text(
              widget.caption!,
              style: GoogleFonts.inter(
                fontSize: 12,
                fontStyle: FontStyle.italic,
                color: AppTheme.textSecondary,
                height: 1.5,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

/// Custom clipper that clips to the left portion of the widget.
class _LeftClipper extends CustomClipper<Rect> {
  final double fraction;
  _LeftClipper(this.fraction);

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0, 0, size.width * fraction, size.height);
  }

  @override
  bool shouldReclip(_LeftClipper oldClipper) => oldClipper.fraction != fraction;
}
