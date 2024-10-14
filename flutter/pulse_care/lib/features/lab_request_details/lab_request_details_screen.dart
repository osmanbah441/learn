import 'package:flutter/material.dart';

import '../../models/lab_test_request.dart';

class ViewLabRequestScreen extends StatelessWidget {
  final LabTestRequest request;

  const ViewLabRequestScreen({super.key, required this.request});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lab Request Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Patient: ${request.patientFullname}'),
            const SizedBox(height: 8),
            Text('Requested Tests: ${request.requestedTests.join(', ')}'),
            const SizedBox(height: 8),
            Text('Status: ${request.status.name}'),
            const SizedBox(height: 8),
            if (request.completedAt != null)
              Text('Completed At: ${request.completedAt.toString()}'),
          ],
        ),
      ),
    );
  }
}
