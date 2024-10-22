/// Enum representing the types of fields that can be included in the form.
enum FormFieldType {
  text, // Single-line text input
  number, // Numeric input
  checkbox, // Checkbox for boolean values
  date, // Date picker
  dropdown, // Dropdown menu with predefined options
  toggle, // Toggle for labeled binary choices
  textArea, // Multiline text input
  slider // Slider for numerical ranges
}

/// Configuration for a form field, including its label, type, and optional parameters.
class FormFieldConfiguration {
  /// The label to display for this field in the form.
  String label;

  /// The type of this field, determining the input widget used.
  FormFieldType type;

  /// Optional list of predefined options for dropdown and toggle types.
  /// Only used for [FormFieldType.dropdown] and [FormFieldType.toggle].
  List<String>? options;

  /// Constructor to create a [FormFieldConfiguration] with required label and type.
  /// Optionally, predefined options can be provided for dropdown and toggle types.
  FormFieldConfiguration({
    required this.label,
    required this.type,
    this.options,
  });
}

// /// Configuration for an entire form, including its name and list of fields.
// class FormConfiguration {
//   /// The name of the form, displayed as a title on the form screen.
//   String name;

//   /// A list of [FormFieldConfiguration] objects that define each field in the form.
//   List<FormFieldConfiguration> fields;

//   /// Constructor to create a [FormConfiguration] with required name and fields.
//   FormConfiguration({
//     required this.name,
//     required this.fields,
//   });
// }
