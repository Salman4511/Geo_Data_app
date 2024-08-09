
import 'package:excel/excel.dart';

class ExcelService {
  Map<String, dynamic> readExcel(List<int> bytes) {
    try {
      var excel = Excel.decodeBytes(bytes);
      List<Map<String, dynamic>> locations = [];

      if (excel != null) {
        for (var table in excel.tables.keys) {
          for (var row in excel.tables[table]!.rows) {
            // Ensure row has enough columns and handle null values
            if (row.length >= 4) {
              locations.add({
                'country': row[0]?.toString() ?? '',
                'state': row[1]?.toString() ?? '',
                'district': row[2]?.toString() ?? '',
                'city': row[3]?.toString() ?? '',
                'lat': row[4]?.toString() ??
                    '0.0', // Assuming latitude is in the 5th column
                'lon': row[5]?.toString() ??
                    '0.0', // Assuming longitude is in the 6th column
              });
            }
          }
        }
      } else {
        throw Exception('Failed to decode Excel file');
      }
      return {'locations': locations};
    } catch (e) {
      throw Exception('Error reading Excel file: ${e.toString()}');
    }
  }
}

