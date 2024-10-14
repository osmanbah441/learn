import 'package:flutter/material.dart';
import 'package:pulse_care/api/mock_api.dart';
import 'package:pulse_care/components/components.dart';

import '../../models/models.dart';

class LabRequestListScreen extends StatelessWidget {
  const LabRequestListScreen({
    super.key,
    required this.api,
    required this.onAddLabRequest,
    required this.onViewLabRequest,
  });

  final MockApi api;
  final VoidCallback onAddLabRequest;
  final Function(String id) onViewLabRequest;

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width <= 700;

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('CarePulse'),
        actions: const [
          PersonTile(
            name: 'Doctor',
            imageUrl: 'https://picsum.photos/50',
          ),
          SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AnimatedWelcomeMessage(),
              SizedBox(
                width: double.infinity,
                child: PaginatedDataTable(
                  header: const Text('Requested Test'),
                  actions: [
                    ElevatedButton.icon(
                      icon: const Icon(Icons.add),
                      onPressed: onAddLabRequest,
                      label: const Text('New'),
                    ),
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.filter_list))
                  ],
                  dataRowMaxHeight: 56,
                  source: _DataSource(
                      tests: api.labTestRequests,
                      isMobile: isMobile,
                      onViewLabRequest),
                  columns: [
                    const DataColumn(label: Text('Patient')),
                    const DataColumn(label: Text('Status')),
                    const DataColumn(label: Text('view')),
                    if (!isMobile) const DataColumn(label: Text('Date')),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _DataSource extends DataTableSource {
  _DataSource(this.onViewLabRequest,
      {required this.tests, required this.isMobile});
  final List<LabTestRequest> tests;

  final bool isMobile;
  final Function(String) onViewLabRequest;

  @override
  DataRow? getRow(int index) {
    final test = tests[index];

    return DataRow(
      cells: [
        DataCell(PersonTile(name: test.patientFullname)),
        DataCell(LabRequestStatusChip(status: test.status, onlyIcon: isMobile)),
        DataCell(
          TextButton(
            onPressed: () => onViewLabRequest(test.id),
            child: const Icon(
              Icons.visibility_outlined,
            ),
          ),
        ),
        if (!isMobile) DataCell(Text(test.getFormattedRequestedAtDate())),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => tests.length;

  @override
  int get selectedRowCount => 0;
}
