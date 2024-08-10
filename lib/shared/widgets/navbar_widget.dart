import 'package:flutter/material.dart';
import 'package:geo_data_app/shared/services/auth_services.dart';

class NavbarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const NavbarWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title:  Text(title),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () {
            AuthService().signOut();
            Navigator.pushNamed(context, '/login');
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
