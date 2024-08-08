import 'package:excel/excel.dart';

class ExcelService {
  Map<String, dynamic> readExcel(List<int> bytes) {
    var excel = Excel.decodeBytes(bytes);
    Map<String, dynamic> data = {'locations': []};

    for (var table in excel.tables.keys) {
      for (var row in excel.tables[table]!.rows) {
        data['locations'].add({
          'country': row[0] ?? '',
          'state': row[1] ?? '',
          'district': row[2] ?? '',
          'city': row[3] ?? '',
        });
      }
    }
    return data;
  }
}
