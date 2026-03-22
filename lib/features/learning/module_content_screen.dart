import 'package:flutter/material.dart';
import '../../data/models/module_model.dart';
import '../../data/module_contents/stroke_fundamentals_content.dart';
import '../../data/module_contents/vascular_anatomy_content.dart';
import '../../data/module_contents/ischemic_stroke_content.dart';
import '../../data/module_contents/stroke_syndromes_content.dart';
import '../../data/module_contents/hemorrhagic_stroke_content.dart';
import '../../data/module_contents/diagnostic_studies_content.dart';
import '../../data/module_contents/acute_management_content.dart';
import '../../data/module_contents/stroke_pharmacology_content.dart';
import '../../data/module_contents/motor_recovery_content.dart';
import '../../data/module_contents/spasticity_shoulder_content.dart';
import '../../data/module_contents/dysphagia_content.dart';
import '../../data/module_contents/cognition_communication_content.dart';
import '../../data/module_contents/medical_complications_content.dart';
import '../../data/module_contents/outcomes_continuum_content.dart';
import 'topic_content_view.dart';
import '../../data/models/topic_content_model.dart';

class ModuleContentScreen extends StatelessWidget {
  final ModuleModel module;

  const ModuleContentScreen({super.key, required this.module});

  TopicData? _getTopicData() {
    switch (module.id) {
      case 'stroke-fundamentals':
        return strokeFundamentalsContent;
      case 'vascular-anatomy':
        return vascularAnatomyContent;
      case 'ischemic-stroke':
        return ischemicStrokeContent;
      case 'stroke-syndromes':
        return strokeSyndromesContent;
      case 'hemorrhagic-stroke':
        return hemorrhagicStrokeContent;
      case 'diagnostic-studies':
        return diagnosticStudiesContent;
      case 'acute-management':
        return acuteManagementContent;
      case 'stroke-pharmacology':
        return strokePharmacologyContent;
      case 'motor-recovery':
        return motorRecoveryContent;
      case 'spasticity-shoulder':
        return spasticityShoulderContent;
      case 'dysphagia-nutrition':
        return dysphagiaContent;
      case 'cognition-communication':
        return cognitionCommunicationContent;
      case 'medical-complications':
        return medicalComplicationsContent;
      case 'outcomes-continuum':
        return outcomesContinuumContent;
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final topicData = _getTopicData();

    return Scaffold(
      appBar: AppBar(
        title: Text(module.title),
      ),
      body: topicData != null
          ? TopicContentView(topicData: topicData)
          : _buildComingSoon(),
    );
  }

  Widget _buildComingSoon() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.construction_rounded,
              size: 64,
              color: Colors.grey.shade400,
            ),
            const SizedBox(height: 16),
            Text(
              module.title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'Content coming soon!',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              module.description,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade500,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
