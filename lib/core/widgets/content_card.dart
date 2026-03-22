import 'package:flutter/material.dart';
import '../../data/models/module_model.dart';
import '../../core/theme/app_theme.dart';

class ContentCard extends StatelessWidget {
  final ModuleModel module;
  final int index;
  final VoidCallback onTap;

  const ContentCard({
    super.key,
    required this.module,
    required this.index,
    required this.onTap,
  });

  Color get _moduleColor {
    final colors = [
      AppTheme.fundamentalsColor,
      AppTheme.vascularColor,
      AppTheme.ischemicColor,
      AppTheme.syndromesColor,
      AppTheme.hemorrhagicColor,
      AppTheme.diagnosticColor,
      AppTheme.acuteColor,
      AppTheme.pharmacologyColor,
      AppTheme.motorRecoveryColor,
      AppTheme.spasticityColor,
      AppTheme.dysphagiaColor,
      AppTheme.cognitionColor,
      AppTheme.complicationsColor,
      AppTheme.outcomesColor,
    ];
    return colors[index % colors.length];
  }

  IconData get _moduleIcon {
    final icons = [
      Icons.menu_book_rounded,         // Fundamentals
      Icons.account_tree_rounded,      // Vascular Anatomy
      Icons.bolt_rounded,              // Ischemic Stroke
      Icons.hub_rounded,               // Stroke Syndromes
      Icons.water_drop_rounded,        // Hemorrhagic Stroke
      Icons.image_search_rounded,      // Diagnostic Studies
      Icons.local_hospital_rounded,    // Acute Management
      Icons.medication_rounded,        // Pharmacology
      Icons.accessibility_new_rounded, // Motor Recovery
      Icons.sports_gymnastics_rounded, // Spasticity & Shoulder
      Icons.restaurant_rounded,        // Dysphagia
      Icons.psychology_rounded,        // Cognition & Communication
      Icons.warning_amber_rounded,     // Medical Complications
      Icons.trending_up_rounded,       // Outcomes & Continuum
    ];
    return icons[index % icons.length];
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: _moduleColor.withValues(alpha: 0.15),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Row(
            children: [
              Container(
                width: 6,
                height: 120,
                color: _moduleColor,
              ),
              Container(
                width: 64,
                height: 120,
                alignment: Alignment.center,
                child: Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: _moduleColor.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    _moduleIcon,
                    color: _moduleColor,
                    size: 24,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Module ${index + 1}',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: _moduleColor,
                          letterSpacing: 1.2,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        module.title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppTheme.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        module.description,
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppTheme.textSecondary,
                          height: 1.3,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (module.highlights.isNotEmpty) ...[
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 6,
                          children: module.highlights.take(3).map((h) {
                            return Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 3,
                              ),
                              decoration: BoxDecoration(
                                color: _moduleColor.withValues(alpha: 0.08),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                h,
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  color: _moduleColor,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Icon(
                  Icons.chevron_right_rounded,
                  color: _moduleColor.withValues(alpha: 0.5),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
