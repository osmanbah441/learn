import 'form_configuration.dart';

class TestCategory {
  final String id; // The category ID.
  final String name; // The category name.

  const TestCategory({
    required this.id,
    required this.name,
  });
}

class LabTest {
  final String id; // The lab test ID.
  final String testName; // The name of the lab test.
  final String categoryId; // Reference to the TestCategory ID.
  final FormConfiguration formConfiguration; // Configuration for the test form.

  const LabTest({
    required this.id,
    required this.testName,
    required this.categoryId,
    required this.formConfiguration,
  });
}
