import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:geo_data_app/shared/services/excel_service.dart';
import 'package:geo_data_app/shared/services/weather_service.dart';

class UploadExcelScreen extends StatefulWidget {
  const UploadExcelScreen({super.key});

  @override
  State<UploadExcelScreen> createState() => _UploadExcelScreenState();
}

class _UploadExcelScreenState extends State<UploadExcelScreen> {
  final ExcelService _excelService = ExcelService();

  final WeatherService _weatherService = WeatherService();

  void _pickAndUploadFile() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['xlsx']);

    if (result != null) {
      final file = result.files.single;
      final data = _excelService.readExcel(file.bytes!);

      final weatherData = await _weatherService.fetchWeather(data['locations']);
      Navigator.pushNamed(context, '/weatherReport', arguments: weatherData);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Upload Excel')),
      body: Center(
        child: ElevatedButton(
          onPressed: _pickAndUploadFile,
          child: Text('Upload Excel File'),
        ),
      ),
    );
  }
}
