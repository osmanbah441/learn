import 'package:pulse_care/models/models.dart';

class MockApi {
  // In-memory storage for simplicity
  List<User> users = [
    User(
      id: '1',
      fullName: 'Dr. John Smith',
      role: UserRole.doctor,
      email: 'john.smith@hospital.com',
    ),
    User(
      id: '2',
      fullName: 'Dr. Emily Davis',
      role: UserRole.doctor,
      email: 'emily.davis@hospital.com',
    ),
    User(
      id: '3',
      fullName: 'Lab Tech 1',
      role: UserRole.labTechnician,
      email: 'labtech1@hospital.com',
    ),
    User(
      id: '4',
      fullName: 'Lab Tech 2',
      role: UserRole.labTechnician,
      email: 'labtech2@hospital.com',
    ),
    User(
      id: '5',
      fullName: 'Dr. Alice Johnson',
      role: UserRole.doctor,
      email: 'alice.johnson@hospital.com',
    ),
    User(
      id: '6',
      fullName: 'Lab Head',
      role: UserRole.labHead,
      email: 'labhead@hospital.com',
    ),
    User(
      id: '7',
      fullName: 'Dr. Robert Brown',
      role: UserRole.doctor,
      email: 'robert.brown@hospital.com',
    ),
    User(
      id: '8',
      fullName: 'Lab Tech 3',
      role: UserRole.labTechnician,
      email: 'labtech3@hospital.com',
    ),
    User(
      id: '9',
      fullName: 'Dr. Sarah Wilson',
      role: UserRole.doctor,
      email: 'sarah.wilson@hospital.com',
    ),
    User(
      id: '10',
      fullName: 'Lab Tech 4',
      role: UserRole.labTechnician,
      email: 'labtech4@hospital.com',
    ),
  ];

  List<TestCategory> testCategories = const [
    TestCategory(id: 'unknown', name: 'unknown'),
    TestCategory(id: '1', name: 'Hematology'),
    TestCategory(id: '2', name: 'Biochemistry'),
    TestCategory(id: '3', name: 'Cardiology'),
    TestCategory(id: '4', name: 'Hepatology'),
    TestCategory(id: '5', name: 'Endocrinology'),
    TestCategory(id: '6', name: 'Urology'),
    TestCategory(id: '7', name: 'Microbiology'),
    TestCategory(id: '8', name: 'Obstetrics'),
    TestCategory(id: '9', name: 'Genetics'),
    TestCategory(id: '10', name: 'Immunology'),
  ];

