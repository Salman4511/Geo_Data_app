// routes/route_generator.dart
import 'package:flutter/material.dart';
// import '../modules/admin/screens/admin_dashboard_screen.dart';
// import '../modules/admin/screens/add_location_screen.dart';
// import '../modules/user/screens/user_dashboard_screen.dart';
// import '../modules/user/screens/upload_excel_screen.dart';
// import '../modules/user/screens/weather_report_screen.dart';
import '../modules/auth/screens/login_screen.dart';
import '../modules/auth/screens/signup_screen.dart';
import '../modules/auth/screens/loading_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case AppRoutes.login:
      //   return MaterialPageRoute(builder: (_) => LoginScreen());
      // case AppRoutes.signup:
      //   return MaterialPageRoute(builder: (_) => SignupScreen());
      // case AppRoutes.adminDashboard:
      //   return MaterialPageRoute(builder: (_) => AdminDashboardScreen());
      // case AppRoutes.addLocation:
      //   return MaterialPageRoute(builder: (_) => AddLocationScreen());
      // case AppRoutes.userDashboard:
      //   return MaterialPageRoute(builder: (_) => UserDashboardScreen());
      // case AppRoutes.uploadExcel:
      //   return MaterialPageRoute(builder: (_) => UploadExcelScreen());
      // case AppRoutes.weatherReport:
      //   return MaterialPageRoute(builder: (_) => WeatherReportScreen());
      // case AppRoutes.loading:
      //   return MaterialPageRoute(builder: (_) => LoadingScreen());
      default:
        return MaterialPageRoute(
            builder: (_) =>
                Scaffold(body: Center(child: Text('Page not found'))));
    }
  }
}
