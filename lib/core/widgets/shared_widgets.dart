import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

// ---------------------------------------------------------------------------
// BoardReadinessChip -- color-coded chip for board readiness tags
// ---------------------------------------------------------------------------

class BoardReadinessChip extends StatelessWidget {
  final String? boardReadiness;

  const BoardReadinessChip({super.key, required this.boardReadiness});

  @override
  Widget build(BuildContext context) {
    if (boardReadiness == null) return const SizedBox.shrink();

    Color bgColor;
    Color textColor;
    Color dotColor;
    String label;

    switch (boardReadiness) {
      case 'BOARD-CORE':
        bgColor = const Color(0xFFECFDF5);
        textColor = const Color(0xFF065F46);
        dotColor = const Color(0xFF065F46);
        label = 'BOARD-CORE';
        break;
      case 'BOARD-LIKELY':
        bgColor = const Color(0xFFFFFBEB);
        textColor = const Color(0xFF92400E);
        dotColor = const Color(0xFF92400E);
        label = 'BOARD-LIKELY';
        break;
      case 'BOARD-EMERGING':
        bgColor = const Color(0xFFEFF6FF);
        textColor = const Color(0xFF1E40AF);
        dotColor = const Color(0xFF1E40AF);
        label = 'BOARD-EMERGING';
        break;
      default:
        return const SizedBox.shrink();
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: dotColor,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 5),
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              color: textColor,
              letterSpacing: 0.3,
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// ScoreRingPainter -- circular progress ring for results sheets
// ---------------------------------------------------------------------------

class ScoreRingPainter extends CustomPainter {
  final double progress;
  final Color color;
  final Color trackColor;

  ScoreRingPainter({
    required this.progress,
    required this.color,
    required this.trackColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 8;
    const strokeWidth = 8.0;

    final trackPaint = Paint()
      ..color = trackColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, trackPaint);

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
  bool shouldRepaint(covariant ScoreRingPainter oldDelegate) {
    return oldDelegate.progress != progress || oldDelegate.color != color;
  }
}

// ---------------------------------------------------------------------------
// confirmLeaveDialog -- shared leave-confirmation dialog
// ---------------------------------------------------------------------------

Future<bool> confirmLeaveDialog({
  required BuildContext context,
  required String title,
  required String body,
}) async {
  final result = await showDialog<bool>(
    context: context,
    builder: (ctx) => AlertDialog(
      title: Text(
        title,
        style: GoogleFonts.sourceSerif4(
          fontWeight: FontWeight.w700,
          color: AppTheme.primaryNavy,
        ),
      ),
      content: Text(
        body,
        style: GoogleFonts.inter(
          fontSize: 15,
          height: 1.5,
          color: AppTheme.textSecondary,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(ctx).pop(false),
          child: Text(
            'Continue',
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w600,
              color: AppTheme.accentTeal,
            ),
          ),
        ),
        TextButton(
          onPressed: () => Navigator.of(ctx).pop(true),
          child: Text(
            'Leave',
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w600,
              color: AppTheme.dangerRed,
            ),
          ),
        ),
      ],
    ),
  );
  return result ?? false;
}

// ---------------------------------------------------------------------------
// BottomSheetHandle -- the standard 40x4 drag handle bar
// ---------------------------------------------------------------------------

class BottomSheetHandle extends StatelessWidget {
  const BottomSheetHandle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 4,
      decoration: BoxDecoration(
        color: AppTheme.borderSubtle,
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }
}
