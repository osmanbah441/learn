import 'package:pulse_care/models/models.dart';
part 'db/user_collection.dart';
part 'db/lab_test_collection.dart';

class MockApi {
  final users = _UserCollection();
  final tests = _LabTestCollection();

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

  // Fetch a specific lab test request by ID
  LabTestRequest? getLabTestRequestById(String requestId) {
    return labTestRequests.firstWhere(
      (request) => request.id == requestId,
    );
  }
}
