import 'package:flutter/material.dart';
import 'package:pulse_care/components/lab_request_status_chip.dart';
import 'package:pulse_care/models/lab_test_request.dart';

import '../../api/mock_api.dart';
import '../../forms/form_configuration_builder.dart';

class LabTestRequestDetailsScreen extends StatelessWidget {
  final String labTestRequestId;
  final MockApi api;

  const LabTestRequestDetailsScreen(
      {super.key, required this.labTestRequestId, required this.api});

  @override
  Widget build(BuildContext context) {
    final request = api.getLabTestRequestById(labTestRequestId)!;

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("${request.patientFullname}'s Test"),
        actions: [
          LabRequestStatusChip(status: request.status),
          const SizedBox(width: 32)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _DisplayRequestInfo(request: request),
              ...request.requestedTests.map((testId) {
                final test =
                    api.tests.getAll().firstWhere((t) => t.id == testId);
                return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: FormConfigurationsBuilder(
                      selectedTests: [test],
                    ));
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class _RowText extends StatelessWidget {
  const _RowText({required this.leadingText, required this.trailingText});

  final String leadingText;
  final String trailingText;

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            leadingText,
          ),
          Text(
            trailingText,
          ),
        ],
      );
}

class _DisplayRequestInfo extends StatelessWidget {
  const _DisplayRequestInfo({required this.request});

  final LabTestRequest request;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _RowText(
              leadingText: 'Requested submitted on:',
              trailingText: request.getFormattedRequestedAtDateTime(),
            ),
            _RowText(
              leadingText: 'Completed on:',
              trailingText: request.getFormattedCompletedAtDateTime() ??
                  'not completed yet',
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    initialValue: request.patientAge.toString(),
                    enabled: false,
                    decoration: const InputDecoration(
                      labelText: 'age',
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextFormField(
                    initialValue: request.patientGender,
                    enabled: false,
                    decoration: const InputDecoration(
                      labelText: 'gender',
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
