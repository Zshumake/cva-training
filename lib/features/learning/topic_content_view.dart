import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../data/models/topic_content_model.dart';
import '../../core/theme/app_theme.dart';
import '../../core/widgets/before_after_slider.dart';
import '../../core/widgets/spot_the_finding.dart';
import '../../core/widgets/drag_drop_mapper.dart';
import '../../core/widgets/audio_recognition_trainer.dart';
import '../../core/widgets/video_atlas_viewer.dart';

class TopicContentView extends StatelessWidget {
  final TopicData topicData;

  const TopicContentView({super.key, required this.topicData});

  // ─── Shared decoration constants ───
  static const _blockRadius = AppTheme.radiusMD;
  static const _blockHPadding = AppTheme.spacingMD;
  static const _blockVPadding = AppTheme.spacingMD; // 16px
  static const _blockSpacing = 20.0; // breathing room between blocks
  static const _cardShadow = [
    BoxShadow(
      color: Color(0x08000000),
      blurRadius: 8,
      offset: Offset(0, 2),
    ),
  ];
  // Elevated shadow for high-priority blocks (pearls, mnemonics, knowledge checks)
  static const _elevatedShadow = [
    BoxShadow(
      color: Color(0x14000000),
      blurRadius: 16,
      offset: Offset(0, 4),
    ),
  ];

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
                return Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 720),
                    child: ListView.builder(
                      padding: const EdgeInsets.all(AppTheme.spacingMD),
                      itemCount: tab.blocks.length,
                      itemBuilder: (context, index) {
                        return _buildBlock(tab.blocks[index]);
                      },
                    ),
                  ),
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
    if (block is AvoidBlock) return _buildAvoid(block);
    if (block is KnowledgeCheckBlock) return _KnowledgeCheckWidget(block: block);
    if (block is TimelineBlock) return _TimelineWidget(block: block);
    if (block is BeforeAfterBlock) return _buildBeforeAfter(block);
    if (block is SpotFindingBlock) return _buildSpotFinding(block);
    if (block is DragDropBlock) return _buildDragDrop(block);
    if (block is AudioChallengeBlock) return _buildAudioChallenge(block);
    if (block is VideoAtlasBlock) return _buildVideoAtlas(block);
    return const SizedBox.shrink();
  }

  // ─── BEFORE / AFTER SLIDER BLOCK ───
  Widget _buildBeforeAfter(BeforeAfterBlock block) {
    return Padding(
      padding: const EdgeInsets.only(bottom: _blockSpacing),
      child: BeforeAfterSlider(
        beforeImage: block.beforeImage,
        afterImage: block.afterImage,
        title: block.title,
        caption: block.caption,
      ),
    );
  }

  // ─── SPOT THE FINDING BLOCK ───
  Widget _buildSpotFinding(SpotFindingBlock block) {
    return Padding(
      padding: const EdgeInsets.only(bottom: _blockSpacing),
      child: SpotTheFindingChallenge(
        imagePath: block.imagePath,
        annotatedImagePath: block.annotatedImagePath,
        targetCenter: Offset(block.targetCenterX, block.targetCenterY),
        targetRadius: block.targetRadius,
        findingName: block.findingName,
        teachingPoint: block.teachingPoint,
        title: block.title,
      ),
    );
  }

  // ─── DRAG DROP MAPPER BLOCK ───
  Widget _buildDragDrop(DragDropBlock block) {
    return Padding(
      padding: const EdgeInsets.only(bottom: _blockSpacing),
      child: DragDropMapper(
        exercise: DragDropExercise(
          title: block.title,
          items: block.items,
          targets: block.targets,
          diagramType: block.diagramType,
        ),
      ),
    );
  }

  // ─── AUDIO CHALLENGE BLOCK ───
  Widget _buildAudioChallenge(AudioChallengeBlock block) {
    return Padding(
      padding: const EdgeInsets.only(bottom: _blockSpacing),
      child: AudioRecognitionTrainer(block: block),
    );
  }

  // ─── VIDEO ATLAS BLOCK ───
  Widget _buildVideoAtlas(VideoAtlasBlock block) {
    return Padding(
      padding: const EdgeInsets.only(bottom: _blockSpacing),
      child: VideoAtlasViewer(block: block),
    );
  }

  // ─── HEADER BLOCK ───
  Widget _buildHeader(HeaderBlock block) {
    return Padding(
      padding: const EdgeInsets.only(top: 32, bottom: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: AppTheme.spacingSM),
          Text(
            block.title,
            textAlign: TextAlign.center,
            style: GoogleFonts.sourceSerif4(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: AppTheme.primaryNavy,
              letterSpacing: -0.5,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: 48,
            height: 2,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppTheme.accentTeal, AppTheme.accentCopper],
              ),
              borderRadius: BorderRadius.circular(1),
            ),
          ),
        ],
      ),
    );
  }

  // ─── TEXT BLOCK ───
  Widget _buildText(TextBlock block) {
    return Padding(
      padding: EdgeInsets.only(bottom: block.isIntro ? _blockSpacing : _blockSpacing * 0.7),
      child: Text(
        block.text,
        style: GoogleFonts.inter(
          fontSize: block.isIntro ? 16 : 14.5,
          height: 1.8,
          color: block.isIntro ? AppTheme.textPrimary : AppTheme.textSecondary,
          fontStyle: block.isIntro ? FontStyle.italic : FontStyle.normal,
          letterSpacing: -0.1,
        ),
      ),
    );
  }

  // ─── PEARL BLOCK ───
  Widget _buildPearl(PearlBlock block) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: _blockSpacing * 0.6),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFBEB),
        borderRadius: BorderRadius.circular(_blockRadius),
        border: const Border(
          left: BorderSide(color: Color(0xFFD97706), width: 4),
        ),
        boxShadow: _elevatedShadow,
      ),
      child: Stack(
        children: [
          // Watermark lightbulb — larger and more visible
          Positioned(
            top: 14,
            left: 14,
            child: Icon(
              Icons.lightbulb_rounded,
              color: const Color(0xFFD97706).withValues(alpha: 0.12),
              size: 40,
              semanticLabel: 'Clinical Pearl',
            ),
          ),
          // Content
          Padding(
            padding: const EdgeInsets.fromLTRB(
                _blockHPadding + 4, _blockVPadding + 2, _blockHPadding + 4, _blockVPadding + 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 32),
                  child: Text(
                    'BOARD PEARL',
                    style: GoogleFonts.inter(
                      fontSize: 11,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xFFD97706),
                      letterSpacing: 1.4,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                if (block.title.isNotEmpty && block.title != 'Board Pearl') ...[
                  Text(
                    block.title,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF92400E),
                      letterSpacing: -0.1,
                    ),
                  ),
                  const SizedBox(height: 4),
                ],
                Text(
                  block.text,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    height: 1.7,
                    color: const Color(0xFF78350F),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ─── MNEMONIC BLOCK ───
  Widget _buildMnemonic(MnemonicBlock block) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: _blockSpacing * 0.6),
      decoration: BoxDecoration(
        color: const Color(0xFFEEF2FF),
        borderRadius: BorderRadius.circular(_blockRadius),
        border: const Border(
          left: BorderSide(color: Color(0xFF4F46E5), width: 4),
        ),
        boxShadow: _elevatedShadow,
      ),
      child: Stack(
        children: [
          // Watermark brain icon
          Positioned(
            top: 12,
            left: 12,
            child: Icon(
              Icons.psychology_alt_rounded,
              color: const Color(0xFF4F46E5).withValues(alpha: 0.15),
              size: 32,
              semanticLabel: 'Memory Aid',
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(
                _blockHPadding, _blockVPadding, _blockHPadding, _blockVPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 28),
                  child: Text(
                    'MEMORY AID',
                    style: GoogleFonts.inter(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF4F46E5),
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  block.mnemonic,
                  style: GoogleFonts.sourceSerif4(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.italic,
                    color: const Color(0xFF4C1D95),
                    letterSpacing: -0.2,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  block.explanation,
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    height: 1.6,
                    color: const Color(0xFF6D28D9),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ─── AVOID BLOCK ───
  Widget _buildAvoid(AvoidBlock block) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: _blockSpacing * 0.6),
      decoration: BoxDecoration(
        color: const Color(0xFFFEF2F2),
        borderRadius: BorderRadius.circular(_blockRadius),
        border: const Border(
          left: BorderSide(color: Color(0xFFDC2626), width: 4),
        ),
        boxShadow: _elevatedShadow,
      ),
      child: Stack(
        children: [
          // Watermark warning triangle
          Positioned(
            top: 12,
            left: 12,
            child: Icon(
              Icons.warning_rounded,
              color: const Color(0xFFDC2626).withValues(alpha: 0.15),
              size: 32,
              semanticLabel: 'Warning',
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(
                _blockHPadding, _blockVPadding, _blockHPadding, _blockVPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 28),
                  child: Text(
                    'CLINICAL WARNING',
                    style: GoogleFonts.inter(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFFDC2626),
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                if (block.title.isNotEmpty) ...[
                  Text(
                    block.title,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF991B1B),
                      letterSpacing: -0.1,
                    ),
                  ),
                  const SizedBox(height: 4),
                ],
                Text(
                  block.text,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    height: 1.7,
                    color: const Color(0xFF7F1D1D),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ─── TABLE BLOCK ───
  Widget _buildTable(TableBlock block) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: _blockSpacing / 2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(_blockRadius),
        border: Border.all(color: AppTheme.borderSubtle, width: 1),
        boxShadow: _cardShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (block.title.isNotEmpty)
            Padding(
              padding: const EdgeInsets.fromLTRB(
                  _blockHPadding, _blockVPadding, _blockHPadding, 0),
              child: Text(
                block.title,
                style: GoogleFonts.sourceSerif4(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.primaryNavy,
                  letterSpacing: -0.2,
                ),
              ),
            ),
          if (block.title.isNotEmpty) const SizedBox(height: 8),
          // Table with full-width rows
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: const Radius.circular(_blockRadius),
              bottomRight: const Radius.circular(_blockRadius),
              topLeft:
                  Radius.circular(block.title.isEmpty ? _blockRadius : 0),
              topRight:
                  Radius.circular(block.title.isEmpty ? _blockRadius : 0),
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: constraints.maxWidth,
                    ),
                    child: DataTable(
                      headingRowColor:
                          WidgetStateProperty.all(AppTheme.gray100),
                      columnSpacing: 20,
                      horizontalMargin: _blockHPadding,
                      dataRowMinHeight: 40,
                      headingTextStyle: GoogleFonts.inter(
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                        color: AppTheme.primaryNavy,
                        letterSpacing: 0.5,
                      ),
                      dataTextStyle: GoogleFonts.inter(
                        fontSize: 13,
                        color: AppTheme.textPrimary,
                        height: 1.5,
                      ),
                      columns: block.columns
                          .map((c) => DataColumn(
                                label: Text(c.toUpperCase()),
                              ))
                          .toList(),
                      rows: List.generate(block.rows.length, (rowIndex) {
                        return DataRow(
                          color: WidgetStateProperty.all(
                            rowIndex.isEven
                                ? Colors.white
                                : AppTheme.gray100,
                          ),
                          cells: block.rows[rowIndex]
                              .map((cell) => DataCell(
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: Text(cell),
                                    ),
                                  ))
                              .toList(),
                        );
                      }),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // ─── BULLET CARD BLOCK ───
  Widget _buildBulletCard(BulletCardBlock block) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: _blockSpacing / 2),
      padding: const EdgeInsets.symmetric(
          horizontal: _blockHPadding, vertical: _blockVPadding),
      decoration: BoxDecoration(
        color: block.backgroundColor,
        borderRadius: BorderRadius.circular(_blockRadius),
        border: Border.all(
          color: block.themeColor.withValues(alpha: 0.2),
          width: 1,
        ),
        boxShadow: _cardShadow,
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
          const SizedBox(height: 10),
          ...block.points.map((point) => Padding(
                padding: const EdgeInsets.only(bottom: 7),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 7, left: 4),
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: block.themeColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Text(
                        point,
                        style: GoogleFonts.inter(
                          fontSize: 14,
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
    );
  }

  // ─── NUMBERED LIST BLOCK ───
  Widget _buildNumberedList(NumberedListBlock block) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: _blockSpacing / 2),
      child: Column(
        children: block.items.map((item) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 28,
                  height: 28,
                  decoration: const BoxDecoration(
                    color: AppTheme.accentTeal,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    item.key,
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      item.value,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        height: 1.6,
                        color: AppTheme.textPrimary,
                      ),
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

  // ─── MEDICATION CARD BLOCK ───
  Widget _buildMedicationCard(MedicationCardBlock block) {
    final borderColor =
        block.isAvoid ? AppTheme.avoidBorder : AppTheme.accentTeal;
    final bgColor =
        block.isAvoid ? AppTheme.avoidBackground : const Color(0xFFF0FDFA);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: _blockSpacing / 2),
      padding: const EdgeInsets.symmetric(
          horizontal: _blockHPadding, vertical: _blockVPadding),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(_blockRadius),
        border: Border.all(
            color: borderColor.withValues(alpha: 0.25), width: 1),
        boxShadow: _cardShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header row: pill icon + name
          Row(
            children: [
              Icon(
                block.isAvoid
                    ? Icons.do_not_disturb_rounded
                    : Icons.medication_rounded,
                color: borderColor,
                size: 20,
                semanticLabel: block.isAvoid ? 'Avoid' : 'Medication',
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  '${block.name} (${block.drugClass})',
                  style: GoogleFonts.inter(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: borderColor,
                    letterSpacing: -0.2,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          // Key-value pairs
          _buildMedDetailRow('Mechanism', block.mechanism),
          _buildMedDetailRow('Indication', block.indication),
          if (block.dosing.isNotEmpty) ...[
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dosing: ',
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      height: 1.5,
                      color: AppTheme.textSecondary,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      block.dosing,
                      style: AppTheme.dosingStyle(),
                    ),
                  ),
                ],
              ),
            ),
          ],
          if (block.sideEffects.isNotEmpty)
            _buildMedDetailRow('Side Effects', block.sideEffects),
          if (block.boardPearl.isNotEmpty) ...[
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppTheme.pearlBackground.withValues(alpha: 0.6),
                borderRadius: BorderRadius.circular(AppTheme.radiusSM),
                border: const Border(
                  left: BorderSide(color: AppTheme.accentCopper, width: 2),
                ),
              ),
              child: Text(
                'Board Pearl: ${block.boardPearl}',
                style: AppTheme.boardPearlStyle(),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildMedDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: '$label: ',
              style: GoogleFonts.inter(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                height: 1.5,
                color: AppTheme.textSecondary,
              ),
            ),
            TextSpan(
              text: value,
              style: GoogleFonts.inter(
                fontSize: 14,
                height: 1.5,
                color: AppTheme.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ─── COMPARISON CARD BLOCK ───
  Widget _buildComparisonCard(ComparisonCardBlock block) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: _blockSpacing / 2),
      decoration: BoxDecoration(
        color: block.backgroundColor,
        borderRadius: BorderRadius.circular(_blockRadius),
        border: Border.all(
            color: block.themeColor.withValues(alpha: 0.15), width: 1),
        boxShadow: _cardShadow,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left accent border
          Container(
            width: 4,
            decoration: BoxDecoration(
              color: block.themeColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(_blockRadius),
                bottomLeft: Radius.circular(_blockRadius),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: _blockHPadding, vertical: _blockVPadding),
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
                  if (block.description.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    Text(
                      block.description,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        height: 1.6,
                        color: AppTheme.textPrimary,
                      ),
                    ),
                  ],
                  const SizedBox(height: 10),
                  ...block.keyPoints.map((p) => Padding(
                        padding: const EdgeInsets.only(bottom: 6),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 7, left: 4),
                              width: 6,
                              height: 6,
                              decoration: BoxDecoration(
                                color: block.themeColor,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 14),
                            Expanded(
                              child: Text(
                                p,
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
          ),
        ],
      ),
    );
  }

  // ─── KNOWLEDGE CHECK & TIMELINE are StatefulWidgets below ───

  // ─── SCALE BLOCK ───
  Widget _buildScaleBlock(ScaleBlock block) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: _blockSpacing / 2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(_blockRadius),
        border: Border.all(
          color: AppTheme.borderSubtle,
          width: 1,
        ),
        boxShadow: _cardShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Scale name and description
          Padding(
            padding: const EdgeInsets.fromLTRB(
                _blockHPadding, _blockVPadding, _blockHPadding, 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  block.scaleName,
                  style: AppTheme.scaleHeaderStyle(),
                ),
                if (block.description.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text(
                    block.description,
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      color: AppTheme.textSecondary,
                      height: 1.5,
                    ),
                  ),
                ],
              ],
            ),
          ),
          const Divider(height: 1, color: AppTheme.borderSubtle),
          // Score rows as horizontal cards
          ...List.generate(block.rows.length, (rowIndex) {
            final row = block.rows[rowIndex];
            final isEven = rowIndex.isEven;
            return Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: _blockHPadding, vertical: 10),
              decoration: BoxDecoration(
                color: isEven ? Colors.white : AppTheme.gray100,
                border: const Border(
                  left: BorderSide(color: AppTheme.accentTeal, width: 3),
                ),
                borderRadius: rowIndex == block.rows.length - 1 &&
                        block.boardPearl == null
                    ? const BorderRadius.only(
                        bottomLeft: Radius.circular(_blockRadius),
                        bottomRight: Radius.circular(_blockRadius),
                      )
                    : null,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (row.isNotEmpty)
                    SizedBox(
                      width: 40,
                      child: Text(
                        row[0],
                        style: GoogleFonts.inter(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: AppTheme.primaryNavy,
                          height: 1.1,
                        ),
                      ),
                    ),
                  if (row.length > 1)
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8, top: 2),
                        child: Text(
                          row.sublist(1).join(' - '),
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            height: 1.5,
                            color: AppTheme.textPrimary,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            );
          }),
          if (block.boardPearl != null)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFFFFDF5),
                border: const Border(
                  left: BorderSide(color: AppTheme.accentCopper, width: 3),
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(_blockRadius),
                  bottomRight: Radius.circular(_blockRadius),
                ),
              ),
              child: Text(
                'Board Pearl: ${block.boardPearl}',
                style: AppTheme.boardPearlStyle(),
              ),
            ),
        ],
      ),
    );
  }
}

