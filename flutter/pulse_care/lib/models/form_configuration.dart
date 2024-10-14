enum FormFieldType { text, number, checkbox, date }

class FormConfiguration {
  String name;
  List<FormFieldConfiguration> fields;

  FormConfiguration({
    required this.name,
    required this.fields,
  });
}

class FormFieldConfiguration {
  String label;
  FormFieldType type;

  FormFieldConfiguration({
    required this.label,
    required this.type,
  });
}
