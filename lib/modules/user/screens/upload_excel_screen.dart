// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:geo_data_app/shared/services/excel_service.dart';
// import 'package:geo_data_app/shared/services/weather_service.dart';
// import 'package:geo_data_app/shared/widgets/navbar_widget.dart';
// import 'package:permission_handler/permission_handler.dart';

// class UploadExcelScreen extends StatefulWidget {
//   const UploadExcelScreen({super.key});

//   @override
//   State<UploadExcelScreen> createState() => _UploadExcelScreenState();
// }

// class _UploadExcelScreenState extends State<UploadExcelScreen> {
//   final ExcelService _excelService = ExcelService();
//   final WeatherService _weatherService = WeatherService();

//   Future<void> _pickAndUploadFile() async {
//     try {
//       if (await Permission.storage.request().isGranted) {
//         FilePickerResult? result = await FilePicker.platform.pickFiles(
//           type: FileType.custom,
//           allowedExtensions: ['xlsx'],
//         );

//         if (result != null) {
//           final file = result.files.single;
//           if (file.path != null) {
//             final bytes = File(file.path!).readAsBytesSync();
//             final data = _excelService.readExcel(bytes);
//             final List<Map<String, dynamic>> locations =
//                 List<Map<String, dynamic>>.from(data['locations']);
//             final weatherData = await _weatherService.fetchWeather(locations);
//             Navigator.pushNamed(context, '/weatherReport',
//                 arguments: weatherData);
//              ScaffoldMessenger.of(context).showSnackBar(
//               const SnackBar(content: Text('Uploaded file successfully')),
//             );
//           } else {
//             ScaffoldMessenger.of(context).showSnackBar(
//               const SnackBar(content: Text('Failed to read file')),
//             );
//           }
//         }
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Storage permission denied')),
//         );
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error: ${e.toString()}')),
//       );
//       print('Error: ${e.toString()}');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const NavbarWidget(),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: _pickAndUploadFile,
//           child: const Text('Upload Excel File'),
//         ),
//       ),
//       // bottomNavigationBar: const FooterWidget()
//     );
//   }
// }
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:geo_data_app/shared/services/excel_service.dart';
// import 'package:geo_data_app/shared/services/weather_service.dart';
// import 'package:geo_data_app/shared/widgets/footer_widget.dart';
// import 'package:geo_data_app/shared/widgets/navbar_widget.dart';
// import 'package:permission_handler/permission_handler.dart';

// class UploadExcelScreen extends StatefulWidget {
//   const UploadExcelScreen({super.key});

//   @override
//   State<UploadExcelScreen> createState() => _UploadExcelScreenState();
// }

// class _UploadExcelScreenState extends State<UploadExcelScreen> {
//   final ExcelService _excelService = ExcelService();
//   final WeatherService _weatherService = WeatherService();

//   // Future<void> _pickAndUploadFile() async {
//   //   try {
//   //     if (await Permission.storage.request().isGranted) {
//   //       FilePickerResult? result = await FilePicker.platform.pickFiles(
//   //         type: FileType.custom,
//   //         allowedExtensions: ['xlsx'],
//   //       );

//   //       if (result != null) {
//   //         final file = result.files.single;
//   //         if (file.path != null) {
//   //           final bytes = File(file.path!).readAsBytesSync();
//   //           final data = _excelService.readExcel(bytes);
//   //           final List<Map<String, dynamic>> locations =
//   //               List<Map<String, dynamic>>.from(data['locations']);
//   //           List<Map<String, dynamic>> weatherData = [];

//   //           for (var location in locations) {
//   //             final lat = double.tryParse(location['lat']) ?? 0.0;
//   //             final lon = double.tryParse(location['lon']) ?? 0.0;
//   //             final weather = await _weatherService.fetchWeather(lat, lon);
//   //             weatherData.add(weather);
//   //           }

