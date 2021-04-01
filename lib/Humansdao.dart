import 'package:sqflite_demo/DataBaseHelper.dart';
import 'package:sqflite_demo/Humans.dart';

class Humansdao {
  Future<List<Humans>> allHumans() async {
    var db = await DataBaseHelper.databaseAcces();

    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM Humans");

    return List.generate(maps.length, (i) {
      var line = maps[i];

      return Humans(line["humans_id"], line["humans_name"], line["humans_age"]);
    });
  }

// This is to add Humans
  Future<void> addHumans(String humans_name, int humans_age) async {
    var db = await DataBaseHelper.databaseAcces();
    var information = Map<String, dynamic>();

    information["humans_name"] = humans_name;
    information["humans_age"] = humans_age;

    await db.insert("Humans", information);
  }

// This is to delete Humans
  Future<void> deleteHumans(int humans_id) async {
    var db = await DataBaseHelper.databaseAcces();

    await db.delete("Humans", where: "humans_id = ?", whereArgs: [humans_id]);
  }

  // This is to update Humans
  Future<void> updateHumans(
      int humans_id, String humans_name, int humans_age) async {
    var db = await DataBaseHelper.databaseAcces();

    var information = Map<String, dynamic>();
    information["humans_name"] = humans_name;
    information["humans_age"] = humans_age;

    await db.update("Humans", information,
        where: "humans_id=?", whereArgs: [humans_id]);
  }

  Future<int> contreoller(String humans_name) async {
    var db = await DataBaseHelper.databaseAcces();

    List<Map<String, dynamic>> maps = await db.rawQuery(
        "SELECT count (*) AS result  FROM Humans WHERE humans_name='$humans_name'");

        return maps[0]["result"];
  }
}
