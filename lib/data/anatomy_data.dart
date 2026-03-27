import 'package:flutter/material.dart';
import 'models/anatomy_model.dart';

class InfographicData {
  static const List<Infographic> all = [
    // ── Anatomy / Vascular Diagrams ──
    Infographic(
      id: 'circle-of-willis',
      title: 'Circle of Willis',
      description:
          'Complete cerebral arterial circle with anterior (red) and posterior (blue) circulation color-coded',
      assetPath: 'assets/infographics/anatomy/circle_of_willis.svg',
      category: InfographicCategory.anatomy,
      moduleId: 'vascular-anatomy',
      icon: Icons.donut_large_rounded,
    ),
    Infographic(
      id: 'vascular-territories',
      title: 'Vascular Territories',
      description:
          'Lateral brain view showing MCA, ACA, and PCA territory distributions',
      assetPath: 'assets/infographics/anatomy/vascular_territories.svg',
      category: InfographicCategory.anatomy,
      moduleId: 'vascular-anatomy',
      icon: Icons.map_rounded,
    ),
    Infographic(
      id: 'mca-territory-detail',
      title: 'MCA Territory Detail',
      description:
          'Superior and inferior MCA divisions with lenticulostriate arteries and basal ganglia supply',
      assetPath: 'assets/infographics/anatomy/mca_territory_detail.svg',
      category: InfographicCategory.anatomy,
      moduleId: 'stroke-syndromes',
      icon: Icons.account_tree_rounded,
    ),
    Infographic(
      id: 'brainstem-cross-sections',
      title: 'Brainstem Cross-Sections',
      description:
          'Midbrain, pons, and medulla cross-sections with medial vs lateral structures and Rule of 4',
      assetPath: 'assets/infographics/anatomy/brainstem_cross_sections.svg',
      category: InfographicCategory.anatomy,
      moduleId: 'stroke-syndromes',
      icon: Icons.view_column_rounded,
    ),
    Infographic(
      id: 'homunculus-vascular',
      title: 'Homunculus & Vascular Territories',
      description:
          'Motor/sensory homunculus with MCA (face/arm) and ACA (leg) territory overlay',
      assetPath: 'assets/infographics/anatomy/homunculus_vascular.svg',
      category: InfographicCategory.anatomy,
      moduleId: 'stroke-syndromes',
      icon: Icons.accessibility_new_rounded,
    ),
    Infographic(
      id: 'ich-locations',
      title: 'ICH Locations & Frequencies',
      description:
          'Common intracerebral hemorrhage sites with percentages and associated deficits',
      assetPath: 'assets/infographics/anatomy/ich_locations.svg',
      category: InfographicCategory.anatomy,
      moduleId: 'hemorrhagic-stroke',
      icon: Icons.bloodtype_rounded,
    ),
    Infographic(
      id: 'ct-mri-comparison',
      title: 'CT vs MRI Comparison',
      description:
          'Side-by-side CT hypodense/hyperdense and MRI DWI restricted diffusion appearance',
      assetPath: 'assets/infographics/anatomy/ct_mri_comparison.svg',
      category: InfographicCategory.anatomy,
      moduleId: 'diagnostic-studies',
      icon: Icons.compare_rounded,
    ),
    Infographic(
      id: 'corticospinal-tract',
      title: 'Corticospinal Tract',
      description:
          'Motor pathway from cortex through internal capsule (PLIC) to pyramidal decussation',
      assetPath: 'assets/infographics/anatomy/corticospinal_tract.svg',
      category: InfographicCategory.anatomy,
      moduleId: 'motor-recovery',
      icon: Icons.linear_scale_rounded,
    ),
    Infographic(
      id: 'swallowing-anatomy',
      title: 'Swallowing Anatomy',
      description:
          'Sagittal view with 4 swallowing phases and cranial nerve involvement (V, VII, IX, X, XII)',
      assetPath: 'assets/infographics/anatomy/swallowing_anatomy.svg',
      category: InfographicCategory.anatomy,
      moduleId: 'dysphagia-nutrition',
      icon: Icons.restaurant_rounded,
    ),
    Infographic(
      id: 'aphasia-localization',
      title: 'Aphasia Localization',
      description:
          'Left hemisphere with Broca, Wernicke, arcuate fasciculus, and MCA territory overlay',
      assetPath: 'assets/infographics/anatomy/aphasia_localization.svg',
      category: InfographicCategory.anatomy,
      moduleId: 'cognition-communication',
      icon: Icons.record_voice_over_rounded,
    ),
  ];

  static List<Infographic> getByCategory(InfographicCategory category) =>
      all.where((i) => i.category == category).toList();

  static List<Infographic> getByModule(String moduleId) =>
      all.where((i) => i.moduleId == moduleId).toList();
}
