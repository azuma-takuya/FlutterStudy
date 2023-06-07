import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class JsonStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/data.json');
  }

  Future<void> writeData(Map<String, dynamic> data) async {
    final file = await _localFile;

    final jsonData = jsonEncode(data);
    // Write the file
    await file.writeAsString(jsonData);
  }

  Future<Map<String, dynamic>> readData() async {
    try {
      final file = await _localFile;

      // Read the file
      String jsonData = await file.readAsString();

      return jsonDecode(jsonData);
    } catch (e) {
      // If encountering an error, return empty map.
      return {};
    }
  }
}
