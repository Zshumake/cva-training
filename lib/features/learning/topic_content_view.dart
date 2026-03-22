import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../data/models/topic_content_model.dart';
import '../../core/theme/app_theme.dart';

class TopicContentView extends StatelessWidget {
  final TopicData topicData;

  const TopicContentView({super.key, required this.topicData});

  @override
  Widget build(BuildContext context) {
    final isScrollable = topicData.tabs.length > 3;
    return DefaultTabController(
      length: topicData.tabs.length,
      child: Column(
        children: [
          TabBar(
            isScrollable: isScrollable,
            tabAlignment: isScrollable ? TabAlignment.start : null,
            labelColor: AppTheme.primaryNavy,
            unselectedLabelColor: AppTheme.textSecondary,
            indicatorColor: AppTheme.accentTeal,
            indicatorWeight: 3,
            dividerHeight: 0,
            labelStyle: GoogleFonts.inter(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              letterSpacing: -0.1,
            ),
            unselectedLabelStyle: GoogleFonts.inter(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              letterSpacing: -0.1,
            ),
            tabs: topicData.tabs.map((t) => Tab(text: t.title)).toList(),
          ),
          Expanded(
            child: TabBarView(
              children: topicData.tabs.map((tab) {
                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: tab.blocks.length,
                  itemBuilder: (context, index) {
                    return _buildBlock(tab.blocks[index]);
                  },
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBlock(ContentBlock block) {
    if (block is HeaderBlock) return _buildHeader(block);
    if (block is TextBlock) return _buildText(block);
    if (block is PearlBlock) return _buildPearl(block);
    if (block is BulletCardBlock) return _buildBulletCard(block);
    if (block is TableBlock) return _buildTable(block);
    if (block is MnemonicBlock) return _buildMnemonic(block);
    if (block is NumberedListBlock) return _buildNumberedList(block);
    if (block is MedicationCardBlock) return _buildMedicationCard(block);
    if (block is ComparisonCardBlock) return _buildComparisonCard(block);
    if (block is ScaleBlock) return _buildScaleBlock(block);
    return const SizedBox.shrink();
  }

  Widget _buildHeader(HeaderBlock block) {
    return Padding(
      padding: const EdgeInsets.only(top: 28, bottom: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 3,
            height: 28,
            margin: const EdgeInsets.only(right: 12, top: 2),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [AppTheme.accentTeal, AppTheme.accentCopper],
              ),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Expanded(
            child: Text(
              block.title,
              style: GoogleFonts.playfairDisplay(
                fontSize: 22,
                fontWeight: FontWeight.w800,
                color: AppTheme.primaryNavy,
                letterSpacing: -0.5,
                height: 1.2,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildText(TextBlock block) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        block.text,
        style: GoogleFonts.inter(
          fontSize: block.isIntro ? 16 : 14,
          height: 1.6,
          color: block.isIntro ? AppTheme.textPrimary : AppTheme.textSecondary,
          fontStyle: block.isIntro ? FontStyle.italic : FontStyle.normal,
          letterSpacing: -0.1,
        ),
      ),
    );
  }

  Widget _buildPearl(PearlBlock block) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppTheme.pearlBackground,
            Color(0xFFFFF8E1),
            Color(0xFFFFFDF5),
          ],
        ),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: AppTheme.pearlBorder.withValues(alpha: 0.35),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: AppTheme.pearlBorder.withValues(alpha: 0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.lightbulb_rounded,
                color: AppTheme.pearlBorder,
                size: 20,
                semanticLabel: 'Clinical Pearl',
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  block.title,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF92400E),
                    letterSpacing: -0.1,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            block.text,
            style: GoogleFonts.inter(
              fontSize: 13,
              height: 1.55,
              color: const Color(0xFF78350F),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBulletCard(BulletCardBlock block) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: block.backgroundColor,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: block.themeColor.withValues(alpha: 0.2),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: block.themeColor.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            block.title,
            style: GoogleFonts.inter(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: block.themeColor,
              letterSpacing: -0.2,
            ),
          ),
          const SizedBox(height: 12),
          ...block.points.map((point) => Padding(
                padding: const EdgeInsets.only(bottom: 7),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 7),
                      width: 5,
                      height: 5,
                      decoration: BoxDecoration(
                        color: block.themeColor.withValues(alpha: 0.7),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        point,
                        style: GoogleFonts.inter(
                          fontSize: 13,
                          height: 1.55,
                          color: AppTheme.textPrimary,
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildTable(TableBlock block) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppTheme.borderSubtle, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (block.title.isNotEmpty)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: block.headerColor ?? AppTheme.primaryNavy,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(13),
                  topRight: Radius.circular(13),
                ),
              ),
              child: Text(
                block.title,
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  letterSpacing: -0.1,
                ),
              ),
            ),
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(13),
              bottomRight: Radius.circular(13),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                headingRowColor: WidgetStateProperty.all(
                  const Color(0xFFF8FAFC),
                ),
                dataRowColor: WidgetStateProperty.resolveWith<Color>(
                  (states) {
                    return Colors.white;
                  },
                ),
                columnSpacing: 18,
                horizontalMargin: 14,
                headingTextStyle: GoogleFonts.inter(
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                  color: AppTheme.textPrimary,
                  letterSpacing: 0.2,
                ),
                dataTextStyle: GoogleFonts.inter(
                  fontSize: 12,
                  color: AppTheme.textPrimary,
                  height: 1.4,
                ),
                columns: block.columns
                    .map((c) => DataColumn(label: Text(c)))
                    .toList(),
                rows: List.generate(block.rows.length, (rowIndex) {
                  return DataRow(
                    color: WidgetStateProperty.all(
                      rowIndex.isEven
                          ? Colors.white
                          : const Color(0xFFFAFAFB),
                    ),
                    cells: block.rows[rowIndex]
                        .map((cell) => DataCell(
                              ConstrainedBox(
                                constraints:
                                    const BoxConstraints(maxWidth: 180),
                                child: Text(cell),
                              ),
                            ))
                        .toList(),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMnemonic(MnemonicBlock block) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppTheme.mnemonicBackground,
            Color(0xFFF0ECFF),
            Color(0xFFF8F6FF),
          ],
        ),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: AppTheme.mnemonicBorder.withValues(alpha: 0.3),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: AppTheme.mnemonicBorder.withValues(alpha: 0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.psychology_alt_rounded,
                color: AppTheme.mnemonicBorder,
                size: 20,
                semanticLabel: 'Memory Aid',
              ),
              const SizedBox(width: 8),
              Text(
                'Memory Aid',
                style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF5B21B6),
                  letterSpacing: 0.2,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            block.mnemonic,
            style: GoogleFonts.playfairDisplay(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: const Color(0xFF4C1D95),
              letterSpacing: -0.2,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            block.explanation,
            style: GoogleFonts.inter(
              fontSize: 13,
              height: 1.5,
              color: const Color(0xFF6D28D9),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNumberedList(NumberedListBlock block) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: block.items.map((item) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: AppTheme.accentTeal.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    item.key,
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.accentTeal,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    item.value,
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      height: 1.55,
                      color: AppTheme.textPrimary,
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildMedicationCard(MedicationCardBlock block) {
    final borderColor =
        block.isAvoid ? AppTheme.avoidBorder : AppTheme.accentTeal;
    final bgColor =
        block.isAvoid ? AppTheme.avoidBackground : const Color(0xFFF0FDFA);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: borderColor.withValues(alpha: 0.3), width: 1),
        boxShadow: [
          BoxShadow(
            color: borderColor.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                block.isAvoid
                    ? Icons.do_not_disturb_rounded
                    : Icons.check_circle_rounded,
                color: borderColor,
                size: 18,
                semanticLabel: block.isAvoid ? 'Avoid' : 'Recommended',
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  '${block.name} (${block.drugClass})',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: borderColor,
                    letterSpacing: -0.1,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          _buildMedDetailRow('Mechanism', block.mechanism),
          _buildMedDetailRow('Indication', block.indication),
          if (block.dosing.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(bottom: 3),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dosing: ',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      height: 1.5,
                      color: AppTheme.textSecondary,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      block.dosing,
                      style: GoogleFonts.jetBrainsMono(
                        fontSize: 12,
                        height: 1.5,
                        color: AppTheme.textPrimary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          if (block.sideEffects.isNotEmpty)
            _buildMedDetailRow('Side Effects', block.sideEffects),
          if (block.boardPearl.isNotEmpty) ...[
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppTheme.pearlBackground.withValues(alpha: 0.6),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Board Pearl: ${block.boardPearl}',
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.italic,
                  color: borderColor,
                  height: 1.4,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildMedDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 3),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: '$label: ',
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                height: 1.5,
                color: AppTheme.textSecondary,
              ),
            ),
            TextSpan(
              text: value,
              style: GoogleFonts.inter(
                fontSize: 12,
                height: 1.5,
                color: AppTheme.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildComparisonCard(ComparisonCardBlock block) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: block.backgroundColor,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: block.themeColor.withValues(alpha: 0.2), width: 1),
        boxShadow: [
          BoxShadow(
            color: block.themeColor.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 4,
            decoration: BoxDecoration(
              color: block.themeColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(14),
                bottomLeft: Radius.circular(14),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        block.icon,
                        color: block.themeColor,
                        size: 22,
                        semanticLabel: block.title,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          block.title,
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: block.themeColor,
                            letterSpacing: -0.2,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    block.description,
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      height: 1.5,
                      color: AppTheme.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ...block.keyPoints.map((p) => Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 7),
                              width: 5,
                              height: 5,
                              decoration: BoxDecoration(
                                color: block.themeColor.withValues(alpha: 0.7),
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                p,
                                style: GoogleFonts.inter(
                                  fontSize: 12,
                                  height: 1.5,
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
          ),
        ],
      ),
    );
  }

  Widget _buildScaleBlock(ScaleBlock block) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: AppTheme.accentTeal.withValues(alpha: 0.2),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: AppTheme.accentTeal.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppTheme.accentTeal.withValues(alpha: 0.12),
                  AppTheme.accentTeal.withValues(alpha: 0.05),
                ],
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(13),
                topRight: Radius.circular(13),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  block.scaleName,
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.accentTeal,
                    letterSpacing: -0.2,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  block.description,
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: AppTheme.textSecondary,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(
                  block.boardPearl != null ? 0 : 13),
              bottomRight: Radius.circular(
                  block.boardPearl != null ? 0 : 13),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columnSpacing: 18,
                horizontalMargin: 14,
                headingRowColor: WidgetStateProperty.all(
                  const Color(0xFFF8FAFC),
                ),
                headingTextStyle: GoogleFonts.inter(
                  fontWeight: FontWeight.w700,
                  fontSize: 11,
                  color: AppTheme.textPrimary,
                  letterSpacing: 0.2,
                ),
                dataTextStyle: GoogleFonts.inter(
                  fontSize: 11,
                  height: 1.4,
                  color: AppTheme.textPrimary,
                ),
                columns: block.columns
                    .map((c) => DataColumn(label: Text(c)))
                    .toList(),
                rows: List.generate(block.rows.length, (rowIndex) {
                  return DataRow(
                    color: WidgetStateProperty.all(
                      rowIndex.isEven
                          ? Colors.white
                          : const Color(0xFFFAFAFB),
                    ),
                    cells: block.rows[rowIndex]
                        .map((cell) => DataCell(
                              ConstrainedBox(
                                constraints:
                                    const BoxConstraints(maxWidth: 160),
                                child: Text(cell),
                              ),
                            ))
                        .toList(),
                  );
                }),
              ),
            ),
          ),
          if (block.boardPearl != null)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppTheme.pearlBackground,
                    Color(0xFFFFF8E1),
                  ],
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(13),
                  bottomRight: Radius.circular(13),
                ),
              ),
              child: Text(
                'Board Pearl: ${block.boardPearl}',
                style: GoogleFonts.inter(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.italic,
                  color: const Color(0xFF92400E),
                  height: 1.4,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
