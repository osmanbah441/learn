import 'package:intl/intl.dart';

enum LabRequestStatus {
  pending,
  processing,
  completed,
  cancelled,
}

class LabTestRequest {
  final String id;
  final String doctorId;
  final String patientFullname;
  final String doctorFullname;
  final int patientAge;
  final List<String> requestedTests; // References Test IDs
  final LabRequestStatus status;
  final DateTime requestedAt;
  final DateTime? completedAt;
  final String? patientId;
  final String patientGender;

  LabTestRequest({
    required this.id,
    required this.doctorId,
    required this.patientFullname,
    required this.doctorFullname,
    required this.patientAge,
    required this.requestedTests,
    this.status = LabRequestStatus.pending,
    required this.requestedAt,
    this.completedAt,
    required this.patientGender,
    this.patientId,
  });

  // Method to format the requestedAt date
  String getFormattedRequestedAtDate() {
    return _formatDate(requestedAt); // e.g., "Saturday, 13 October"
  }

  // Method to format the requestedAt time
  String getFormattedRequestedAtTime() {
    return _formatTime(requestedAt); // e.g., "3:45 PM"
  }

  // Method to format the completedAt date (if available)
  String? getFormattedCompletedAtDate() {
    return completedAt != null ? _formatDate(completedAt!) : null;
  }

  // Method to format the completedAt time (if available)
  String? getFormattedCompletedAtTime() {
    return completedAt != null ? _formatTime(completedAt!) : null;
  }

  // New Method: Formats both the requestedAt date and time
  String getFormattedRequestedAtDateTime() {
    return '${_formatDate(requestedAt)} at ${_formatTime(requestedAt)}';
  }

  // New Method: Formats both the completedAt date and time (if available)
  String? getFormattedCompletedAtDateTime() {
    return completedAt != null
        ? '${_formatDate(completedAt!)} at ${_formatTime(completedAt!)}'
        : null;
  }

  /// Private method to format a DateTime object into a readable date format.
  /// Returns the formatted date as "day, date month" (e.g., "Saturday, 13 October").
  String _formatDate(DateTime date) {
    return DateFormat('EEEE, d MMMM').format(date);
  }

  /// Private method to format a DateTime object into a readable time format.
  /// Returns the formatted time as "hour:min AM/PM" (e.g., "3:45 PM").
  String _formatTime(DateTime date) {
    return DateFormat('h:mm a').format(date);
  }
}
