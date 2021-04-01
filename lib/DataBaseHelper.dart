import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseHelper {
  static final String dataBaseName = "data.sqlite";

  static Future<Database> databaseAcces() async {
    String databasePath = join(await getDatabasesPath(), dataBaseName);
    if (await databaseExists(databasePath)) {
      print("Database already exists");
    } else {
      ByteData data = await rootBundle.load("data/$dataBaseName");
      List<int> bytes = data.buffer.asInt8List(data.offsetInBytes,data.lengthInBytes);
      await File(databasePath).writeAsBytes(bytes, flush: true);
      print("DataBAse is Copied");
    }

    return openDatabase(databasePath);
  }
}
