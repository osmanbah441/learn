part of '../mock_api.dart';

final class _LabTestCollection {
  static final _tests = <LabTest>[
    LabTest(
        id: '1',
        name: 'Complete Blood Count (CBC)',
        description:
            'A test to evaluate overall health and detect a variety of disorders, including anemia, infection, and leukemia.',
        category: '1',
        formFields: [
          FormFieldConfiguration(
            label: 'Hemoglobin Level (g/dL)',
            type: FormFieldType.number,
          ),
          FormFieldConfiguration(
              label: 'White Blood Cell Count (cells/µL)',
              type: FormFieldType.number),
          FormFieldConfiguration(
              label: 'Platelet Count (cells/µL)', type: FormFieldType.number),
          FormFieldConfiguration(
              label: 'Red Blood Cell Count (cells/µL)',
              type: FormFieldType.number)
        ]),
    LabTest(
        id: '2',
        name: 'Blood Culture',
        description:
            'A test to detect the presence of bacteria or fungi in the blood.',
        category: '2',
        formFields: [
          FormFieldConfiguration(
              label: 'Sample Type',
              type: FormFieldType.dropdown,
              options: ['Whole Blood', 'Serum']),
          FormFieldConfiguration(
              label: 'Incubation Time (hours)', type: FormFieldType.number),
          FormFieldConfiguration(
              label: 'Growth Observed',
              type: FormFieldType.toggle,
              options: ['True', 'False']),
          FormFieldConfiguration(
              label: 'Type of Bacteria Detected', type: FormFieldType.text)
        ]),
    LabTest(
        id: '3',
        name: 'Liver Function Test (LFT)',
        description:
            'A test to measure enzymes and proteins in the blood to check for liver damage or disease.',
        category: '3',
        formFields: [
          FormFieldConfiguration(
            label: 'Bilirubin Level (mg/dL)',
            type: FormFieldType.number,
          ),
          FormFieldConfiguration(
            label: 'ALT (U/L)',
            type: FormFieldType.number,
          ),
          FormFieldConfiguration(
            label: 'AST (U/L)',
            type: FormFieldType.number,
          ),
          FormFieldConfiguration(
            label: 'Albumin (g/dL)',
            type: FormFieldType.number,
          )
        ]),
    LabTest(
        id: '4',
        name: 'HIV Antibody Test',
        description: 'A test to detect antibodies to HIV in the blood.',
        category: '4',
        formFields: [
          FormFieldConfiguration(
              label: 'Test Result',
              type: FormFieldType.dropdown,
              options: ['Positive', 'Negative', 'Inconclusive'])
        ]),
    LabTest(
        id: '5',
        name: 'Polymerase Chain Reaction (PCR)',
        description:
            'A test to amplify DNA, commonly used to detect viral infections.',
        category: '5',
        formFields: [
          FormFieldConfiguration(
            label: 'Cycle Threshold (Ct)',
            type: FormFieldType.number,
          ),
          FormFieldConfiguration(
              label: 'Test Result',
              type: FormFieldType.dropdown,
              options: ['Positive', 'Negative'])
        ]),
    LabTest(
        id: '6',
        name: 'Biopsy Analysis',
        description:
            'A test to examine tissue under a microscope to look for disease.',
        category: '6',
        formFields: [
          FormFieldConfiguration(label: 'Diagnosis', type: FormFieldType.text)
        ]),
    LabTest(
        id: '7',
        name: 'Rapid Plasma Reagin (RPR)',
        description:
            'A test to screen for syphilis by detecting non-specific antibodies in the blood.',
        category: '7',
        formFields: [
          FormFieldConfiguration(
              label: 'Reactivity',
              type: FormFieldType.dropdown,
              options: ['Reactive', 'Non-reactive'])
        ]),
    LabTest(
        id: '8',
        name: 'Drug Screening',
        description: 'A test to detect the presence of drugs in the urine.',
        category: '8',
        formFields: [
          FormFieldConfiguration(
              label: 'Substance Detected',
              type: FormFieldType.dropdown,
              options: ['THC', 'Cocaine', 'Opiates', 'Amphetamines']),
          FormFieldConfiguration(
              label: 'Concentration (ng/mL)', type: FormFieldType.number),
          FormFieldConfiguration(
              label: 'Result',
              type: FormFieldType.dropdown,
              options: ['Positive', 'Negative', 'Inconclusive'])
        ]),
    LabTest(
        id: '9',
        name: 'Thyroid Function Test (TFT)',
        description:
            'A test to measure thyroid hormones to check for thyroid gland activity.',
        category: '9',
        formFields: [
          FormFieldConfiguration(
            label: 'TSH Level (µIU/mL)',
            type: FormFieldType.number,
          ),
          FormFieldConfiguration(
            label: 'T4 Level (µg/dL)',
            type: FormFieldType.number,
          ),
          FormFieldConfiguration(
            label: 'T3 Level (ng/dL)',
            type: FormFieldType.number,
          )
        ]),
    LabTest(
      id: '10',
      name: 'Chromosomal Analysis',
      description:
          'A test to examine chromosomes in cells to detect genetic disorders.',
      category: '10',
      formFields: [
        FormFieldConfiguration(label: 'Karyotype', type: FormFieldType.text),
        FormFieldConfiguration(
            label: 'Chromosomal Abnormalities', type: FormFieldType.text)
      ],
    ),
    LabTest(
        id: '11',
        name: 'Urinalysis',
        description:
            'A test to analyze the content, concentration, and appearance of urine to detect urinary tract infections, kidney disease, and other health conditions.',
        category: '3',
        formFields: [
          FormFieldConfiguration(
              label: 'Color',
              type: FormFieldType.dropdown,
              options: ['Clear', 'Yellow', 'Amber', 'Red']),
          FormFieldConfiguration(
              label: 'Clarity',
              type: FormFieldType.dropdown,
              options: ['Clear', 'Slightly Cloudy', 'Cloudy', 'Turbid']),
          FormFieldConfiguration(label: 'pH Level', type: FormFieldType.number),
          FormFieldConfiguration(
              label: 'Specific Gravity', type: FormFieldType.number),
          FormFieldConfiguration(
              label: 'Glucose',
              type: FormFieldType.dropdown,
              options: ['Negative', 'Trace', '1+', '2+', '3+', '4+']),
          FormFieldConfiguration(
              label: 'Protein',
              type: FormFieldType.dropdown,
              options: ['Negative', 'Trace', '1+', '2+', '3+', '4+']),
          FormFieldConfiguration(
              label: 'Ketones',
              type: FormFieldType.dropdown,
              options: ['Negative', 'Trace', '1+', '2+', '3+', '4+']),
          FormFieldConfiguration(
              label: 'Leukocyte Esterase',
              type: FormFieldType.dropdown,
              options: ['Negative', 'Trace', '1+', '2+', '3+', '4+']),
          FormFieldConfiguration(
              label: 'Nitrites',
              type: FormFieldType.dropdown,
              options: ['Negative', 'Positive']),
          FormFieldConfiguration(
              label: 'Red Blood Cells (RBC)', type: FormFieldType.number),
          FormFieldConfiguration(
              label: 'White Blood Cells (WBC)', type: FormFieldType.number),
          FormFieldConfiguration(
              label: 'Bacteria',
              type: FormFieldType.dropdown,
              options: ['None', 'Few', 'Moderate', 'Many'])
        ])
  ];

