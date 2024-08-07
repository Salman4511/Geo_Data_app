// main.dart
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'routes/route_generator.dart';
import 'routes/app_routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyALpnMKphZLZvTMdgiMTvbOiEw8fA464iM",
      appId: "1:349103870571:android:153ef91c3eae2f2595d72e",
      messagingSenderId: '349103870571',
      projectId: 'geo-data-app',
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const MaterialApp(
              home: Scaffold(body: Center(child: CircularProgressIndicator())));
        } else if (snapshot.hasData) {
          return MaterialApp(
            title: 'GEO DATA APP',
            theme: ThemeData(primarySwatch: Colors.blue),
            initialRoute: AppRoutes.loading,
            onGenerateRoute: RouteGenerator.generateRoute,
          );
        } else {
          return MaterialApp(
            title: 'GEO DATA APP',
            theme: ThemeData(primarySwatch: Colors.blue),
            initialRoute: AppRoutes.login,
            onGenerateRoute: RouteGenerator.generateRoute,
          );
        }
      },
    );
  }
}