// ─── KNOWLEDGE CHECK WIDGET ───
class _KnowledgeCheckWidget extends StatefulWidget {
  final KnowledgeCheckBlock block;
  const _KnowledgeCheckWidget({required this.block});

  @override
  State<_KnowledgeCheckWidget> createState() => _KnowledgeCheckWidgetState();
}

class _KnowledgeCheckWidgetState extends State<_KnowledgeCheckWidget> {
  int? _selectedIndex;
  bool _answered = false;

  static const _tealBg = Color(0xFFF0FDFA);
  static const _letters = ['A', 'B', 'C', 'D'];

  void _onTap(int index) {
    if (_answered) return;
    setState(() {
      _selectedIndex = index;
      _answered = true;
    });
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
            // Top row: label + optional board chip
            Row(
              children: [
                Text(
                  'KNOWLEDGE CHECK',
                  style: GoogleFonts.inter(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.accentTeal,
                    letterSpacing: 1.2,
                  ),
                ),
                const Spacer(),
                if (block.boardRelevance != null)
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: AppTheme.accentCopper.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(AppTheme.radiusSM),
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
            const SizedBox(height: 10),
            // Question
            Text(
              block.question,
              style: GoogleFonts.sourceSerif4(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppTheme.primaryNavy,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 14),
            // Options
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
                  onTap: () => _onTap(i),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 10),
                    decoration: BoxDecoration(
                      color: bgColor,
                      borderRadius:
                          BorderRadius.circular(AppTheme.radiusSM),
                      border: Border.all(color: borderColor, width: 1.5),
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
                            _letters[i],
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: _answered && (isCorrect || isSelected)
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
            // Explanation
            AnimatedCrossFade(
              firstChild: const SizedBox.shrink(),
              secondChild: Container(
                margin: const EdgeInsets.only(top: 4),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(AppTheme.radiusSM),
                  border: const Border(
                    left:
                        BorderSide(color: AppTheme.successGreen, width: 3),
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
}

// ─── TIMELINE WIDGET ───
class _TimelineWidget extends StatefulWidget {
  final TimelineBlock block;
  const _TimelineWidget({required this.block});

  @override
  State<_TimelineWidget> createState() => _TimelineWidgetState();
}

class _TimelineWidgetState extends State<_TimelineWidget>
    with SingleTickerProviderStateMixin {
  int? _expandedIndex;

  void _onMilestoneTap(int index) {
    setState(() {
      _expandedIndex = _expandedIndex == index ? null : index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final block = widget.block;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            block.title,
            style: GoogleFonts.sourceSerif4(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppTheme.primaryNavy,
              letterSpacing: -0.3,
            ),
          ),
          const SizedBox(height: 16),
          // Horizontal scrollable timeline
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Timeline row: dots connected by lines
                Row(
                  children: List.generate(
                    block.milestones.length * 2 - 1,
                    (i) {
                      if (i.isOdd) {
                        // Connector line
                        return Container(
                          width: 48,
                          height: 2,
                          color: AppTheme.gray300,
                        );
                      }
                      final mIndex = i ~/ 2;
                      final milestone = block.milestones[mIndex];
                      final dotColor =
                          milestone.color ?? AppTheme.accentTeal;
                      final isExpanded = _expandedIndex == mIndex;
                      return GestureDetector(
                        onTap: () => _onMilestoneTap(mIndex),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AnimatedContainer(
                              duration: AppTheme.durationFast,
                              width: isExpanded ? 16 : 12,
                              height: isExpanded ? 16 : 12,
                              decoration: BoxDecoration(
                                color: dotColor,
                                shape: BoxShape.circle,
                                border: isExpanded
                                    ? Border.all(
                                        color: dotColor
                                            .withValues(alpha: 0.3),
                                        width: 3,
                                      )
                                    : null,
                                boxShadow: isExpanded
                                    ? [
                                        BoxShadow(
                                          color: dotColor
                                              .withValues(alpha: 0.3),
                                          blurRadius: 6,
                                        ),
                                      ]
                                    : null,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              milestone.label,
                              style: GoogleFonts.inter(
                                fontSize: 11,
                                fontWeight: isExpanded
                                    ? FontWeight.w700
                                    : FontWeight.w500,
                                color: isExpanded
                                    ? AppTheme.primaryNavy
                                    : AppTheme.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          // Expanded detail card
          AnimatedSwitcher(
            duration: AppTheme.durationNormal,
            transitionBuilder: (child, animation) {
              return SizeTransition(
                sizeFactor: animation,
                axisAlignment: -1,
                child: child,
              );
            },
            child: _expandedIndex != null
                ? _buildMilestoneCard(block.milestones[_expandedIndex!])
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }

  Widget _buildMilestoneCard(TimelineMilestone milestone) {
    final dotColor = milestone.color ?? AppTheme.accentTeal;
    return Container(
      key: ValueKey(milestone.label),
      width: double.infinity,
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppTheme.radiusMD),
        border: Border(
          left: BorderSide(color: dotColor, width: 3),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x08000000),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            milestone.title,
            style: GoogleFonts.inter(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: AppTheme.primaryNavy,
              letterSpacing: -0.2,
            ),
          ),
          const SizedBox(height: 8),
          ...milestone.details.map((d) => Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 7, left: 4),
                      width: 5,
                      height: 5,
                      decoration: BoxDecoration(
                        color: dotColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        d,
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
    );
  }
}
