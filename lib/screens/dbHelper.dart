import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  Database? db;

  Future<Database> checkDatabase() async {
    if (db != null) {
      return db!;
    } else {
      return await createDatabase();
    }
  }

  Future<Database> createDatabase() async {
    Directory folder = await getApplicationDocumentsDirectory();
    String path = join(folder.path, "DbHelper");
    return openDatabase(path, version: 1, onCreate: (db, version) {
      String query = "CREATE TABLE zudio(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT,price TEXT)";
      db.execute(query);
    });
  }

  void insertData(String n1, String p1) async {
    db = await checkDatabase();
    db!.insert("zudio",{"name": n1, "price": p1});
  }

  Future<List<Map>> readData() async {
    db = await checkDatabase();
    String query = "SELECT * From zudio";
    List<Map> stdList = await db!.rawQuery(query, null);
    return stdList;
  }
}
