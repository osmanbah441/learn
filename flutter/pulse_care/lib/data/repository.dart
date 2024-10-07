import 'package:pulse_care/models/patient_appointment.dart';

class AppointmentRepository {
  static List<Appointment> fetchAppointments() {
    return [
      Appointment(
          id: 1,
          patient: 'John Doe',
          date: DateTime(2024, 10, 1),
          status: 'Confirmed',
          doctor: 'Dr. Smith'),
      Appointment(
          id: 2,
          patient: 'Jane Roe',
          date: DateTime(2024, 10, 2),
          status: 'Pending',
          doctor: 'Dr. Johnson'),
      Appointment(
          id: 3,
          patient: 'Emily Davis',
          date: DateTime(2024, 10, 3),
          status: 'Completed',
          doctor: 'Dr. Brown'),
      Appointment(
          id: 4,
          patient: 'Michael Wilson',
          date: DateTime(2024, 10, 4),
          status: 'Cancelled',
          doctor: 'Dr. White'),
      Appointment(
          id: 5,
          patient: 'Emma Thompson',
          date: DateTime(2024, 10, 5),
          status: 'Confirmed',
          doctor: 'Dr. Green'),
      Appointment(
          id: 6,
          patient: 'William Clark',
          date: DateTime(2024, 10, 6),
          status: 'Pending',
          doctor: 'Dr. Black'),
      Appointment(
          id: 7,
          patient: 'Olivia Lewis',
          date: DateTime(2024, 10, 7),
          status: 'Completed',
          doctor: 'Dr. Adams'),
      Appointment(
          id: 8,
          patient: 'James Walker',
          date: DateTime(2024, 10, 8),
          status: 'Confirmed',
          doctor: 'Dr. White'),
      Appointment(
          id: 9,
          patient: 'Ava Hall',
          date: DateTime(2024, 10, 9),
          status: 'Cancelled',
          doctor: 'Dr. Smith'),
      Appointment(
          id: 10,
          patient: 'Liam Allen',
          date: DateTime(2024, 10, 10),
          status: 'Confirmed',
          doctor: 'Dr. Johnson'),
    ];
  }
}
