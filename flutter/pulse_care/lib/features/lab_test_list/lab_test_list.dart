import 'package:flutter/material.dart';
import 'package:pulse_care/api/mock_api.dart';
import 'package:pulse_care/components/components.dart';

import '../../models/models.dart';

class LabTestListScreen extends StatefulWidget {
  const LabTestListScreen({
    super.key,
    required this.api,
    required this.onLapRequest,
    required this.onCreateNewTest,
  });

  final MockApi api;
  final VoidCallback onLapRequest;
  final VoidCallback onCreateNewTest;

  @override
  State<LabTestListScreen> createState() => _LabTestListScreenState();
}

class _LabTestListScreenState extends State<LabTestListScreen> {
  List<String> selectedCategoryIds = [];

  @override
  Widget build(BuildContext context) {
    final tests = selectedCategoryIds.isEmpty
        ? widget.api.tests.getAll()
        : widget.api.tests
            .getAll()
            .where((test) => selectedCategoryIds.contains(test.category))
            .toList();

    final screenWidth = MediaQuery.of(context).size.width;
    final isMedium = screenWidth >= 768 && screenWidth < 1200;
    final isLargeScreen = screenWidth >= 1200;
    final gridCrossAxisCount = isLargeScreen
        ? 4
        : isMedium
            ? 3
            : 2;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Lab Test"),
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
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: gridCrossAxisCount,
                ),
                itemCount: tests.length,
                itemBuilder: (context, index) {
                  final test = tests[index];
                  return _buildTestCard(test);
                },
              ),
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
        onPressed: widget.onCreateNewTest,
        tooltip: 'Create New Test',
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildTestCard(LabTest test) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              test.name,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              test.description,
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
            ),
            ListTile(
              leading: Icon(
                Icons.category,
                color: Colors.lightGreenAccent,
              ),
              title: Text(widget.api.tests.getCategoryById(test.category).name),
            )
          ],
        ),
      ),
    );
  }

  void _showFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Filter by Category'),
          content: CategoryFilterDialog(
            categories: widget.api.tests.getCategories(),
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
  final List<LabTestCategory> categories;
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
