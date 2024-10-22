part of '../mock_api.dart';

final class _UserCollection {
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

  // pass in the lenght of list as int
  String _generateID(int i) => '${i + 1}';

  User add(String fullName, String email, UserRole role) {
    final user = User(
      id: _generateID(users.length),
      fullName: fullName,
      email: email,
      role: role,
    );

    users.add(user);
    return user;
  }

  User? getUserById(String userId) {
    return users.firstWhere((user) => user.id == userId);
  }
}
