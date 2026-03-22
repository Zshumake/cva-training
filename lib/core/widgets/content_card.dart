import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../data/models/module_model.dart';
import '../../core/theme/app_theme.dart';

class ContentCard extends StatefulWidget {
  final ModuleModel module;
  final int index;
  final VoidCallback onTap;

  const ContentCard({
    super.key,
    required this.module,
    required this.index,
    required this.onTap,
  });

  @override
  State<ContentCard> createState() => _ContentCardState();
}

class _ContentCardState extends State<ContentCard> {
  bool _isHovered = false;

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
    return colors[widget.index % colors.length];
  }

  IconData get _moduleIcon {
    final icons = [
      Icons.menu_book_rounded,
      Icons.account_tree_rounded,
      Icons.bolt_rounded,
      Icons.hub_rounded,
      Icons.water_drop_rounded,
      Icons.image_search_rounded,
      Icons.local_hospital_rounded,
      Icons.medication_rounded,
      Icons.accessibility_new_rounded,
      Icons.sports_gymnastics_rounded,
      Icons.restaurant_rounded,
      Icons.psychology_rounded,
      Icons.warning_amber_rounded,
      Icons.trending_up_rounded,
    ];
    return icons[widget.index % icons.length];
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
          transform: Matrix4.translationValues(0, _isHovered ? -2 : 0, 0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: _isHovered
                  ? _moduleColor.withValues(alpha: 0.3)
                  : AppTheme.borderSubtle,
            ),
            boxShadow: [
              BoxShadow(
                color: _isHovered
                    ? _moduleColor.withValues(alpha: 0.12)
                    : Colors.black.withValues(alpha: 0.04),
                blurRadius: _isHovered ? 20 : 10,
                offset: Offset(0, _isHovered ? 8 : 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Accent strip with gradient
                  Container(
                    width: 4,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          _moduleColor,
                          _moduleColor.withValues(alpha: 0.5),
                        ],
                      ),
                    ),
                  ),
                  // Icon
                  Container(
                    width: 64,
                    alignment: Alignment.center,
                    child: Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        color: _moduleColor.withValues(alpha: 0.08),
                        borderRadius: BorderRadius.circular(11),
                      ),
                      child: Icon(_moduleIcon, color: _moduleColor, size: 22),
                    ),
                  ),
                  // Content
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'MODULE ${widget.index + 1}',
                            style: GoogleFonts.inter(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              color: _moduleColor.withValues(alpha: 0.7),
                              letterSpacing: 1.5,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            widget.module.title,
                            style: GoogleFonts.inter(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: AppTheme.textPrimary,
                              letterSpacing: -0.3,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            widget.module.description,
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              color: AppTheme.textSecondary,
                              height: 1.3,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          if (widget.module.highlights.isNotEmpty) ...[
                            const SizedBox(height: 10),
                            Wrap(
                              spacing: 6,
                              runSpacing: 4,
                              children: widget.module.highlights.take(3).map((h) {
                                return Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                  decoration: BoxDecoration(
                                    color: _moduleColor.withValues(alpha: 0.06),
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      color: _moduleColor.withValues(alpha: 0.12),
                                    ),
                                  ),
                                  child: Text(
                                    h,
                                    style: GoogleFonts.inter(
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
                  // Arrow
                  Padding(
                    padding: const EdgeInsets.only(right: 14),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      child: Icon(
                        Icons.chevron_right_rounded,
                        color: _isHovered
                            ? _moduleColor
                            : _moduleColor.withValues(alpha: 0.35),
                        size: 22,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