  List<LabTest> labTests = [
    LabTest(
        id: '1',
        testName: 'Complete Blood Count (CBC)',
        categoryId: '1',
        formConfiguration:
            FormConfiguration(name: 'Complete Blood Count (CBC)', fields: [
          FormFieldConfiguration(
              label: 'Patient Age', type: FormFieldType.number),
          FormFieldConfiguration(
              label: 'Hemoglobin Level', type: FormFieldType.number)
        ])),
    LabTest(
        id: '2',
        testName: 'Basic Metabolic Panel (BMP)',
        categoryId: '2',
        formConfiguration:
            FormConfiguration(name: 'Basic Metabolic Panel (BMP)', fields: [
          FormFieldConfiguration(
              label: 'Patient Age', type: FormFieldType.number),
          FormFieldConfiguration(
              label: 'Glucose Level', type: FormFieldType.number)
        ])),
    LabTest(
        id: '3',
        testName: 'Lipid Panel',
        categoryId: '3',
        formConfiguration: FormConfiguration(name: 'Lipid Panel', fields: [
          FormFieldConfiguration(
              label: 'Total Cholesterol', type: FormFieldType.number),
          FormFieldConfiguration(label: 'HDL Level', type: FormFieldType.number)
        ])),
    LabTest(
        id: '4',
        testName: 'Liver Function Tests',
        categoryId: '4',
        formConfiguration:
            FormConfiguration(name: 'Liver Function Tests', fields: [
          FormFieldConfiguration(
              label: 'ALT Level', type: FormFieldType.number),
          FormFieldConfiguration(label: 'AST Level', type: FormFieldType.number)
        ])),
    LabTest(
        id: '5',
        testName: 'Thyroid Function Tests',
        categoryId: '5',
        formConfiguration:
            FormConfiguration(name: 'Thyroid Function Tests', fields: [
          FormFieldConfiguration(
              label: 'TSH Level', type: FormFieldType.number),
          FormFieldConfiguration(
              label: 'Free T4 Level', type: FormFieldType.number)
        ])),
    LabTest(
        id: '6',
        testName: 'Urinalysis',
        categoryId: '6',
        formConfiguration: FormConfiguration(name: 'Urinalysis ', fields: [
          FormFieldConfiguration(label: 'Color', type: FormFieldType.text),
          FormFieldConfiguration(label: 'pH Level', type: FormFieldType.number)
        ])),
    LabTest(
        id: '7',
        testName: 'COVID-19 PCR Test',
        categoryId: '7',
        formConfiguration:
            FormConfiguration(name: 'COVID-19 PCR Test', fields: [
          FormFieldConfiguration(label: 'Symptoms', type: FormFieldType.text),
          FormFieldConfiguration(
              label: 'Date of Sample Collection', type: FormFieldType.date)
        ])),
    LabTest(
        id: '8',
        testName: 'Pregnancy Test',
        categoryId: '8',
        formConfiguration: FormConfiguration(name: 'Pregnancy Test', fields: [
          FormFieldConfiguration(
              label: 'Last Menstrual Period', type: FormFieldType.date),
          FormFieldConfiguration(
              label: 'Pregnancy Symptoms', type: FormFieldType.text)
        ])),
    LabTest(
        id: '9',
        testName: 'Genetic Testing',
        categoryId: '9',
        formConfiguration: FormConfiguration(name: 'Genetic Test', fields: [
          FormFieldConfiguration(
              label: 'Family History', type: FormFieldType.text),
          FormFieldConfiguration(
              label: 'Specific Genes Tested', type: FormFieldType.text)
        ])),
    LabTest(
        id: '10',
        testName: 'Allergy Testing',
        categoryId: '10',
        formConfiguration: FormConfiguration(name: 'Allergy Test', fields: [
          FormFieldConfiguration(label: 'Allergens', type: FormFieldType.text),
          FormFieldConfiguration(label: 'Symptoms', type: FormFieldType.text),
        ])),
  ];