//   //           Navigator.pushNamed(context, '/weatherReport',
//   //               arguments: {'weatherData': weatherData});
//   //         } else {
//   //           ScaffoldMessenger.of(context).showSnackBar(
//   //             const SnackBar(content: Text('Failed to read file')),
//   //           );
//   //         }
//   //       }
//   //     } else {
//   //       ScaffoldMessenger.of(context).showSnackBar(
//   //         const SnackBar(content: Text('Storage permission denied')),
//   //       );
//   //     }
//   //   } catch (e) {
//   //     ScaffoldMessenger.of(context).showSnackBar(
//   //       SnackBar(content: Text('Error: ${e.toString()}')),
//   //     );
//   //   }
//   // }
//   Future<void> _pickAndUploadFile() async {
//     try {
//       // Mock dataset
//       final List<Map<String, dynamic>> locations = [
//         {
//           'country': 'India',
//           'state': 'Kerala',
//           'district': 'Malappuram',
//           'city': 'Nilambur',
//           'lat': '11.2766',
//           'lon': '76.3555',
//         },
//         {
//           'country': 'USA',
//           'state': 'CA',
//           'district': 'Los Angeles',
//           'city': 'Los Angeles',
//           'lat': '34.0522',
//           'lon': '-118.2437',
//         },
//         {
//           'country': 'UK',
//           'state': 'England',
//           'district': 'London',
//           'city': 'London',
//           'lat': '51.5074',
//           'lon': '-0.1278',
//         },
//       ];

//       List<Map<String, dynamic>> weatherData = [];

//       for (var location in locations) {
//         final lat = double.tryParse(location['lat']) ?? 0.0;
//         final lon = double.tryParse(location['lon']) ?? 0.0;
//         final weather = await _weatherService.fetchWeather(lat, lon);
//         weatherData.add(weather);
//       }

//       Navigator.pushNamed(context, '/weatherReport', arguments: {'weatherData': weatherData});
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error: ${e.toString()}')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: NavbarWidget(),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: _pickAndUploadFile,
//           child: const Text('Upload Excel File'),
//         ),
//       ),
//       // bottomNavigationBar: const FooterWidget()
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:geo_data_app/shared/services/excel_service.dart';
import 'package:geo_data_app/shared/services/weather_service.dart';
import 'package:geo_data_app/shared/widgets/footer_widget.dart';
import 'package:geo_data_app/shared/widgets/navbar_widget.dart';
import 'package:weather/weather.dart';
import 'package:geo_data_app/routes/app_routes.dart';

class UploadExcelScreen extends StatefulWidget {
  const UploadExcelScreen({super.key});

  @override
  State<UploadExcelScreen> createState() => _UploadExcelScreenState();
}

class _UploadExcelScreenState extends State<UploadExcelScreen> {
  final ExcelService _excelService = ExcelService();
  final WeatherService _weatherService = WeatherService();

  Future<void> _pickAndUploadFile() async {
    try {
      // Mock dataset
      final List<Map<String, dynamic>> locations = [
        {
          'country': 'India',
          'state': 'Kerala',
          'district': 'Malappuram',
          'city': 'Nilambur',
          'lat': '11.2766',
          'lon': '76.3555',
        },
        {
          'country': 'USA',
          'state': 'CA',
          'district': 'Los Angeles',
          'city': 'Los Angeles',
          'lat': '34.0522',
          'lon': '-118.2437',
        },
        {
          'country': 'UK',
          'state': 'England',
          'district': 'London',
          'city': 'London',
          'lat': '51.5074',
          'lon': '-0.1278',
        },
      ];

      List<Map<String, dynamic>> weatherData = [];

      for (var location in locations) {
        final lat = double.tryParse(location['lat']) ?? 0.0;
        final lon = double.tryParse(location['lon']) ?? 0.0;
        final Weather weather = await _weatherService.fetchWeather(lat, lon);
        weatherData.add({
          'city': location['city'],
          'state': location['state'],
          'country': location['country'],
          'report': weather.weatherDescription,
          'temperature': weather.temperature?.celsius,
        });
      }

      print('Weather Data to Pass: $weatherData'); // Debugging line

      Navigator.pushNamed(
        context,
        AppRoutes.weatherReport,
        arguments: weatherData,
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavbarWidget(),
      body: Center(
        child: ElevatedButton(
          onPressed: _pickAndUploadFile,
          child: const Text('Upload Excel File'),
        ),
      ),
      // bottomNavigationBar: const FooterWidget()
    );
  }
}
