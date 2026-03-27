import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

// ─── DATA MODELS ───

enum DiagramType {
  brainLateral,
  brainMedial,
  brainstem,
  vascularTerritories,
}

class DragItem {
  final String label;
  final String correctTargetId;
  final String explanation;

  const DragItem({
    required this.label,
    required this.correctTargetId,
    required this.explanation,
  });
}

class DropTarget {
  final String id;
  final String label;
  final Rect bounds; // normalized 0.0-1.0 within the diagram area

  const DropTarget({
    required this.id,
    required this.label,
    required this.bounds,
  });
}

class DragDropExercise {
  final String title;
  final List<DragItem> items;
  final List<DropTarget> targets;
  final DiagramType diagramType;

  const DragDropExercise({
    required this.title,
    required this.items,
    required this.targets,
    required this.diagramType,
  });
}

// ─── WIDGET ───

class DragDropMapper extends StatefulWidget {
  final DragDropExercise exercise;
  final Color themeColor;

  const DragDropMapper({
    super.key,
    required this.exercise,
    this.themeColor = AppTheme.accentTeal,
  });

  @override
  State<DragDropMapper> createState() => _DragDropMapperState();
}

class _DragDropMapperState extends State<DragDropMapper>
    with TickerProviderStateMixin {
  // Maps item index -> true if correctly placed
  final Map<int, bool> _placedItems = {};
  // Maps target id -> item index (for items placed correctly)
  final Map<String, int> _targetOccupants = {};
  // Temporarily highlighted target when hovering
  String? _hoveredTargetId;
  // Shake animation for incorrect drops
  late final AnimationController _shakeController;
  late final Animation<double> _shakeAnimation;
  int? _shakingItemIndex;
  // Toast message
  String? _toastMessage;
  // Completion flag
  bool _isComplete = false;

  late final AnimationController _celebrationController;
  late final Animation<double> _celebrationAnimation;

  @override
  void initState() {
    super.initState();
    _shakeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _shakeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _shakeController, curve: Curves.elasticIn),
    );
    _shakeController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _shakeController.reset();
        setState(() => _shakingItemIndex = null);
      }
    });

    _celebrationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _celebrationAnimation = CurvedAnimation(
      parent: _celebrationController,
      curve: Curves.easeOutBack,
    );
  }

  @override
  void dispose() {
    _shakeController.dispose();
    _celebrationController.dispose();
    super.dispose();
  }

  int get _correctCount => _placedItems.values.where((v) => v).length;
  int get _totalCount => widget.exercise.items.length;

  void _onItemDroppedOnTarget(int itemIndex, String targetId) {
    if (_placedItems.containsKey(itemIndex)) return;

    final item = widget.exercise.items[itemIndex];
    if (item.correctTargetId == targetId) {
      // Correct placement
      setState(() {
        _placedItems[itemIndex] = true;
        _targetOccupants[targetId] = itemIndex;
        _hoveredTargetId = null;
      });
      if (_correctCount == _totalCount) {
        setState(() => _isComplete = true);
        _celebrationController.forward();
      }
    } else {
      // Incorrect - shake and show explanation toast
      setState(() {
        _shakingItemIndex = itemIndex;
        _toastMessage = item.explanation;
        _hoveredTargetId = null;
      });
      _shakeController.forward();
      Future.delayed(const Duration(seconds: 3), () {
        if (mounted) setState(() => _toastMessage = null);
      });
    }
  }

  void _onReset() {
    setState(() {
      _placedItems.clear();
      _targetOccupants.clear();
      _isComplete = false;
      _toastMessage = null;
    });
    _celebrationController.reset();
  }

  @override
  Widget build(BuildContext context) {
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
              padding: const EdgeInsets.all(AppTheme.spacingMD),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.exercise.title,
                    style: GoogleFonts.sourceSerif4(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.primaryNavy,
                      letterSpacing: -0.3,
                    ),
                  ),
                  const SizedBox(height: AppTheme.spacingSM),
                  // Progress indicator
                  Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius:
                              BorderRadius.circular(AppTheme.radiusSM),
                          child: LinearProgressIndicator(
                            value:
                                _totalCount > 0 ? _correctCount / _totalCount : 0,
                            backgroundColor: AppTheme.gray200,
                            valueColor: AlwaysStoppedAnimation<Color>(
                                widget.themeColor),
                            minHeight: 6,
                          ),
                        ),
                      ),
                      const SizedBox(width: AppTheme.spacingSM),
                      Text(
                        '$_correctCount of $_totalCount placed',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const Divider(height: 1),

            // Main content: draggable chips and drop target diagram
            Padding(
              padding: const EdgeInsets.all(AppTheme.spacingMD),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final diagramSize = constraints.maxWidth;
                  return Column(
                    children: [
                      // Brain diagram with drop targets
                      _buildDiagram(diagramSize),
                      const SizedBox(height: AppTheme.spacingMD),
                      // Draggable deficit chips
                      _buildChipPool(),
                    ],
                  );
                },
              ),
            ),

            // Toast message
            if (_toastMessage != null)
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  AppTheme.spacingMD,
                  0,
                  AppTheme.spacingMD,
                  AppTheme.spacingMD,
                ),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(AppTheme.spacingMD - 4),
                  decoration: BoxDecoration(
                    color: AppTheme.dangerRed.withValues(alpha: 0.06),
                    borderRadius: BorderRadius.circular(AppTheme.radiusSM),
                    border: Border.all(
                        color: AppTheme.dangerRed.withValues(alpha: 0.2)),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.info_outline,
                          size: 16, color: AppTheme.dangerRed),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          _toastMessage!,
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            color: AppTheme.textPrimary,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            // Completion
            if (_isComplete) _buildCompletionArea(),
          ],
        ),
      ),
    );
  }

  Widget _buildDiagram(double size) {
    return SizedBox(
      width: size,
      height: size * 0.65,
      child: Stack(
        children: [
          // Background diagram
          Positioned.fill(
            child: CustomPaint(
              painter: _BrainDiagramPainter(
                diagramType: widget.exercise.diagramType,
                themeColor: widget.themeColor,
              ),
            ),
          ),
          // Drop target zones
          for (final target in widget.exercise.targets)
            Positioned(
              left: target.bounds.left * size,
              top: target.bounds.top * size * 0.65,
              width: target.bounds.width * size,
              height: target.bounds.height * size * 0.65,
              child: _buildDropTarget(target, size),
            ),
        ],
      ),
    );
  }

  Widget _buildDropTarget(DropTarget target, double diagramWidth) {
    final isOccupied = _targetOccupants.containsKey(target.id);
    final isHovered = _hoveredTargetId == target.id;

    return DragTarget<int>(
      onWillAcceptWithDetails: (details) {
        setState(() => _hoveredTargetId = target.id);
        return !_placedItems.containsKey(details.data);
      },
      onLeave: (_) {
        setState(() => _hoveredTargetId = null);
      },
      onAcceptWithDetails: (details) {
        _onItemDroppedOnTarget(details.data, target.id);
      },
      builder: (context, candidateData, rejectedData) {
        return AnimatedContainer(
          duration: AppTheme.durationFast,
          decoration: BoxDecoration(
            color: isOccupied
                ? AppTheme.successGreen.withValues(alpha: 0.12)
                : isHovered
                    ? widget.themeColor.withValues(alpha: 0.12)
                    : widget.themeColor.withValues(alpha: 0.04),
            borderRadius: BorderRadius.circular(AppTheme.radiusSM),
            border: Border.all(
              color: isOccupied
                  ? AppTheme.successGreen.withValues(alpha: 0.5)
                  : isHovered
                      ? widget.themeColor.withValues(alpha: 0.5)
                      : widget.themeColor.withValues(alpha: 0.2),
              width: isHovered ? 2 : 1,
            ),
          ),
          child: Center(
            child: isOccupied
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.check_circle,
                          size: 14, color: AppTheme.successGreen),
                      const SizedBox(height: 2),
                      Text(
                        widget
                            .exercise.items[_targetOccupants[target.id]!].label,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          fontSize: 9,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.successGreen,
                        ),
                      ),
                    ],
                  )
                : Text(
                    target.label,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: 9,
                      fontWeight: FontWeight.w500,
                      color: AppTheme.textSecondary,
                    ),
                  ),
          ),
        );
      },
    );
  }

  Widget _buildChipPool() {
    return Wrap(
      spacing: AppTheme.spacingSM,
      runSpacing: AppTheme.spacingSM,
      children: [
        for (int i = 0; i < widget.exercise.items.length; i++)
          if (!_placedItems.containsKey(i)) _buildDraggableChip(i),
      ],
    );
  }

  Widget _buildDraggableChip(int index) {
    final item = widget.exercise.items[index];
    final isShaking = _shakingItemIndex == index;

    Widget chip = Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: widget.themeColor.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(AppTheme.radiusXL),
        border: Border.all(color: widget.themeColor.withValues(alpha: 0.3)),
      ),
      child: Text(
        item.label,
        style: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: widget.themeColor,
        ),
      ),
    );

    if (isShaking) {
      return AnimatedBuilder(
        animation: _shakeAnimation,
        builder: (context, child) {
          final offset = _shakeAnimation.value *
              8 *
              ((_shakeAnimation.value * 6).truncate().isEven ? 1 : -1);
          return Transform.translate(
            offset: Offset(offset, 0),
            child: child,
          );
        },
        child: chip,
      );
    }

    return Draggable<int>(
      data: index,
      feedback: Material(
        color: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: widget.themeColor.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(AppTheme.radiusXL),
            border: Border.all(color: widget.themeColor),
            boxShadow: AppTheme.shadowElevated,
          ),
          child: Text(
            item.label,
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: widget.themeColor,
            ),
          ),
        ),
      ),
      childWhenDragging: Opacity(opacity: 0.3, child: chip),
      child: chip,
    );
  }

  Widget _buildCompletionArea() {
    return AnimatedBuilder(
      animation: _celebrationAnimation,
      builder: (context, child) {
        return Opacity(
          opacity: _celebrationAnimation.value,
          child: Transform.scale(
            scale: 0.8 + 0.2 * _celebrationAnimation.value,
            child: child,
          ),
        );
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(AppTheme.spacingLG),
        decoration: BoxDecoration(
          color: AppTheme.successGreen.withValues(alpha: 0.06),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(AppTheme.radiusLG),
            bottomRight: Radius.circular(AppTheme.radiusLG),
          ),
        ),
        child: Column(
          children: [
            const Icon(Icons.celebration,
                size: 32, color: AppTheme.successGreen),
            const SizedBox(height: AppTheme.spacingSM),
            Text(
              'Well done!',
              style: GoogleFonts.sourceSerif4(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: AppTheme.successGreen,
              ),
            ),
            const SizedBox(height: AppTheme.spacingSM),
            Text(
              'All deficits correctly mapped.',
              style: GoogleFonts.inter(
                fontSize: 13,
                color: AppTheme.textSecondary,
              ),
            ),
            const SizedBox(height: AppTheme.spacingMD),
            // Review all mappings
            ...widget.exercise.items.map((item) {
              final target = widget.exercise.targets.firstWhere(
                (t) => t.id == item.correctTargetId,
              );
              return Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Row(
                  children: [
                    const Icon(Icons.check,
                        size: 14, color: AppTheme.successGreen),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        '${item.label}  \u2192  ${target.label}',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: AppTheme.textPrimary,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
            const SizedBox(height: AppTheme.spacingMD),
            OutlinedButton.icon(
              onPressed: _onReset,
              icon: const Icon(Icons.refresh, size: 16),
              label: const Text('Reset'),
              style: OutlinedButton.styleFrom(
                foregroundColor: AppTheme.textSecondary,
                side: const BorderSide(color: AppTheme.borderSubtle),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── BRAIN DIAGRAM PAINTER ───

class _BrainDiagramPainter extends CustomPainter {
  final DiagramType diagramType;
  final Color themeColor;

  _BrainDiagramPainter({required this.diagramType, required this.themeColor});

  @override
  void paint(Canvas canvas, Size size) {
    switch (diagramType) {
      case DiagramType.brainLateral:
        _paintLateralBrain(canvas, size);
      case DiagramType.brainMedial:
        _paintMedialBrain(canvas, size);
      case DiagramType.brainstem:
        _paintBrainstem(canvas, size);
      case DiagramType.vascularTerritories:
        _paintVascularTerritories(canvas, size);
    }
  }

  void _paintLateralBrain(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    final outline = Paint()
      ..color = themeColor.withValues(alpha: 0.25)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    final fill = Paint()
      ..color = themeColor.withValues(alpha: 0.03)
      ..style = PaintingStyle.fill;

    // Simplified lateral brain outline
    final path = Path()
      ..moveTo(w * 0.15, h * 0.65)
      ..cubicTo(w * 0.08, h * 0.45, w * 0.12, h * 0.2, w * 0.3, h * 0.12)
      ..cubicTo(w * 0.45, h * 0.05, w * 0.65, h * 0.05, w * 0.78, h * 0.12)
      ..cubicTo(w * 0.92, h * 0.2, w * 0.95, h * 0.4, w * 0.88, h * 0.55)
      ..cubicTo(w * 0.82, h * 0.65, w * 0.72, h * 0.72, w * 0.6, h * 0.75)
      ..cubicTo(w * 0.5, h * 0.78, w * 0.35, h * 0.82, w * 0.25, h * 0.78)
      ..cubicTo(w * 0.18, h * 0.75, w * 0.15, h * 0.7, w * 0.15, h * 0.65)
      ..close();

    canvas.drawPath(path, fill);
    canvas.drawPath(path, outline);

    // Central sulcus
    final sulcus = Paint()
      ..color = themeColor.withValues(alpha: 0.15)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;
    canvas.drawLine(
        Offset(w * 0.5, h * 0.08), Offset(w * 0.45, h * 0.6), sulcus);
    // Lateral sulcus
    canvas.drawLine(
        Offset(w * 0.25, h * 0.55), Offset(w * 0.6, h * 0.42), sulcus);
  }

  void _paintMedialBrain(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    final outline = Paint()
      ..color = themeColor.withValues(alpha: 0.25)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    final fill = Paint()
      ..color = themeColor.withValues(alpha: 0.03)
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(w * 0.5, h * 0.85)
      ..cubicTo(w * 0.25, h * 0.85, w * 0.1, h * 0.6, w * 0.12, h * 0.35)
      ..cubicTo(w * 0.15, h * 0.15, w * 0.35, h * 0.05, w * 0.55, h * 0.05)
      ..cubicTo(w * 0.75, h * 0.05, w * 0.9, h * 0.15, w * 0.9, h * 0.35)
      ..cubicTo(w * 0.9, h * 0.55, w * 0.8, h * 0.7, w * 0.7, h * 0.78)
      ..lineTo(w * 0.5, h * 0.85)
      ..close();

    canvas.drawPath(path, fill);
    canvas.drawPath(path, outline);

    // Corpus callosum hint
    final cc = Paint()
      ..color = themeColor.withValues(alpha: 0.12)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    final ccPath = Path()
      ..moveTo(w * 0.3, h * 0.4)
      ..cubicTo(w * 0.4, h * 0.32, w * 0.6, h * 0.32, w * 0.7, h * 0.4);
    canvas.drawPath(ccPath, cc);
  }

  void _paintBrainstem(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    final outline = Paint()
      ..color = themeColor.withValues(alpha: 0.25)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    final fill = Paint()
      ..color = themeColor.withValues(alpha: 0.03)
      ..style = PaintingStyle.fill;

    // Midbrain
    final midbrain = Path()
      ..addOval(Rect.fromCenter(
          center: Offset(w * 0.5, h * 0.18), width: w * 0.35, height: h * 0.15));
    canvas.drawPath(midbrain, fill);
    canvas.drawPath(midbrain, outline);

    // Pons
    final pons = Path()
      ..addOval(Rect.fromCenter(
          center: Offset(w * 0.5, h * 0.42), width: w * 0.45, height: h * 0.2));
    canvas.drawPath(pons, fill);
    canvas.drawPath(pons, outline);

    // Medulla
    final medulla = Path()
      ..addOval(Rect.fromCenter(
          center: Offset(w * 0.5, h * 0.68), width: w * 0.3, height: h * 0.2));
    canvas.drawPath(medulla, fill);
    canvas.drawPath(medulla, outline);

    // Labels
    _drawLabel(canvas, 'Midbrain', Offset(w * 0.5, h * 0.18), themeColor);
    _drawLabel(canvas, 'Pons', Offset(w * 0.5, h * 0.42), themeColor);
    _drawLabel(canvas, 'Medulla', Offset(w * 0.5, h * 0.68), themeColor);
  }

  void _paintVascularTerritories(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    final outline = Paint()
      ..color = themeColor.withValues(alpha: 0.25)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    // ACA territory
    final aca = Paint()
      ..color = const Color(0xFF2563EB).withValues(alpha: 0.06)
      ..style = PaintingStyle.fill;
    final acaPath = Path()
      ..moveTo(w * 0.3, h * 0.1)
      ..cubicTo(w * 0.4, h * 0.05, w * 0.55, h * 0.05, w * 0.55, h * 0.15)
      ..lineTo(w * 0.5, h * 0.45)
      ..lineTo(w * 0.3, h * 0.4)
      ..close();
    canvas.drawPath(acaPath, aca);
    canvas.drawPath(acaPath, outline);

    // MCA territory
    final mca = Paint()
      ..color = const Color(0xFFDC2626).withValues(alpha: 0.06)
      ..style = PaintingStyle.fill;
    final mcaPath = Path()
      ..moveTo(w * 0.55, h * 0.15)
      ..cubicTo(w * 0.7, h * 0.08, w * 0.88, h * 0.15, w * 0.9, h * 0.35)
      ..cubicTo(w * 0.9, h * 0.5, w * 0.8, h * 0.6, w * 0.65, h * 0.55)
      ..lineTo(w * 0.5, h * 0.45)
      ..close();
    canvas.drawPath(mcaPath, mca);
    canvas.drawPath(mcaPath, outline);

    // PCA territory
    final pca = Paint()
      ..color = const Color(0xFF059669).withValues(alpha: 0.06)
      ..style = PaintingStyle.fill;
    final pcaPath = Path()
      ..moveTo(w * 0.3, h * 0.4)
      ..lineTo(w * 0.5, h * 0.45)
      ..lineTo(w * 0.65, h * 0.55)
      ..cubicTo(w * 0.55, h * 0.7, w * 0.4, h * 0.75, w * 0.25, h * 0.7)
      ..cubicTo(w * 0.15, h * 0.6, w * 0.18, h * 0.45, w * 0.3, h * 0.4)
      ..close();
    canvas.drawPath(pcaPath, pca);
    canvas.drawPath(pcaPath, outline);

    _drawLabel(canvas, 'ACA', Offset(w * 0.4, h * 0.22), const Color(0xFF2563EB));
    _drawLabel(canvas, 'MCA', Offset(w * 0.72, h * 0.32), const Color(0xFFDC2626));
    _drawLabel(canvas, 'PCA', Offset(w * 0.4, h * 0.58), const Color(0xFF059669));
  }

  void _drawLabel(Canvas canvas, String text, Offset position, Color color) {
    final textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: color.withValues(alpha: 0.5),
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(
      canvas,
      Offset(
        position.dx - textPainter.width / 2,
        position.dy - textPainter.height / 2,
      ),
    );
  }

  @override
  bool shouldRepaint(covariant _BrainDiagramPainter oldDelegate) =>
      oldDelegate.diagramType != diagramType ||
      oldDelegate.themeColor != themeColor;
}
