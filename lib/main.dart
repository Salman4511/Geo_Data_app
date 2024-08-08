import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:geo_data_app/shared/constants/constants.dart';
import 'routes/route_generator.dart';
import 'routes/app_routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: Constants.firebaseApiKey,
      appId: Constants.appId,
      messagingSenderId: Constants.messagingSenderId,
      projectId: Constants.projectId,
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final RouteGenerator routeGenerator = RouteGenerator();

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        String initialRoute;

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const MaterialApp(
            home: Scaffold(body: Center(child: CircularProgressIndicator())),
          );
        } else if (snapshot.hasData) {
          initialRoute = AppRoutes.loading;
        } else {
          initialRoute = AppRoutes.login;
        }

        return MaterialApp(
          navigatorKey: navigatorKey,
          title: 'Geo Data App',
          theme: ThemeData(primarySwatch: Colors.blue),
          initialRoute: initialRoute,
          onGenerateRoute: routeGenerator.onGenerateRoute,
        );
      },
    );
  }
}
