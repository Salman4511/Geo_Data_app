import 'package:flutter/material.dart';
import 'package:geo_data_app/routes/app_routes.dart';
import 'package:geo_data_app/shared/services/auth_services.dart';


class SignupScreen extends StatefulWidget {
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final AuthService _authService = AuthService();

  void _signup() async {
    final email = emailController.text;
    final password = passwordController.text;

    final user =
        await _authService.registerWithEmailAndPassword(email, password);
    if (user != null) {
      Navigator.pushReplacementNamed(context, AppRoutes.loading);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Sign up failed')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _signup,
              child: const Text('Sign Up'),
            ),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, AppRoutes.login),
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
