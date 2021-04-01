import 'package:sqflite_demo/Humansdao.dart';
import 'package:flutter/material.dart';
import 'package:sqflite_demo/Humans.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void> viewHumans() async {
    var list = await Humansdao().allHumans();

    for (Humans k in list) {
      print("*************");
      print("Humans id : ${k.humans_id}");
      print("Humans Name : ${k.humans_name}");
      print("Humans Age : ${k.humans_age}");
    }
  }

  Future<void> add() async {
    await Humansdao().addHumans("Ali", 37);
  }

  Future<void> delete() async {
    await Humansdao().deleteHumans(4);
  }

  Future<void> update() async {
    await Humansdao().updateHumans(5, "New name", 19);
  }

  Future<void> dataController(String key) async {
    int result = await Humansdao().contreoller(key);

    print(" There are $result $key in the data ");
  }

  Future<void> get() async {
    var human = await Humansdao().getHumans(1);

    print("*************");
    print("Humans id : ${human.humans_id}");
    print("Humans Name : ${human.humans_name}");
    print("Humans Age : ${human.humans_age}");
  }
  Future<void> search() async {
    var list = await Humansdao().searchHumans("i");

    for (Humans k in list) {
      print("*************");
      print("Humans id : ${k.humans_id}");
      print("Humans Name : ${k.humans_name}");
      print("Humans Age : ${k.humans_age}");
    }
  }


  Future<void> randomget() async {
    var list = await Humansdao().randomGetHumans();

    for (Humans k in list) {
      print("*************");
      print("Humans id : ${k.humans_id}");
      print("Humans Name : ${k.humans_name}");
      print("Humans Age : ${k.humans_age}");
    }
  }
  @override
  void initState() {
    super.initState();
    //add();
    //update();
    //delete();
    // viewHumans();
    //dataController("Ali");
    //get();
    //search();
    randomget();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SQLite demo "),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[]),
      ),
    );
  }
}
