import 'dart:async';
import 'package:melody_spin/Models/MovieModel.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class MyDatabase {
  static Database? _database;

  static Future<Database> get database async {
    if (_database != null) return _database!;

    // If _database is null, we need to initialize it
    _database = await initDatabase();
    return _database!;
  }

  static Future<Database> initDatabase() async {
    String path = await getDatabasesPath();
    String myDbPath = join(path, "melodySpin.db");
    Database myDatabase = await openDatabase(myDbPath, version: 1, onCreate: onCreateFunction);
    return myDatabase;
  }

  static Future<void> onCreateFunction(Database db, int version) async {
    await db.execute('''
      CREATE TABLE movies (
        id INTEGER PRIMARY KEY,
        title TEXT,
        poster_path TEXT,
        popularity REAL,
        video INTEGER,
        release_date TEXT,
        backdrop_path TEXT,
        vote_average REAL
      )
    ''');
  }

  /////////////////////// Using Database //////////////////////////////

  static Future<void> insertMovie(MovieModel movie) async {
    final db = await database;
    await db.insert(
      'movies',
      {
        'id': movie.id,
        'title': movie.title,
        'poster_path': movie.poster_path,
        'popularity': movie.popularity,
        'video': movie.video == true ? 1 : 0,
        'release_date': movie.release_date,
        'backdrop_path': movie.backdrop_path,
        'vote_average': movie.vote_average,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    print("insert movie");
  }

  static Future<List<Map<String, dynamic>>> getAllMovies() async {
    final db = await database;
    return await db.query('movies');
  }

  static Future<void> deleteMovie(int id) async {
    final db = await database;
    await db.delete(
      'movies',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
