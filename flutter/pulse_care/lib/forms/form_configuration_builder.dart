import 'package:flutter/material.dart';
import '../models/models.dart';

class FormConfigurationsBuilder extends StatefulWidget {
  final List<FormConfiguration> selectedTests;

  const FormConfigurationsBuilder({super.key, required this.selectedTests});

  @override
  State<FormConfigurationsBuilder> createState() =>
      _FormConfigurationsBuilderState();
}

class _FormConfigurationsBuilderState extends State<FormConfigurationsBuilder> {
  final Map<String, dynamic> formData = {};

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: widget.selectedTests.map((testConfig) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    testConfig.name,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  ...testConfig.fields.map<Widget>((field) {
                    return Column(
                      children: [_buildField(field), const SizedBox(height: 8)],
                    );
                  }),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildField(FormFieldConfiguration fieldConfig) {
    return fieldConfig.type.buildField(
      label: fieldConfig.label,
      value: formData[fieldConfig.label],
      onChanged: (val) {
        setState(() {
          formData[fieldConfig.label] = val;
        });
      },
    );
  }
}

extension on FormFieldType {
  // Method to build the form field widget based on the enum type
  Widget buildField({
    required String label,
    required dynamic value,
    required ValueChanged<dynamic> onChanged,
  }) {
    return switch (this) {
      FormFieldType.text => TextFormField(
          decoration: InputDecoration(labelText: label),
          initialValue: value,
          onChanged: (val) => onChanged(val),
        ),
      FormFieldType.number => TextFormField(
          decoration: InputDecoration(labelText: label),
          keyboardType: TextInputType.number,
          initialValue: value?.toString(),
          onChanged: (val) => onChanged(int.tryParse(val)),
        ),
      FormFieldType.checkbox => CheckboxListTile(
          title: Text(label),
          value: value ?? false,
          onChanged: (val) => onChanged(val),
        ),
      FormFieldType.date => const Text('Todo build date field'),
    };
  }
}
