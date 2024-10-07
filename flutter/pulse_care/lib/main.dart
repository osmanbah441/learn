import 'package:flutter/material.dart';
import 'package:pulse_care/screens/screens.dart';
import 'package:pulse_care/theme/app_theme.dart';

import 'components/components.dart';

void main() {
  runApp(const MainApp());
}

class User {
  final String firstName;
  final String lastName;
  final String? photoUrl;

  const User({
    required this.firstName,
    required this.lastName,
    this.photoUrl,
  });
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.theme,
      home: const AppointmentDashboardScreen(),
    );
  }
}
