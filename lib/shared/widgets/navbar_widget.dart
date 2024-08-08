import 'package:flutter/material.dart';

class NavbarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Geo Data App'),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () {
            // Handle logout
          },
        ),
      ],
    );
  }
}
