import 'package:flutter/material.dart';

import '../../api/mock_api.dart';
import '../../models/models.dart';

class AddLabRequestScreen extends StatelessWidget {
  const AddLabRequestScreen({super.key, required this.api});

  final MockApi api;

  @override
  Widget build(BuildContext context) {
    return _LabTestRequest(api);
  }
}

class _LabTestRequest extends StatefulWidget {
  const _LabTestRequest(this.api);

  final MockApi api;

  @override
  State<_LabTestRequest> createState() => _LabTestRequestState();
}

class _LabTestRequestState extends State<_LabTestRequest> {
  final _formKey = GlobalKey<FormState>();

  final List<LabTest> _selectedTests = [];

  final TextEditingController nameController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController genderController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    idController.dispose();
    genderController.dispose();
    ageController.dispose();
    super.dispose();
  }

  void _submitRequest() {
    if (_formKey.currentState!.validate()) {
      widget.api.createLabTestRequest(
        patientAge: int.parse(ageController.text),
        patientFullName: nameController.text,
        patientGender: genderController.text,
        doctorFullname: 'Dr. Alice Johnson',
        doctorId: '5',
        patientId: idController.text,
        requestedAt: DateTime.now(),
        requestedTests: _selectedTests.map((test) => test.id).toList(),
      );

      // Show a success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Lab test request submitted successfully!')),
      );

      // Clear the form
      setState(() {
        _selectedTests.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Request Lab Tests'),
        centerTitle: false,
      ),
      persistentFooterButtons: [
        ElevatedButton(
          onPressed: _submitRequest,
          child: const Text('Submit Request'),
        ),
      ],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _PatientInfo(
                nameController: nameController,
                genderController: genderController,
                idController: idController,
                ageController: ageController,
              ),
              const Text('Select Tests:', style: TextStyle(fontSize: 18)),
              Wrap(
                spacing: 8.0, // Space between chips
                runSpacing: 8.0,
                children: widget.api.labTests.map((test) {
                  return ChoiceChip(
                    label: Text(test.testName),
                    selected: _selectedTests.contains(test),
                    onSelected: (selected) {
                      setState(() {
                        if (selected) {
                          _selectedTests.add(test);
                        } else {
                          _selectedTests.remove(test);
                        }
                      });
                    },
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PatientInfo extends StatelessWidget {
  const _PatientInfo(
      {required this.nameController,
      required this.idController,
      required this.ageController,
      required this.genderController});

  final TextEditingController nameController;
  final TextEditingController idController;
  final TextEditingController ageController;
  final TextEditingController genderController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: nameController,
          decoration: const InputDecoration(labelText: 'Patient Name'),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter the patient\'s name';
            }
            return null;
          },
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: idController,
          decoration: const InputDecoration(labelText: 'Patient ID'),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter the patient\'s ID';
            }
            return null;
          },
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: ageController,
          decoration: const InputDecoration(labelText: 'Patient Age'),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter the patient\'s Age';
            }
            return null;
          },
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: genderController,
          decoration: const InputDecoration(labelText: 'Gender'),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter the patient\'s Gendder';
            }
            return null;
          },
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
