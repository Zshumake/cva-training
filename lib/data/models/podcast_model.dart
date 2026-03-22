class PodcastEpisode {
  final String id;
  final String title;
  final String description;
  final String moduleId;
  final String assetPath;

  const PodcastEpisode({
    required this.id,
    required this.title,
    required this.description,
    required this.moduleId,
    required this.assetPath,
  });
}

class PodcastData {
  static const List<PodcastEpisode> episodes = [
    PodcastEpisode(
      id: 'fundamentals-podcast',
      title: 'Stroke Fundamentals Board Review',
      description:
          'Board-focused podcast covering stroke epidemiology, risk factors, and classification.',
      moduleId: 'stroke-fundamentals',
      assetPath: 'assets/audio/stroke_fundamentals_podcast.wav',
    ),
    PodcastEpisode(
      id: 'syndromes-podcast',
      title: 'Stroke Syndromes Board Review',
      description:
          'Deep dive into MCA, ACA, PCA, vertebrobasilar syndromes, and brainstem localization.',
      moduleId: 'stroke-syndromes',
      assetPath: 'assets/audio/stroke_syndromes_podcast.wav',
    ),
    PodcastEpisode(
      id: 'acute-mgmt-podcast',
      title: 'Acute Stroke Management Board Review',
      description:
          'tPA criteria, thrombectomy, BP management, ICP, and acute interventions.',
      moduleId: 'acute-management',
      assetPath: 'assets/audio/acute_management_podcast.wav',
    ),
    PodcastEpisode(
      id: 'rehab-podcast',
      title: 'Stroke Rehabilitation Board Review',
      description:
          'Motor recovery, Brunnstrom stages, CIMT, spasticity management, and outcomes.',
      moduleId: 'motor-recovery',
      assetPath: 'assets/audio/motor_recovery_podcast.wav',
    ),
  ];
}
