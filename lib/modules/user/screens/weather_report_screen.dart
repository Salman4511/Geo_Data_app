import 'package:flutter/material.dart';
import 'package:geo_data_app/shared/widgets/footer_widget.dart';
import 'package:geo_data_app/shared/widgets/navbar_widget.dart';

class WeatherReportScreen extends StatelessWidget {
  const WeatherReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final weatherData = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      appBar: NavbarWidget() as PreferredSizeWidget?,
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
      bottomNavigationBar: const FooterWidget()
    );
  }
}
