import 'package:flutter/material.dart';
import 'package:pulse_care/api/mock_api.dart';
import 'package:pulse_care/components/components.dart';

import '../../forms/forms.dart';
import '../../models/models.dart';

class LabTestListScreen extends StatefulWidget {
  const LabTestListScreen(
      {super.key, required this.api, required this.onLapRequest});

  final MockApi api;
  final VoidCallback onLapRequest;

  @override
  State<LabTestListScreen> createState() => _LabTestListScreenState();
}

class _LabTestListScreenState extends State<LabTestListScreen> {
  List<String> selectedCategoryIds = [];

  @override
  Widget build(BuildContext context) {
    final tests = selectedCategoryIds.isEmpty
        ? widget.api.labTests
        : widget.api.labTests
            .where((test) => selectedCategoryIds.contains(test.categoryId))
            .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Test Management"),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedWelcomeMessage(
              filterButton: () => _showFilterDialog(context),
            ),
            Wrap(
              runAlignment: WrapAlignment.center,
              spacing: 16,
              runSpacing: 16,
              children: tests.map((test) {
                return ActionChip(
                  label: Text(test.testName),
                  onPressed: () => _showTestDetailDialog(test),
                );
              }).toList(),
            ),
          ],
        ),
      ),
      persistentFooterButtons: [
        ElevatedButton(
          onPressed: () => widget.onLapRequest(),
          child: const Text("lab request"),
        )
      ],
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddTestDialog(context),
        tooltip: 'Create New Test',
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddTestDialog(BuildContext context) => showDialog(
        context: context,
        builder: (context) => AddFormDialog(
          onSave: (form) => setState(() {
            widget.api.addTest(form);
          }),
        ),
      );

  void _showTestDetailDialog(LabTest test) {
    showDialog(
      context: context,
      builder: (context) {
        return TestDetailDialog(test: test);
      },
    );
  }

  void _showFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Filter by Category'),
          content: CategoryFilterDialog(
            categories: widget.api.testCategories,
            selectedCategoryIds: selectedCategoryIds,
            onCategorySelected: (ids) {
              setState(() {
                selectedCategoryIds = ids;
              });
            },
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Apply'),
            ),
          ],
        );
      },
    );
  }
}

// CategoryFilterDialog Widget
class CategoryFilterDialog extends StatefulWidget {
  final List<TestCategory> categories;
  final List<String> selectedCategoryIds;
  final ValueChanged<List<String>> onCategorySelected;

  const CategoryFilterDialog({
    super.key,
    required this.categories,
    required this.selectedCategoryIds,
    required this.onCategorySelected,
  });

  @override
  State<CategoryFilterDialog> createState() => _CategoryFilterDialogState();
}

class _CategoryFilterDialogState extends State<CategoryFilterDialog> {
  late List<String> selectedIds;

  @override
  void initState() {
    super.initState();
    selectedIds = List.from(widget.selectedCategoryIds);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: widget.categories.map((category) {
          return CheckboxListTile(
            title: Text(category.name),
            value: selectedIds.contains(category.id),
            selected: selectedIds.contains(category.id),
            onChanged: (isSelected) {
              setState(() {
                if (isSelected != null && isSelected) {
                  selectedIds.add(category.id);
                } else {
                  selectedIds.remove(category.id);
                }
                widget.onCategorySelected(selectedIds);
              });
            },
          );
        }).toList(),
      ),
    );
  }
}

class TestDetailDialog extends StatelessWidget {
  const TestDetailDialog({
    super.key,
    required this.test,
  });

  final LabTest test;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return AlertDialog(
      title: Text(test.testName),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Close'),
        )
      ],
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Test Parameters:',
            style: textTheme.labelLarge,
          ),
          const SizedBox(height: 8),
          ...test.formConfiguration.fields.map((field) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${field.label}:',
                    style: textTheme.bodySmall,
                  ),
                  Text(
                    field.type.name,
                    style: textTheme.bodySmall,
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
