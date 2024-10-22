import 'form_configuration.dart';

class LabTestCategory {
  final String id; // The category ID.
  final String name; // The category name.

  const LabTestCategory({
    required this.id,
    required this.name,
  });
}

class LabTest {
  final String? id; // The lab test ID.
  final String name; // The name of the lab test.
  final String category;
  final List<FormFieldConfiguration>
      formFields; // Configuration for the test form.
  final String description;

  const LabTest({
    this.id,
    required this.name,
    required this.category,
    required this.formFields,
    required this.description,
  });
}
