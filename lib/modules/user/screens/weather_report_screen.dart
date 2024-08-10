import 'package:flutter/material.dart';
import 'package:geo_data_app/shared/widgets/navbar_widget.dart';

class WeatherReportScreen extends StatelessWidget {
  final List<Map<String, dynamic>> weatherData;

  const WeatherReportScreen({super.key, required this.weatherData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NavbarWidget(title: 'Weather Report',),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: weatherData.isEmpty
            ? const Center(
                child: Text(
                  'No weather reports available',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              )
            : ListView.builder(
                itemCount: weatherData.length,
                itemBuilder: (context, index) {
                  final data = weatherData[index];
                  final city = data['city'] ?? 'Unknown City';
                  final state = data['state'] ?? 'Unknown State';
                  final country = data['country'] ?? 'Unknown Country';
                  final report = data['report'] ?? 'No report available';
                  final temperature = data['temperature'] != null
                      ? data['temperature'].toStringAsFixed(1)
                      : 'N/A';

                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '$city, $state, $country',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueAccent,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Icon(Icons.thermostat,
                                  color: Colors.orange),
                              const SizedBox(width: 8),
                              Text(
                                'Temperature: $temperature°C',
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Icon(Icons.cloud, color: Colors.blueAccent),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  'Report: $report',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
