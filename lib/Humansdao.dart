import 'package:sqflite_demo/DataBaseHelper.dart';
import 'package:sqflite_demo/Humans.dart';

class Humansdao{

  Future<List<Humans>> allHumans() async {
var db = await DataBaseHelper.databaseAcces();

List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM Humans" );

return List.generate(maps.length, (i){
  var line = maps[i];

  return Humans(line["humans_id"],line["humans_name"],line["humans_age"]);
});


  }

  Future<void> addHumans(String humans_name, int humans_age) async {
var db = await DataBaseHelper.databaseAcces();
var information = Map<String,dynamic>();

information["humans_name"]= humans_name;
information["humans_age"]= humans_age;

await   db.insert("Humans", information);




  }
}