  List<LabTestRequest> labTestRequests = [
    LabTestRequest(
        id: '1',
        doctorId: '1',
        doctorFullname: 'Dr. John Smith',
        patientFullname: 'Alice Johnson',
        requestedTests: ['1', '2'],
        status: LabRequestStatus.pending,
        patientGender: 'Female',
        requestedAt: DateTime.now(),
        patientAge: 30),
    LabTestRequest(
        id: '2',
        doctorId: '2',
        doctorFullname: 'Dr. Emily Davis',
        patientFullname: 'Michael Brown',
        requestedTests: ['3'],
        patientGender: 'Male',
        status: LabRequestStatus.processing,
        requestedAt: DateTime.now().subtract(const Duration(days: 1)),
        patientAge: 25),
    LabTestRequest(
        id: '3',
        doctorId: '5',
        doctorFullname: 'Dr. Alice Johnson',
        patientFullname: 'Olivia White',
        requestedTests: ['4', '5'],
        patientGender: 'Female',
        status: LabRequestStatus.pending,
        requestedAt: DateTime.now(),
        patientAge: 45),
    LabTestRequest(
        id: '4',
        doctorId: '7',
        doctorFullname: 'Dr. Robert Brown',
        patientFullname: 'James Smith',
        requestedTests: ['6'],
        patientGender: 'Male',
        status: LabRequestStatus.completed,
        requestedAt: DateTime.now().subtract(const Duration(days: 2)),
        patientAge: 60,
        completedAt: DateTime.now().subtract(const Duration(days: 1))),
    LabTestRequest(
        id: '5',
        doctorId: '9',
        doctorFullname: 'Dr. Sarah Wilson',
        patientFullname: 'Sophia Martin',
        patientGender: 'Female',
        requestedTests: ['7'],
        status: LabRequestStatus.pending,
        requestedAt: DateTime.now(),
        patientAge: 28),
    LabTestRequest(
        id: '6',
        doctorId: '3',
        doctorFullname: 'Dr. John Smith',
        patientFullname: 'Liam Johnson',
        patientGender: 'Male',
        requestedTests: ['8'],
        status: LabRequestStatus.processing,
        requestedAt: DateTime.now().subtract(const Duration(hours: 1)),
        patientAge: 22),
    LabTestRequest(
        id: '7',
        doctorId: '4',
        doctorFullname: 'Dr. Emily Davis',
        patientFullname: 'Isabella Garcia',
        patientGender: 'Female',
        requestedTests: ['9'],
        status: LabRequestStatus.pending,
        requestedAt: DateTime.now(),
        patientAge: 36),
    LabTestRequest(
        id: '8',
        doctorId: '6',
        doctorFullname: 'Lab Head',
        patientFullname: 'Benjamin Martinez',
        requestedTests: ['10'],
        patientGender: 'Male',
        status: LabRequestStatus.completed,
        requestedAt: DateTime.now().subtract(const Duration(days: 3)),
        patientAge: 50,
        completedAt: DateTime.now().subtract(const Duration(days: 2))),
    LabTestRequest(
        id: '9',
        doctorId: '8',
        doctorFullname: 'Lab Tech 3',
        patientFullname: 'Mia Lee',
        requestedTests: ['1', '5'],
        patientGender: 'Female',
        status: LabRequestStatus.pending,
        requestedAt: DateTime.now(),
        patientAge: 19),
    LabTestRequest(
        id: '10',
        doctorId: '10',
        doctorFullname: 'Lab Tech 4',
        patientFullname: 'Elijah Harris',
        patientGender: 'Male',
        requestedTests: ['2', '6'],
        status: LabRequestStatus.processing,
        requestedAt: DateTime.now(),
        patientAge: 33),
  ];

  // pass in the lenght of list as int
  String _generateID(int i) => '${i + 1}';

// Add a user
  User addUser(String id, String fullName, String email, UserRole role) {
    final user = User(id: id, fullName: fullName, email: email, role: role);
    users.add(user);
    return user;
  }

// Add a test
  LabTest addTest(FormConfiguration formConfiguration) {
    final test = LabTest(
        id: _generateID(labTests.length),
        categoryId: 'unknown',
        testName: formConfiguration.name,
        formConfiguration: formConfiguration);
    labTests.add(test);
    return test;
  }

// Create a lab test request
  LabTestRequest createLabTestRequest({
    required String patientId,
    required String doctorId,
    required String patientGender,
    required String doctorFullname,
    required String patientFullName,
    required int patientAge,
    required List<String> requestedTests,
    required DateTime requestedAt,
  }) {
    final request = LabTestRequest(
      id: _generateID(labTestRequests.length),
      doctorId: doctorId,
      patientFullname: patientFullName,
      patientAge: patientAge,
      doctorFullname: doctorFullname,
      requestedTests: requestedTests,
      status: LabRequestStatus.pending,
      patientId: patientId,
      requestedAt: requestedAt,
      patientGender: patientGender,
    );
    labTestRequests.add(request);

    return request;
  }

// Get all lab test requests for a specific doctor
  List<LabTestRequest> getLabTestRequestsByDoctor(String doctorId) {
    return labTestRequests
        .where((request) => request.doctorId == doctorId)
        .toList();
  }

// Get form configuration for a specific test
  FormConfiguration? getFormConfigurationForTest(String testId) {
    final test = labTests.firstWhere((test) => test.id == testId);
    return test.formConfiguration;
  }

// Fetch user details
  User? getUserById(String userId) {
    return users.firstWhere((user) => user.id == userId);
  }

  // Fetch a specific lab test request by ID
  LabTestRequest? getLabTestRequestById(String requestId) {
    return labTestRequests.firstWhere(
      (request) => request.id == requestId,
    );
  }
}
