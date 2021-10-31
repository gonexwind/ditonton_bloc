import 'dart:async';

import 'package:ditonton/common/constants.dart';
import 'package:ditonton/data/models/movie_table.dart';
import 'package:ditonton/data/models/tv/tv_local_database/tv_local_database_model.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  DatabaseHelper._instance() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._instance();

  static Database? _database;

  Future<Database?> get database async {
    if (_database == null) {
      _database = await _initDb();
    }
    return _database;
  }

  Future<Database> _initDb() async {
    final path = await getDatabasesPath();
    final databasePath = '$path/ditonton.db';

    var db = await openDatabase(databasePath, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE  $tblWatchlist (
        id INTEGER PRIMARY KEY,
        title TEXT,
        overview TEXT,
        posterPath TEXT
      );
    ''');

    await db.execute('''
      CREATE TABLE  $tblWatchlistTVSeries (
        id INTEGER PRIMARY KEY,
        title TEXT,
        overview TEXT,
        posterPath TEXT
      );
    ''');
  }

  Future<int> insertWatchlist(MovieTable movie) async {
    final db = await database;
    return await db!.insert(tblWatchlist, movie.toJson());
  }

  Future<int> insertWatchlistTVSeries(TVLocalDatabaseModel tv) async {
    final db = await database;
    final result = await db!.insert(tblWatchlistTVSeries, tv.toJson());
    return result;
  }

  Future<int> removeWatchlist({
    required int id,
    String table = tblWatchlist,
  }) async {
    final db = await database;
    return await db!.delete(
      table,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<Map<String, dynamic>?> getDataById({
    required int id,
    String table = tblWatchlist,
  }) async {
    final db = await database;
    final results = await db!.query(
      table,
      where: 'id = ?',
      whereArgs: [id],
    );

    if (results.isNotEmpty) {
      return results.first;
    } else {
      return null;
    }
  }

  Future<List<Map<String, dynamic>>> getWatchlist({
    String table = tblWatchlist,
  }) async {
    final db = await database;
    final List<Map<String, dynamic>> results = await db!.query(table);

    return results;
  }
}
