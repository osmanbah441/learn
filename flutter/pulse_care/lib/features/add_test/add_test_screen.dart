import 'package:flutter/material.dart';
import 'package:pulse_care/api/mock_api.dart';
import '../../models/models.dart';
import 'add_field_dialog.dart';

class AddTestScreen extends StatefulWidget {
  const AddTestScreen({
    super.key,
    required this.api,
    this.formTitle = 'Add New Test',
    this.formTextFieldLabel = 'Test Name',
  });

  final MockApi api;
  final String formTitle;
  final String formTextFieldLabel;

  @override
  State<AddTestScreen> createState() => _AddTestScreenState();
}

class _AddTestScreenState extends State<AddTestScreen> {
  final TextEditingController testNameController = TextEditingController();
  final TextEditingController testDescriptionController =
      TextEditingController();
  LabTestCategory? selectedCategory;
  List<LabTestCategory> categories = [];

  final List<FormFieldConfiguration> fields = [];

  @override
  void initState() {
    super.initState();
    // Load categories and samples from API or initialize if needed
    _loadInitialData();
  }

  void _loadInitialData() {
    categories =
        widget.api.tests.getCategories(); // Mock call to fetch categories
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      persistentFooterAlignment: AlignmentDirectional.bottomEnd,
      persistentFooterButtons: [
        TextButton.icon(
          onPressed: () => _showAddFieldDialog(context),
          icon: const Icon(Icons.add),
          label: const Text('Add Field'),
        ),
        ElevatedButton(
          onPressed: _saveTest,
          child: const Text('Save'),
        ),
      ],
      appBar: AppBar(
        centerTitle: false,
        title: Text(widget.formTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: testNameController,
              decoration: InputDecoration(labelText: widget.formTextFieldLabel),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<LabTestCategory>(
                    value: selectedCategory,
                    items: categories
                        .map((category) => DropdownMenuItem(
                              value: category,
                              child: Text(category.name),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedCategory = value;
                      });
                    },
                    decoration: const InputDecoration(labelText: 'Category'),
                  ),
                ),
                const SizedBox(width: 16),
                TextButton.icon(
                  onPressed: () => _showAddCategoryDialog(context),
                  icon: Icon(Icons.add),
                  label: const Text('new category'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            TextField(
              controller: testDescriptionController,
              minLines: 3,
              maxLines: null,
              decoration: const InputDecoration(labelText: 'Test Description'),
            ),
            const SizedBox(height: 8),
            ...fields.map((field) {
              return ListTile(
                contentPadding: const EdgeInsets.all(0),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    setState(() {
                      fields.remove(field);
                    });
                  },
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(field.label),
                    Text(field.type.name),
                  ],
                ),
              );
            })
          ],
        ),
      ),
    );
  }

  void _showAddFieldDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AddFieldDialog(
          onAddField: (field) {
            setState(() {
              fields.add(field);
            });
          },
        );
      },
    );
  }

  void _showAddCategoryDialog(BuildContext context) {
    final TextEditingController categoryController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add New Category'),
          content: TextField(
            controller: categoryController,
            decoration: const InputDecoration(labelText: 'Category Name'),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  widget.api.tests.addCategory(categoryController.text);
                });
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _saveTest() {
    if (testNameController.text.isNotEmpty && selectedCategory != null) {
      widget.api.tests.addTest(
        name: testNameController.text,
        description: testDescriptionController.text,
        categoryId: selectedCategory!.id,
        formFields: fields,
      );
      Navigator.pop(context);
    } else {
      // Display an error message or validation alert here
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all required fields.')),
      );
    }
  }
}