  static final _categories = <LabTestCategory>[
    const LabTestCategory(id: '1', name: 'Hematology'),
    const LabTestCategory(id: '2', name: 'Microbiology'),
    const LabTestCategory(id: '3', name: 'Clinical Chemistry'),
    const LabTestCategory(id: '4', name: 'Immunology'),
    const LabTestCategory(id: '5', name: 'Molecular Biology'),
    const LabTestCategory(id: '6', name: 'Pathology'),
    const LabTestCategory(id: '7', name: 'Serology'),
    const LabTestCategory(id: '8', name: 'Toxicology'),
    const LabTestCategory(id: '9', name: 'Endocrinology'),
    const LabTestCategory(id: '10', name: 'Genetics')
  ];

  String _generateID(int i) => '${i + 1}';

  List<LabTest> getAll() {
    return _tests;
  }

  LabTest addTest({
    required String name,
    required String categoryId,
    required List<FormFieldConfiguration> formFields,
    required String description,
  }) {
    final test = LabTest(
      id: _generateID(_tests.length),
      name: name,
      category: categoryId,
      formFields: formFields,
      description: description,
    );

    _tests.add(test);
    return test;
  }

  List<FormFieldConfiguration> getFormConfigurationForTest(String testId) {
    final test = _tests.firstWhere((test) => test.id == testId);
    return test.formFields;
  }

  LabTest getTest(String testId) {
    return _tests.firstWhere((test) => test.id == testId);
  }

  List<LabTestCategory> getCategories() => _categories;

  void addCategory(String categoryName) {
    if (categoryName.isNotEmpty) {
      final newCategory = LabTestCategory(
        id: _generateID(_categories.length),
        name: categoryName.trim(),
      );

      if (!_categories.contains(newCategory)) {
        _categories.add(newCategory);
      }
    }
  }

  LabTestCategory getCategoryById(String category) {
    return _categories.firstWhere((c) => c.id == category);
  }
}
