
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../model/category_model.dart';

class ChartDb {
  ChartDb._();
  static final ChartDb db = ChartDb._();

  static Database? _database;

  Future<Database?> get database async {
    if(_database != null) {
      return _database;
    }
    _database = await initDb();
    return _database;
  }
  initDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'chart.db');
    Database mydb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return mydb;
  }

  _onCreate(Database db, int ver)async{
    await db.execute('''
    CREATE TABLE "Chart"(
    "id" TEXT NOT NULL PRIMARY KEY,
    "date" TEXT NOT NULL,
    "category_name" TEXT NOT NULL,
    "amount" REAL NOT NULL,
    "color" INTEGER NOT NULL,
    "icon" TEXT NOT NULL
    )
    ''');

  }


  insertChart(Chart chart)async{
    final db = await database;
    var res = await db?.insert("Chart", chart.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
    print("insert");
    return res;

  }

  getChart(String id) async{
    final db = await database;
    var res = await db?.query("Chart", where: "id = ?", whereArgs: [id]);
    return res!.isNotEmpty ? Chart.fromMap(res.first): null;

  }

  Future<List<Chart>> getCategoryChart(String categoryName) async {
    final db = await database;
    var res = await db?.rawQuery("SELECT * FROM 'Chart' WHERE category_name = '$categoryName'");
    List<Chart> list = res!.isNotEmpty ? res.map((e) => Chart.fromMap(e)).toList(): [];
    return list;
  }


  Future<List<Chart>> getAllChart() async {
    final db = await database;
    var res = await db?.query("Chart");
    List<Chart> list = res!.isNotEmpty ? res.map((e) => Chart.fromMap(e)).toList(): [];

    return list;
  }

  updateChart(Chart chart) async {
    final db = await database;
    var res = await db?.update("Chart", chart.toMap(), where: "id = ?", whereArgs: [chart.id]);
    return res;
  }

  deleteChart(int id) async{
    final db = await database;
    db?.delete("Chart", where: "id = ?", whereArgs: [id]);
  }


   deleteMyDatabase() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'chart.db');
    deleteDatabase(path);

  }



}