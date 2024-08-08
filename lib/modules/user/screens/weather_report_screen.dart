import 'package:flutter/material.dart';

class WeatherReportScreen extends StatelessWidget {
  const WeatherReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final weatherData = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      appBar: AppBar(title: const Text('Weather Reports')),
      body: ListView.builder(
        itemCount: weatherData.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text('Weather Report ${index + 1}'),
              subtitle: Text(weatherData[index]['report']),
            ),
          );
        },
      ),
    );
  }
}
