import 'models/module_model.dart';

class ModuleData {
  static final List<ModuleModel> standardModules = [
    ModuleModel(
      id: 'stroke-fundamentals',
      title: 'Stroke Fundamentals',
      description:
          'Definition, epidemiology, risk factors, and the landscape of cerebrovascular disease.',
      highlights: ['Epidemiology', 'Risk factors', 'TIA'],
    ),
    ModuleModel(
      id: 'vascular-anatomy',
      title: 'Vascular Anatomy & Circle of Willis',
      description:
          'Cerebral circulation, Circle of Willis, vascular territories, and CSF circulation.',
      highlights: ['Circle of Willis', 'Vascular territories', 'CSF'],
    ),
    ModuleModel(
      id: 'ischemic-stroke',
      title: 'Ischemic Stroke Types',
      description:
          'Thrombotic, embolic, and lacunar strokes — mechanisms, presentation, and differences.',
      highlights: ['Thrombotic', 'Embolic', 'Lacunar'],
    ),
    ModuleModel(
      id: 'stroke-syndromes',
      title: 'Stroke Syndromes & Localization',
      description:
          'MCA, ACA, PCA syndromes, brainstem syndromes, and vascular localization.',
      highlights: ['MCA', 'Wallenberg', 'Lacunar syndromes'],
    ),
    ModuleModel(
      id: 'hemorrhagic-stroke',
      title: 'Hemorrhagic Stroke',
      description:
          'ICH, SAH, AVM, aneurysms, Hunt and Hess scale, and hemorrhagic management.',
      highlights: ['ICH', 'SAH', 'Hunt & Hess'],
    ),
    ModuleModel(
      id: 'diagnostic-studies',
      title: 'Diagnostic Studies & Neuroimaging',
      description:
          'CT vs MRI, carotid ultrasound, angiography, echocardiography, and diagnostic workup.',
      highlights: ['CT vs MRI', 'Angiography', 'Echo'],
    ),
    ModuleModel(
      id: 'acute-management',
      title: 'Acute Stroke Management',
      description:
          'tPA criteria, thrombectomy, BP management, ICP, seizure management.',
      highlights: ['tPA', 'Thrombectomy', 'BP management'],
    ),
    ModuleModel(
      id: 'stroke-pharmacology',
      title: 'Stroke Pharmacology & Prevention',
      description:
          'Anticoagulation, antiplatelets, statins, secondary prevention, and carotid surgery.',
      highlights: ['Antiplatelets', 'Anticoagulation', 'CEA'],
    ),
    ModuleModel(
      id: 'motor-recovery',
      title: 'Motor Recovery & Rehabilitation',
      description:
          'Brunnstrom stages, Twitchell, NDT/Bobath, CIMT, FES, and recovery predictors.',
      highlights: ['Brunnstrom', 'CIMT', 'Recovery predictors'],
    ),
    ModuleModel(
      id: 'spasticity-shoulder',
      title: 'Spasticity & Shoulder Complications',
      description:
          'Spasticity management, shoulder pain, CRPS, subluxation, and heterotopic ossification.',
      highlights: ['CRPS', 'Subluxation', 'Spasticity Rx'],
    ),
    ModuleModel(
      id: 'dysphagia-nutrition',
      title: 'Dysphagia & Swallowing',
      description:
          'VFSS, FEES, aspiration, four phases of swallowing, and nutritional management.',
      highlights: ['VFSS', 'FEES', 'Aspiration'],
    ),
    ModuleModel(
      id: 'cognition-communication',
      title: 'Cognition, Communication & Behavior',
      description:
          'Aphasia types, hemispatial neglect, apraxia, depression, and cognitive deficits.',
      highlights: ['Aphasia', 'Neglect', 'Depression'],
    ),
    ModuleModel(
      id: 'medical-complications',
      title: 'Medical Complications',
      description:
          'DVT, bladder/bowel dysfunction, cardiac disease, depression, and sexuality.',
      highlights: ['DVT', 'Bladder', 'Cardiac'],
    ),
    ModuleModel(
      id: 'outcomes-continuum',
      title: 'Outcomes & Rehab Continuum',
      description:
          'FIM, prognostication, IRF criteria, community reintegration, and ongoing care.',
      highlights: ['FIM', 'IRF criteria', 'Prognosis'],
    ),
  ];
}
