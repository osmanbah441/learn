import 'package:flutter/material.dart';
import '../models/models.dart';

class AddFormDialog extends StatefulWidget {
  const AddFormDialog({
    super.key,
    required this.onSave,
    this.formFieldTitle = 'Add Parameter',
    this.formFieldTextFieldLabel = 'paramter',
    this.formTitle = 'Add New Test',
    this.formTextFieldLabel = 'test name',
  });

  final Function(FormConfiguration) onSave;
  final String formFieldTitle;
  final String formFieldTextFieldLabel;
  final String formTitle;
  final String formTextFieldLabel;
  @override
  State<AddFormDialog> createState() => _AddFormDialogState();
}

class _AddFormDialogState extends State<AddFormDialog> {
  final TextEditingController testNameController = TextEditingController();
  final List<FormFieldConfiguration> fields = [];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        textAlign: TextAlign.center,
        widget.formTitle,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: testNameController,
            decoration: InputDecoration(labelText: widget.formTextFieldLabel),
          ),
          const SizedBox(height: 16),

          // Fields Display
          ...fields.map((field) {
            final shouldSubstringText = field.label.length > 15;
            final label = shouldSubstringText
                ? '${field.label.substring(0, 15)}...'
                : field.label;

            return ListTile(
              contentPadding: const EdgeInsets.all(0),
              trailing: const Icon(Icons.delete),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(label),
                  Text(field.type.name),
                ],
              ),
            );
          }),
        ],
      ),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actions: [
        IconButton(
          onPressed: () => _showAddFieldDialog(context),
          icon: const Icon(Icons.add),
        ),
        OverflowBar(
          children: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (testNameController.text.isNotEmpty) {
                  widget.onSave(FormConfiguration(
                    name: testNameController.text,
                    fields: fields,
                  ));
                  Navigator.pop(context);
                }
              },
              child: const Text('Save'),
            ),
          ],
        )
      ],
    );
  }

  void _showAddFieldDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return _AddFieldDialog(
          formFieldTextFieldLabel: widget.formFieldTextFieldLabel,
          formFieldTitle: widget.formFieldTitle,
          onAddField: (field) {
            setState(() {
              fields.add(field);
            });
          },
        );
      },
    );
  }
}

class _AddFieldDialog extends StatefulWidget {
  const _AddFieldDialog({
    required this.onAddField,
    required this.formFieldTitle,
    required this.formFieldTextFieldLabel,
  });

  final Function(FormFieldConfiguration) onAddField;
  final String formFieldTitle;
  final String formFieldTextFieldLabel;

  @override
  __AddFieldDialogState createState() => __AddFieldDialogState();
}

class __AddFieldDialogState extends State<_AddFieldDialog> {
  final TextEditingController labelController = TextEditingController();
  FormFieldType selectedType = FormFieldType.text;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.formFieldTitle),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: TextField(
              controller: labelController,
              decoration:
                  InputDecoration(labelText: widget.formFieldTextFieldLabel),
            ),
          ),
          DropdownButton<FormFieldType>(
            value: selectedType,
            onChanged: (FormFieldType? newValue) {
              setState(() {
                selectedType = newValue!;
              });
            },
            items: FormFieldType.values.map((type) {
              return DropdownMenuItem<FormFieldType>(
                value: type,
                child: Text(type.name),
              );
            }).toList(),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            if (labelController.text.isNotEmpty) {
              widget.onAddField(FormFieldConfiguration(
                label: labelController.text,
                type: selectedType,
              ));
              Navigator.pop(context);
            }
          },
          child: const Text('Add'),
        ),
      ],
    );
  }
}
