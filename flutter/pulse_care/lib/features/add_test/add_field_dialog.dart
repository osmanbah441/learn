import 'package:flutter/material.dart';

import '../../models/form_configuration.dart';

class AddFieldDialog extends StatefulWidget {
  const AddFieldDialog({
    super.key,
    required this.onAddField,
  });

  final Function(FormFieldConfiguration) onAddField;

  @override
  State<AddFieldDialog> createState() => _AddFieldDialogState();
}

class _AddFieldDialogState extends State<AddFieldDialog> {
  final TextEditingController labelController = TextEditingController();
  FormFieldType selectedType = FormFieldType.text;
  final TextEditingController optionsController = TextEditingController();
  List<String> options = [];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Parameter'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: labelController,
            decoration: const InputDecoration(labelText: 'Parameter Name'),
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<FormFieldType>(
            value: selectedType,
            decoration: const InputDecoration(labelText: 'Field Type'),
            onChanged: (FormFieldType? newValue) {
              setState(() {
                selectedType = newValue!;
                if (newValue != FormFieldType.dropdown &&
                    newValue != FormFieldType.toggle) {
                  options.clear();
                }
              });
            },
            items: FormFieldType.values.map((type) {
              return DropdownMenuItem<FormFieldType>(
                value: type,
                child: Text(type.name),
              );
            }).toList(),
          ),
          if (selectedType == FormFieldType.dropdown ||
              selectedType == FormFieldType.toggle)
            Column(
              children: [
                TextField(
                  controller: optionsController,
                  decoration: const InputDecoration(labelText: 'Option'),
                ),
                const SizedBox(height: 8),
                Wrap(
                  children: options.map((option) {
                    return Chip(
                      label: Text(option),
                      onDeleted: () {
                        setState(() {
                          options.remove(option);
                        });
                      },
                    );
                  }).toList(),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (optionsController.text.isNotEmpty) {
                      setState(() {
                        options.add(optionsController.text);
                        optionsController.clear();
                      });
                    }
                  },
                  child: const Text('Add Option'),
                ),
              ],
            ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            if (labelController.text.isNotEmpty) {
              widget.onAddField(FormFieldConfiguration(
                label: labelController.text,
                type: selectedType,
                options: options.isEmpty ? null : List<String>.from(options),
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
