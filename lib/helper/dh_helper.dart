import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:quates_app/models/db_converter_class.dart';
import 'package:quates_app/models/quote_data.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  // private named Constructor
  DBHelper._();

  // static final object of current class
  static final DBHelper dbHelper = DBHelper._();

  //Common Variables
  final String id = 'id';
  final String quote = 'quote';
  final String name = 'name';

  //variables of table
  final String tran = 'random';
  final String tfor = 'forgive';
  final String tmot = 'motivation';
  final String tler = 'learning';
  final String tatt = 'attitude';
  final String tpat = 'patience';
  final String tbra = 'bravery';
  final String tent = 'enterpreneur';
  final String tcon = 'confidence';

  //create a dataBase
  Database? db;
  final String nmDB = 'mdb.db';

  //initialize database
  Future<void> initDB() async {
    String dir = await getDatabasesPath();
    String path = join(dir, nmDB);

    //table creation
    db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        String q1 =
            "CREATE TABLE IF NOT EXISTS $tran($id INTEGER PRIMARY KEY AUTOINCREMENT,$quote TEXT,$name TEXT);";
        String q2 =
            "CREATE TABLE IF NOT EXISTS $tfor($id INTEGER PRIMARY KEY AUTOINCREMENT,$quote TEXT,$name TEXT);";
        String q3 =
            "CREATE TABLE IF NOT EXISTS $tmot($id INTEGER PRIMARY KEY AUTOINCREMENT,$quote TEXT,$name TEXT);";
        String q4 =
            "CREATE TABLE IF NOT EXISTS $tler($id INTEGER PRIMARY KEY AUTOINCREMENT,$quote TEXT,$name TEXT);";
        String q5 =
            "CREATE TABLE IF NOT EXISTS $tatt($id INTEGER PRIMARY KEY AUTOINCREMENT,$quote TEXT,$name TEXT);";
        String q6 =
            "CREATE TABLE IF NOT EXISTS $tpat($id INTEGER PRIMARY KEY AUTOINCREMENT,$quote TEXT,$name TEXT);";
        String q7 =
            "CREATE TABLE IF NOT EXISTS $tbra($id INTEGER PRIMARY KEY AUTOINCREMENT,$quote TEXT,$name TEXT);";
        String q8 =
            "CREATE TABLE IF NOT EXISTS $tent($id INTEGER PRIMARY KEY AUTOINCREMENT,$quote TEXT,$name TEXT);";
        String q9 =
            "CREATE TABLE IF NOT EXISTS $tcon($id INTEGER PRIMARY KEY AUTOINCREMENT,$quote TEXT,$name TEXT);";

        //execution of query
        await db.execute(q1);
        await db.execute(q2);
        await db.execute(q3);
        await db.execute(q4);
        await db.execute(q5);
        await db.execute(q6);
        await db.execute(q7);
        await db.execute(q8);
        await db.execute(q9);

        print('successfully created');
      },
    );
  }

  // inserting records------------------------

  // inserting random quote
  Future<int?> insertRandom({
    required String qt,
    required String nms,
  }) async {
    await initDB();
    String query = "INSERT INTO $tran($quote,$name) VALUES(?,?);";
    List args = [qt, nms];
    int id = await db!.rawInsert(query, args);

    print('insertion id= $id');
    return id;
  }

  // inserting forgive quote
  Future<int?> insertForgive({
    required String qt,
    required String nms,
  }) async {
    await initDB();
    String query = "INSERT INTO $tfor($quote,$name) VALUES(?,?);";
    List args = [qt, nms];
    int id = await db!.rawInsert(query, args);

    print('insertion id= $id');
    return id;
  }

  // inserting motivation quote
  Future<int?> insertMotivation({
    required String qt,
    required String nms,
  }) async {
    await initDB();
    String query = "INSERT INTO $tmot($quote,$name) VALUES(?,?);";
    List args = [qt, nms];
    int id = await db!.rawInsert(query, args);

    print('insertion id= $id');
    return id;
  }

  // inserting learning quote
  Future<int?> insertLearning({
    required String qt,
    required String nms,
  }) async {
    await initDB();
    String query = "INSERT INTO $tler($quote,$name) VALUES(?,?);";
    List args = [qt, nms];
    int id = await db!.rawInsert(query, args);

    print('insertion id= $id');
    return id;
  }

  // inserting attitude quote
  Future<int?> insertAttitude({
    required String qt,
    required String nms,
  }) async {
    await initDB();
    String query = "INSERT INTO $tatt($quote,$name) VALUES(?,?);";
    List args = [qt, nms];
    int id = await db!.rawInsert(query, args);

    print('insertion id= $id');
    return id;
  }

  // inserting patience quote
  Future<int?> insertPatience({
    required String qt,
    required String nms,
  }) async {
    await initDB();
    String query = "INSERT INTO $tpat($quote,$name) VALUES(?,?);";
    List args = [qt, nms];
    int id = await db!.rawInsert(query, args);

    print('insertion id= $id');
    return id;
  }

  // inserting patience quote
  Future<int?> insertBravery({
    required String qt,
    required String nms,
  }) async {
    await initDB();
    String query = "INSERT INTO $tpat($quote,$name) VALUES(?,?);";
    List args = [qt, nms];
    int id = await db!.rawInsert(query, args);

    print('insertion id= $id');
    return id;
  }

  // inserting enterpreneur quote
  Future<int?> insertEnterpreneur({
    required String qt,
    required String nms,
  }) async {
    await initDB();
    String query = "INSERT INTO $tent($quote,$name) VALUES(?,?);";
    List args = [qt, nms];
    int id = await db!.rawInsert(query, args);

    print('insertion id= $id');
    return id;
  }

  // insert confidence quote
  Future<int?> insertConfidence({
    required String qt,
    required String nms,
  }) async {
    await initDB();
    String query = "INSERT INTO $tcon($quote,$name) VALUES(?,?);";
    List args = [qt, nms];
    int id = await db!.rawInsert(query, args);

    print('insertion id= $id');
    return id;
  }

  //fetching all data----------------------------------------------

  //fetch random
  Future<List<db_Entry>> fetchRandom() async {
    await initDB();
    String query = "SELECT * FROM $tran;";
    List<Map<String, dynamic>> allQts = await db!.rawQuery(query);

    List<db_Entry> qts = allQts.map((e) => db_Entry.fromMap(e)).toList();
    return qts;
  }

  //fetch Forgive
  Future<List<db_Entry>> fetchForgive() async {
    await initDB();
    String query = "SELECT * FROM $tfor;";
    List<Map<String, dynamic>> allQts = await db!.rawQuery(query);

    List<db_Entry> qts = allQts.map((e) => db_Entry.fromMap(e)).toList();
    return qts;
  }

  //fetch Motivation
  Future<List<db_Entry>> fetchMotivation() async {
    await initDB();
    String query = "SELECT * FROM $tmot;";
    List<Map<String, dynamic>> allQts = await db!.rawQuery(query);

    List<db_Entry> qts = allQts.map((e) => db_Entry.fromMap(e)).toList();
    return qts;
  }

  //fetch learning
  Future<List<db_Entry>> fetchLearning() async {
    await initDB();
    String query = "SELECT * FROM $tler;";
    List<Map<String, dynamic>> allQts = await db!.rawQuery(query);

    List<db_Entry> qts = allQts.map((e) => db_Entry.fromMap(e)).toList();
    return qts;
  }

  //fetch Attitude
  Future<List<db_Entry>> fetchAttitude() async {
    await initDB();
    String query = "SELECT * FROM $tatt;";
    List<Map<String, dynamic>> allQts = await db!.rawQuery(query);

    List<db_Entry> qts = allQts.map((e) => db_Entry.fromMap(e)).toList();
    return qts;
  }

  //fetch Paitence
  Future<List<db_Entry>> fetchPaitence() async {
    await initDB();
    String query = "SELECT * FROM $tpat;";
    List<Map<String, dynamic>> allQts = await db!.rawQuery(query);

    List<db_Entry> qts = allQts.map((e) => db_Entry.fromMap(e)).toList();
    return qts;
  }

  //fetch Bravery
  Future<List<db_Entry>> fetchBravery() async {
    await initDB();
    String query = "SELECT * FROM $tbra;";
    List<Map<String, dynamic>> allQts = await db!.rawQuery(query);

    List<db_Entry> qts = allQts.map((e) => db_Entry.fromMap(e)).toList();
    return qts;
  }

  //fetch Enterprenuer
  Future<List<db_Entry>> fetchEnterprenuer() async {
    await initDB();
    String query = "SELECT * FROM $tent;";
    List<Map<String, dynamic>> allQts = await db!.rawQuery(query);

    List<db_Entry> qts = allQts.map((e) => db_Entry.fromMap(e)).toList();
    return qts;
  }

  //fetch Confidence
  Future<List<db_Entry>> fetchConfidence() async {
    await initDB();
    String query = "SELECT * FROM $tcon;";
    List<Map<String, dynamic>> allQts = await db!.rawQuery(query);

    List<db_Entry> qts = allQts.map((e) => db_Entry.fromMap(e)).toList();
    return qts;
  }

  //load from json and insert to db---------------------------------------------
  Future<List<Quotes>> loadRandom() async {
    String jsData =
        await rootBundle.loadString('assets/json files/random.json');
    List dts = jsonDecode(jsData);
    List<Quotes> quote = dts.map((e) => Quotes.fromMap(data: e)).toList();
    return quote;
  }

  Future<List<Quotes>> loadForgive() async {
    String jsData =
    await rootBundle.loadString('assets/json files/forgive.json');
    List dts = jsonDecode(jsData);
    List<Quotes> quote = dts.map((e) => Quotes.fromMap(data: e)).toList();
    return quote;
  }

  Future<List<Quotes>> loadMotivation() async {
    String jsData =
    await rootBundle.loadString('assets/json files/motivation.json');
    List dts = jsonDecode(jsData);
    List<Quotes> quote = dts.map((e) => Quotes.fromMap(data: e)).toList();
    return quote;
  }

  Future<List<Quotes>> loadLearning() async {
    String jsData =
    await rootBundle.loadString('assets/json files/learning.json');
    List dts = jsonDecode(jsData);
    List<Quotes> quote = dts.map((e) => Quotes.fromMap(data: e)).toList();
    return quote;
  }

  Future<List<Quotes>> loadAttitude() async {
    String jsData =
    await rootBundle.loadString('assets/json files/attitude.json');
    List dts = jsonDecode(jsData);
    List<Quotes> quote = dts.map((e) => Quotes.fromMap(data: e)).toList();
    return quote;
  }

  Future<List<Quotes>> loadBravery() async {
    String jsData =
    await rootBundle.loadString('assets/json files/bravery.json');
    List dts = jsonDecode(jsData);
    List<Quotes> quote = dts.map((e) => Quotes.fromMap(data: e)).toList();
    return quote;
  }

  Future<List<Quotes>> loadConfidence() async {
    String jsData =
    await rootBundle.loadString('assets/json files/confidence.json');
    List dts = jsonDecode(jsData);
    List<Quotes> quote = dts.map((e) => Quotes.fromMap(data: e)).toList();
    return quote;
  }

  Future<List<Quotes>> loadEnterpreneur() async {
    String jsData =
    await rootBundle.loadString('assets/json files/enterpreneur.json');
    List dts = jsonDecode(jsData);
    List<Quotes> quote = dts.map((e) => Quotes.fromMap(data: e)).toList();
    return quote;
  }

  Future<List<Quotes>> loadPaitence() async {
    String jsData =
    await rootBundle.loadString('assets/json files/paitence.json');
    List dts = jsonDecode(jsData);
    List<Quotes> quote = dts.map((e) => Quotes.fromMap(data: e)).toList();
    return quote;
  }



}
