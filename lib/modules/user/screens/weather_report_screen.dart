import 'package:flutter/material.dart';
import 'package:geo_data_app/shared/widgets/navbar_widget.dart';

class WeatherReportScreen extends StatelessWidget {
  final List<Map<String, dynamic>> weatherData;

  const WeatherReportScreen({super.key, required this.weatherData});

  @override
  Widget build(BuildContext context) {

    if (weatherData.isEmpty) {
      return const Scaffold(
        appBar: NavbarWidget(),
        body: Center(
          child: Text('No weather reports available'),
        ),
      );
    }

    return Scaffold(
      appBar: const NavbarWidget(),
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
