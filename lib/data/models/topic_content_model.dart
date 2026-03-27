import 'package:flutter/material.dart';
import '../../core/widgets/drag_drop_mapper.dart';

// --- Generic Block Types ---

abstract class ContentBlock {}

class HeaderBlock extends ContentBlock {
  final String title;
  HeaderBlock(this.title);
}

class TextBlock extends ContentBlock {
  final String text;
  final bool isIntro;
  TextBlock(this.text, {this.isIntro = false});
}

class PearlBlock extends ContentBlock {
  final String title;
  final String text;
  PearlBlock(this.title, this.text);
}

class BulletCardBlock extends ContentBlock {
  final String title;
  final Color themeColor;
  final Color backgroundColor;
  final List<String> points;
  BulletCardBlock({
    required this.title,
    required this.themeColor,
    required this.backgroundColor,
    required this.points,
  });
}

class NumberedListBlock extends ContentBlock {
  final List<MapEntry<String, String>> items;
  NumberedListBlock(this.items);
}

class TableBlock extends ContentBlock {
  final String title;
  final List<String> columns;
  final List<List<String>> rows;
  final Color? headerColor;
  TableBlock({
    required this.title,
    required this.columns,
    required this.rows,
    this.headerColor,
  });
}

class ComparisonCardBlock extends ContentBlock {
  final String title;
  final Color themeColor;
  final Color backgroundColor;
  final IconData icon;
  final String description;
  final List<String> keyPoints;

  ComparisonCardBlock({
    required this.title,
    required this.themeColor,
    required this.backgroundColor,
    required this.icon,
    required this.description,
    required this.keyPoints,
  });
}

class MnemonicBlock extends ContentBlock {
  final String mnemonic;
  final String explanation;
  MnemonicBlock(this.mnemonic, this.explanation);
}

class ScaleBlock extends ContentBlock {
  final String scaleName;
  final String description;
  final List<String> columns;
  final List<List<String>> rows;
  final String? boardPearl;
  ScaleBlock({
    required this.scaleName,
    required this.description,
    required this.columns,
    required this.rows,
    this.boardPearl,
  });
}

class MedicationCardBlock extends ContentBlock {
  final String name;
  final String drugClass;
  final String mechanism;
  final String indication;
  final String dosing;
  final String sideEffects;
  final String boardPearl;
  final bool isAvoid;

  MedicationCardBlock({
    required this.name,
    required this.drugClass,
    required this.mechanism,
    required this.indication,
    this.dosing = '',
    this.sideEffects = '',
    this.boardPearl = '',
    this.isAvoid = false,
  });
}

class AvoidBlock extends ContentBlock {
  final String title;
  final String text;
  AvoidBlock(this.title, this.text);
}

class KnowledgeCheckBlock extends ContentBlock {
  final String question;
  final List<String> options;
  final int correctIndex;
  final String explanation;
  final String? boardRelevance;

  KnowledgeCheckBlock({
    required this.question,
    required this.options,
    required this.correctIndex,
    required this.explanation,
    this.boardRelevance,
  });
}

class TimelineMilestone {
  final String label;
  final String title;
  final List<String> details;
  final Color? color;

  TimelineMilestone({
    required this.label,
    required this.title,
    required this.details,
    this.color,
  });
}

class TimelineBlock extends ContentBlock {
  final String title;
  final List<TimelineMilestone> milestones;

  TimelineBlock({
    required this.title,
    required this.milestones,
  });
}

// Enum for bespoke custom widgets
enum CustomWidgetType {
  nihssScoreTool,
  huntHessScale,
  brunnstromStages,
  aphasiaClassification,
  strokeTypeComparison,
  swallowingPhases,
  tpaChecklist,
  vascularTerritories,
  lacunarSyndromes,
  brainstemSyndromes,
  fisherScale,
}

class CustomWidgetBlock extends ContentBlock {
  final CustomWidgetType type;
  CustomWidgetBlock(this.type);
}

// --- Interactive Visual Learning Blocks ---

class BeforeAfterBlock extends ContentBlock {
  final String? title;
  final String beforeImage;
  final String afterImage;
  final String? caption;

  BeforeAfterBlock({
    this.title,
    required this.beforeImage,
    required this.afterImage,
    this.caption,
  });
}

class SpotFindingBlock extends ContentBlock {
  final String? title;
  final String imagePath;
  final String? annotatedImagePath;
  final double targetCenterX; // normalized 0.0-1.0
  final double targetCenterY; // normalized 0.0-1.0
  final double targetRadius; // normalized 0.0-1.0
  final String findingName;
  final String teachingPoint;

  SpotFindingBlock({
    this.title,
    required this.imagePath,
    this.annotatedImagePath,
    required this.targetCenterX,
    required this.targetCenterY,
    required this.targetRadius,
    required this.findingName,
    required this.teachingPoint,
  });
}

class DragDropBlock extends ContentBlock {
  final String title;
  final List<DragItem> items;
  final List<DropTarget> targets;
  final DiagramType diagramType;

  DragDropBlock({
    required this.title,
    required this.items,
    required this.targets,
    required this.diagramType,
  });
}

// --- Audio Recognition Trainer ---

class AudioChallengeBlock extends ContentBlock {
  final String title;
  final String audioAssetPath;
  final String transcript;
  final List<String> options;
  final int correctIndex;
  final String explanation;
  final List<String> keyFeatures;

  AudioChallengeBlock({
    required this.title,
    required this.audioAssetPath,
    required this.transcript,
    required this.options,
    required this.correctIndex,
    required this.explanation,
    required this.keyFeatures,
  });
}

// --- Clinical Video Atlas ---

class VideoAnnotation {
  final double timestamp;
  final String label;
  final double x;
  final double y;

  const VideoAnnotation({
    required this.timestamp,
    required this.label,
    required this.x,
    required this.y,
  });
}

class VideoAtlasBlock extends ContentBlock {
  final String title;
  final String videoAssetPath;
  final String description;
  final List<VideoAnnotation> annotations;
  final String? boardRelevance;

  VideoAtlasBlock({
    required this.title,
    required this.videoAssetPath,
    required this.description,
    required this.annotations,
    this.boardRelevance,
  });
}

// --- Tab and Topic Containers ---

class TopicTab {
  final String title;
  final List<ContentBlock> blocks;

  TopicTab({required this.title, required this.blocks});
}

class TopicData {
  final String id;
  final String title;
  final List<TopicTab> tabs;

  TopicData({required this.id, required this.title, required this.tabs});
}
