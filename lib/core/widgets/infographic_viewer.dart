import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/theme/app_theme.dart';
import '../../data/anatomy_data.dart';
import '../../data/models/anatomy_model.dart';
class InfographicViewer extends StatelessWidget {
  final Infographic infographic;

  const InfographicViewer({super.key, required this.infographic});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.surfaceWarm,
      appBar: AppBar(
        title: Text(infographic.title),
      ),
      body: InteractiveViewer(
        minScale: 0.5,
        maxScale: 4.0,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SvgPicture.asset(
              infographic.assetPath,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}

class InfographicGallery extends StatelessWidget {
  final String? moduleId;
  final InfographicCategory? category;
  final String title;

  const InfographicGallery({
    super.key,
    this.moduleId,
    this.category,
    this.title = 'Infographics',
  });

  List<Infographic> get _infographics {
    if (moduleId != null) return InfographicData.getByModule(moduleId!);
    if (category != null) return InfographicData.getByCategory(category!);
    return InfographicData.all;
  }

  void _onInfographicTap(BuildContext context, Infographic item) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => InfographicViewer(infographic: item),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final items = _infographics;

    return Scaffold(
      backgroundColor: AppTheme.surfaceWarm,
      appBar: AppBar(
        title: Text(title),
      ),
      body: items.isEmpty
          ? Center(
              child: Text(
                'No infographics available',
                style: TextStyle(color: AppTheme.textSecondary),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return _InfographicCard(
                  infographic: item,
                  onTap: () => _onInfographicTap(context, item),
                );
              },
            ),
    );
  }
}

class _InfographicCard extends StatelessWidget {
  final Infographic infographic;
  final VoidCallback onTap;

  const _InfographicCard({required this.infographic, required this.onTap});

  Color get _categoryColor {
    switch (infographic.category) {
      case InfographicCategory.flowchart:
        return AppTheme.accentTeal;
      case InfographicCategory.anatomy:
        return AppTheme.dangerRed;
      case InfographicCategory.summary:
        return AppTheme.accentCopper;
    }
  }

  String get _categoryLabel {
    switch (infographic.category) {
      case InfographicCategory.flowchart:
        return 'ALGORITHM';
      case InfographicCategory.anatomy:
        return 'ANATOMY';
      case InfographicCategory.summary:
        return 'SUMMARY';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppTheme.cardBackground,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: _categoryColor.withValues(alpha: 0.3)),
          boxShadow: [
            BoxShadow(
              color: _categoryColor.withValues(alpha: 0.08),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: _categoryColor.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(12),
                border:
                    Border.all(color: _categoryColor.withValues(alpha: 0.3)),
              ),
              child:
                  Icon(infographic.icon, color: _categoryColor, size: 24),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _categoryLabel,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.5,
                      color: _categoryColor,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    infographic.title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    infographic.description,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppTheme.textSecondary,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Icon(
              Icons.chevron_right_rounded,
              color: _categoryColor.withValues(alpha: 0.5),
            ),
          ],
        ),
      ),
    );
  }
}
