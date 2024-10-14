enum UserRole { doctor, labTechnician, labHead }

class User {
  final String id;
  final String fullName;
  final String email;
  final UserRole role;

  User({
    required this.id,
    required this.fullName,
    required this.email,
    required this.role,
  });
}
