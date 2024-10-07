import 'package:flutter/material.dart';
import 'package:pulse_care/components/components.dart';
import 'package:pulse_care/screens/appointment_dashboard_screen/appointment_card.dart';
import 'package:pulse_care/theme/colors.dart';

class AppointmentDashboardScreen extends StatelessWidget {
  const AppointmentDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CarePulse'),
        actions: const [
          PersonTile(
            name: 'Admin',
            imageUrl: 'https://picsum.photos/200/300',
          ),
          const SizedBox(width: 8)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppointmentCard(
              total: 30,
              icon: Icon(
                Icons.hourglass_empty,
                color: AppColors.lightBlue,
              ),
              description: 'this is the description text',
              cardHight: 100,
            )
          ],
        ),
      ),
    );
  }
}
