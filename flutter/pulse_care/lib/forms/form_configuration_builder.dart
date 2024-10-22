import 'package:flutter/material.dart';
import '../models/models.dart';

class FormConfigurationsBuilder extends StatefulWidget {
  final List<LabTest> selectedTests;

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
        children: widget.selectedTests.map((test) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    test.name,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  ...test.formFields.map((field) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: _buildFieldWidget(field),
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

  Widget _buildFieldWidget(FormFieldConfiguration fieldConfig) {
    switch (fieldConfig.type) {
      case FormFieldType.text:
        return TextFieldWidget(
          label: fieldConfig.label,
          initialValue: formData[fieldConfig.label],
          onChanged: (val) => _updateFormData(fieldConfig.label, val),
        );
      case FormFieldType.number:
        return NumberFieldWidget(
          label: fieldConfig.label,
          initialValue: formData[fieldConfig.label],
          onChanged: (val) => _updateFormData(fieldConfig.label, val),
        );
      case FormFieldType.checkbox:
        return CheckboxFieldWidget(
          label: fieldConfig.label,
          initialValue: formData[fieldConfig.label] ?? false,
          onChanged: (val) => _updateFormData(fieldConfig.label, val),
        );
      case FormFieldType.date:
        return DateFieldWidget(
          label: fieldConfig.label,
          initialValue: formData[fieldConfig.label],
          onChanged: (val) => _updateFormData(fieldConfig.label, val),
        );
      case FormFieldType.dropdown:
        return DropdownFieldWidget(
          label: fieldConfig.label,
          initialValue: formData[fieldConfig.label],
          options: fieldConfig.options,
          onChanged: (val) => _updateFormData(fieldConfig.label, val),
        );
      case FormFieldType.toggle:
        return ToggleFieldWidget(
          label: fieldConfig.label,
          initialValue: formData[fieldConfig.label],
          options: fieldConfig.options,
          onChanged: (val) => _updateFormData(fieldConfig.label, val),
        );
      case FormFieldType.textArea:
        return TextAreaFieldWidget(
          label: fieldConfig.label,
          initialValue: formData[fieldConfig.label],
          onChanged: (val) => _updateFormData(fieldConfig.label, val),
        );
      case FormFieldType.slider:
        return SliderFieldWidget(
          label: fieldConfig.label,
          initialValue: formData[fieldConfig.label] ?? 0,
          onChanged: (val) => _updateFormData(fieldConfig.label, val),
        );
      default:
        return const SizedBox.shrink();
    }
  }

  void _updateFormData(String label, dynamic value) {
    setState(() {
      formData[label] = value;
    });
  }
}

// Individual field classes
class TextFieldWidget extends StatelessWidget {
  final String label;
  final String? initialValue;
  final ValueChanged<String> onChanged;

  const TextFieldWidget({
    super.key,
    required this.label,
    required this.initialValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(labelText: label),
      initialValue: initialValue,
      onChanged: onChanged,
    );
  }
}

class NumberFieldWidget extends StatelessWidget {
  final String label;
  final int? initialValue;
  final ValueChanged<int?> onChanged;

  const NumberFieldWidget({
    super.key,
    required this.label,
    required this.initialValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(labelText: label),
      keyboardType: TextInputType.number,
      initialValue: initialValue?.toString(),
      onChanged: (val) => onChanged(int.tryParse(val)),
    );
  }
}

class CheckboxFieldWidget extends StatelessWidget {
  final String label;
  final bool initialValue;
  final ValueChanged<bool?> onChanged;

  const CheckboxFieldWidget({
    super.key,
    required this.label,
    required this.initialValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(label),
      value: initialValue,
      onChanged: onChanged,
    );
  }
}

class DateFieldWidget extends StatelessWidget {
  final String label;
  final DateTime? initialValue;
  final ValueChanged<DateTime?> onChanged;

  const DateFieldWidget({
    super.key,
    required this.label,
    required this.initialValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(label),
      subtitle: Text(
          initialValue != null ? initialValue.toString() : 'Select a date'),
      trailing: const Icon(Icons.calendar_today),
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
        );
        if (pickedDate != null) onChanged(pickedDate);
      },
    );
  }
}

class DropdownFieldWidget extends StatelessWidget {
  final String label;
  final String? initialValue;
  final List<String>? options;
  final ValueChanged<String?> onChanged;

  const DropdownFieldWidget({
    super.key,
    required this.label,
    required this.initialValue,
    required this.options,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(labelText: label),
      value: initialValue,
      items: options
          ?.map(
              (option) => DropdownMenuItem(value: option, child: Text(option)))
          .toList(),
      onChanged: onChanged,
    );
  }
}

class ToggleFieldWidget extends StatelessWidget {
  final String label;
  final String? initialValue;
  final List<String>? options;
  final ValueChanged<String?> onChanged;

  const ToggleFieldWidget({
    super.key,
    required this.label,
    required this.initialValue,
    required this.options,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(label),
        const Spacer(),
        DropdownButton<String>(
          value: initialValue,
          items: options
              ?.map((option) =>
                  DropdownMenuItem(value: option, child: Text(option)))
              .toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }
}

class TextAreaFieldWidget extends StatelessWidget {
  final String label;
  final String? initialValue;
  final ValueChanged<String> onChanged;

  const TextAreaFieldWidget({
    super.key,
    required this.label,
    required this.initialValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(labelText: label),
      initialValue: initialValue,
      maxLines: 3,
      onChanged: onChanged,
    );
  }
}

class SliderFieldWidget extends StatelessWidget {
  final String label;
  final int initialValue;
  final ValueChanged<double> onChanged;

  const SliderFieldWidget({
    super.key,
    required this.label,
    required this.initialValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        Slider(
          value: initialValue.toDouble(),
          min: 0,
          max: 100,
          divisions: 10,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
