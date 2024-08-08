import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geo_data_app/shared/widgets/footer_widget.dart';
import 'package:geo_data_app/shared/widgets/navbar_widget.dart';

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
    await _firestore.collection('locations').add({
      'country': countryController.text,
      'state': stateController.text,
      'district': districtController.text,
      'city': cityController.text,
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Location added successfully')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavbarWidget() as PreferredSizeWidget?,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: countryController,
              decoration: const InputDecoration(labelText: 'Country'),
            ),
            TextField(
              controller: stateController,
              decoration: const InputDecoration(labelText: 'State'),
            ),
            TextField(
              controller: districtController,
              decoration: const InputDecoration(labelText: 'District'),
            ),
            TextField(
              controller: cityController,
              decoration: const InputDecoration(labelText: 'City'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addLocation,
              child: const Text('Add'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const FooterWidget()
    );
  }
}
