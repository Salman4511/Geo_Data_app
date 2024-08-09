import 'package:flutter/material.dart';
import 'package:geo_data_app/shared/widgets/navbar_widget.dart';

class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:NavbarWidget() ,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/addLocation');
              },
              child: const Text('Add Location'),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: const FooterWidget()
    );
  }
}
