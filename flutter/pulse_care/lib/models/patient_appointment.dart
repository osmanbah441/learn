enum AppointmentStatus { scheduled, pending, cancel }

class Appointment {
  final int id;
  final String patient;
  final DateTime date;
  final String status;
  final String doctor;

  Appointment({
    required this.id,
    required this.patient,
    required this.date,
    required this.status,
    required this.doctor,
  });
}
