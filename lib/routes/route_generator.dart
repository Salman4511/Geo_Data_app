import 'package:flutter/material.dart';
import 'package:geo_data_app/routes/app_routes.dart';
import '../modules/admin/screens/admin_dashboard_screen.dart';
import '../modules/admin/screens/add_location_screen.dart';
import '../modules/user/screens/user_dashboard_screen.dart';
import '../modules/user/screens/upload_excel_screen.dart';
import '../modules/user/screens/weather_report_screen.dart';
import '../modules/auth/screens/login_screen.dart';
import '../modules/auth/screens/signup_screen.dart';
import '../modules/auth/screens/loading_screen.dart';

class RouteGenerator {
  Route onGenerateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case AppRoutes.signup:
        return MaterialPageRoute(builder: (_) => SignupScreen());
      case AppRoutes.adminDashboard:
        return MaterialPageRoute(builder: (_) => const AdminDashboardScreen());
      case AppRoutes.addLocation:
        return MaterialPageRoute(builder: (_) => const AddLocationScreen());
      case AppRoutes.userDashboard:
        return MaterialPageRoute(builder: (_) => UserDashboardScreen());
      case AppRoutes.uploadExcel:
        return MaterialPageRoute(builder: (_) => const UploadExcelScreen());
      case AppRoutes.weatherReport:
        return MaterialPageRoute(builder: (_) => const WeatherReportScreen());
      case AppRoutes.loading:
        return MaterialPageRoute(builder: (_) => const LoadingScreen());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (ctx) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: const Center(child: Text('Error while navigating')),
      );
    });
  }
}
