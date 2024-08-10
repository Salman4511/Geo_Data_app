import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geo_data_app/shared/widgets/navbar_widget.dart';
import 'package:geo_data_app/shared/widgets/text_field_widget.dart';

class AddLocationScreen extends StatefulWidget {
  const AddLocationScreen({super.key});

  @override
  State<AddLocationScreen> createState() => _AddLocationScreenState();
}

class _AddLocationScreenState extends State<AddLocationScreen> {
  final TextEditingController countryController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController districtController = TextEditingController();
  final TextEditingController cityController = TextEditingController();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void _addLocation() async {
    if (countryController.text.isEmpty ||
        stateController.text.isEmpty ||
        districtController.text.isEmpty ||
        cityController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('All fields are required'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    await _firestore.collection('locations').add({
      'country': countryController.text,
      'state': stateController.text,
      'district': districtController.text,
      'city': cityController.text,
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Location added successfully'),
        backgroundColor: Colors.green,
      ),
    );

    countryController.clear();
    stateController.clear();
    districtController.clear();
    cityController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  const NavbarWidget(title: 'Add location',),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Text(
                'Add New Location',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              buildTextField(
                controller: countryController,
                label: 'Country',
                icon: Icons.public,
              ),
              buildTextField(
                controller: stateController,
                label: 'State',
                icon: Icons.location_city,
              ),
              buildTextField(
                controller: districtController,
                label: 'District',
                icon: Icons.location_on,
              ),
              buildTextField(
                controller: cityController,
                label: 'City',
                icon: Icons.home,
              ),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                onPressed: _addLocation,
                icon: const Icon(Icons.add),
                label: const Text('Add Location'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  textStyle: const TextStyle(fontSize: 18),
                  backgroundColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
