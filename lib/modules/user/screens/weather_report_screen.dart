
// import 'package:flutter/material.dart';
// import 'package:geo_data_app/shared/widgets/navbar_widget.dart';

// class WeatherReportScreen extends StatelessWidget {
//   const WeatherReportScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final arguments =
//         ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

//     if (arguments == null) {
//       return Scaffold(
//         appBar: NavbarWidget(),
//         body: const Center(
//           child: Text('No data available'),
//         ),
//         // bottomNavigationBar: const FooterWidget(),
//       );
//     }

//     final List<Map<String, dynamic>> weatherData =
//         List<Map<String, dynamic>>.from(arguments['weatherData'] ?? []);

//     if (weatherData.isEmpty) {
//       return Scaffold(
//         appBar: NavbarWidget(),
//         body: const Center(
//           child: Text('No weather reports available'),
//         ),
//         // bottomNavigationBar: const FooterWidget(),
//       );
//     }

//     return Scaffold(
//       appBar: NavbarWidget(),
//       body: ListView.builder(
//         itemCount: weatherData.length,
//         itemBuilder: (context, index) {
//           final report = weatherData[index]['report'] ?? 'No report available';
//           final temperature = weatherData[index]['temperature'] ?? 'N/A';
//           return Card(
//             child: ListTile(
//               title: Text('Weather Report ${index + 1}'),
//               subtitle: Text('Report: $report\nTemperature: $temperature'),
//             ),
//           );
//         },
//       ),
//       // bottomNavigationBar: const FooterWidget(),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:geo_data_app/shared/widgets/navbar_widget.dart';

class WeatherReportScreen extends StatelessWidget {
  final List<Map<String, dynamic>> weatherData;

  const WeatherReportScreen({super.key, required this.weatherData});

  @override
  Widget build(BuildContext context) {
    print('Weather Data: $weatherData'); // Debugging line

    if (weatherData.isEmpty) {
      return Scaffold(
        appBar: NavbarWidget(),
        body: const Center(
          child: Text('No weather reports available'),
        ),
        // bottomNavigationBar: const FooterWidget(),
      );
    }

    return Scaffold(
      appBar: NavbarWidget(),
      body: ListView.builder(
        itemCount: weatherData.length,
        itemBuilder: (context, index) {
          final report = weatherData[index]['report'] ?? 'No report available';
          final temperature = weatherData[index]['temperature'] ?? 'N/A';
          return Card(
            child: ListTile(
              title: Text('Weather Report ${index + 1}'),
              subtitle: Text('Report: $report\nTemperature: $temperature°C'),
            ),
          );
        },
      ),
      // bottomNavigationBar: const FooterWidget(),
    );
  }
}
