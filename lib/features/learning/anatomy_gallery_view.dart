import 'package:flutter/material.dart';

import '../../core/theme/app_theme.dart';
import '../../core/widgets/infographic_viewer.dart';
import '../../data/anatomy_data.dart';
import '../../data/models/anatomy_model.dart';

/// Gallery screen showing all stroke anatomy visual resources.
///
/// Two tabs:
///   1. **Diagrams** -- SVG infographics (vascular territories, etc.)
///   2. **Layers** -- Interactive layer diagrams (future expansion)
class AnatomyGalleryView extends StatelessWidget {
  /// Optional module filter. When null, all modules are shown.
  final String? moduleId;

  const AnatomyGalleryView({super.key, this.moduleId});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppTheme.surfaceWarm,
        appBar: AppBar(
          title: const Text('Anatomy & Diagrams'),
          bottom: TabBar(
            indicatorColor: AppTheme.accentTeal,
            indicatorWeight: 3,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white60,
            labelStyle: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.5,
            ),
            unselectedLabelStyle: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
            tabs: const [
              Tab(text: 'Diagrams'),
              Tab(text: 'Layers'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _DiagramsTab(moduleId: moduleId),
            _LayersTab(moduleId: moduleId),
          ],
        ),
      ),
    );
  }
}

// ════════════════════════════════════════════════
// Tab 1 -- Diagrams (anatomy infographics)
// ════════════════════════════════════════════════

class _DiagramsTab extends StatelessWidget {
  final String? moduleId;
  const _DiagramsTab({this.moduleId});

  @override
  Widget build(BuildContext context) {
    List<Infographic> items;
    if (moduleId != null) {
      items = InfographicData.getByModule(moduleId!);
    } else {
      items = InfographicData.getByCategory(InfographicCategory.anatomy);
    }

    if (items.isEmpty) {
      return const _EmptyState(message: 'No anatomy diagrams for this module');
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return _DiagramCard(
          infographic: item,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => InfographicViewer(infographic: item),
            ),
          ),
        );
      },
    );
  }
}

// ════════════════════════════════════════════════
// Tab 2 -- Interactive Layers (placeholder for future)
// ════════════════════════════════════════════════

class _LayersTab extends StatelessWidget {
  final String? moduleId;
  const _LayersTab({this.moduleId});

  @override
  Widget build(BuildContext context) {
    // Interactive layer diagrams can be added here as stroke-specific
    // layer data is created (e.g., vascular territory layers,
    // corticospinal tract layers, etc.)
    return const _EmptyState(
      message: 'Interactive layer diagrams coming soon',
    );
  }
}

// ════════════════════════════════════════════════
// Cards
// ════════════════════════════════════════════════

class _DiagramCard extends StatelessWidget {
  final Infographic infographic;
  final VoidCallback onTap;

  const _DiagramCard({required this.infographic, required this.onTap});

  Color get _accentColor {
    switch (infographic.moduleId) {
      case 'vascular-anatomy':
        return AppTheme.vascularColor;
      case 'stroke-syndromes':
        return AppTheme.syndromesColor;
      case 'hemorrhagic-stroke':
        return AppTheme.hemorrhagicColor;
      case 'diagnostic-studies':
        return AppTheme.diagnosticColor;
      case 'motor-recovery':
        return AppTheme.motorRecoveryColor;
      case 'dysphagia-nutrition':
        return AppTheme.dysphagiaColor;
      case 'cognition-communication':
        return AppTheme.cognitionColor;
      default:
        return AppTheme.accentTeal;
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = _accentColor;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppTheme.cardBackground,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color.withValues(alpha: 0.3)),
          boxShadow: [
            BoxShadow(
              color: color.withValues(alpha: 0.08),
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
                color: color.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: color.withValues(alpha: 0.3)),
              ),
              child: Icon(infographic.icon, color: color, size: 24),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ANATOMY DIAGRAM',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.5,
                      color: color,
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
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Icon(
              Icons.chevron_right_rounded,
              color: color.withValues(alpha: 0.5),
            ),
          ],
        ),
      ),
    );
  }
}

// ════════════════════════════════════════════════
// Empty state
// ════════════════════════════════════════════════

class _EmptyState extends StatelessWidget {
  final String message;
  const _EmptyState({required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.biotech_rounded,
            size: 48,
            color: AppTheme.textSecondary.withValues(alpha: 0.3),
          ),
          const SizedBox(height: 12),
          Text(
            message,
            style: const TextStyle(
              fontSize: 14,
              color: AppTheme.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
