// ignore_for_file: curly_braces_in_flow_control_structures

import "dart:io";
import "package:path/path.dart";
import "package:path_provider/path_provider.dart";
import "package:sqflite/sqflite.dart" as sqflite;
import "package:sqflite_common_ffi/sqflite_ffi.dart";


class Database {
  late sqflite.Database _db;
  static final Database _singletonInstance = Database._internal();

  factory Database() => _singletonInstance;

  Database._internal();

  Future<String> getDatabasePath() async {
    Directory applicationRootDirectory;

    if(Platform.isAndroid || Platform.isIOS)
      applicationRootDirectory = await getApplicationDocumentsDirectory();
    else
      applicationRootDirectory = await getApplicationSupportDirectory();

    return join(applicationRootDirectory.path, "myoro_bet_tracker.db");
  }

  Future<void> init() async {
    if(!Platform.isAndroid && !Platform.isIOS)
      sqflite.databaseFactory = databaseFactoryFfi;

    _db = await sqflite.openDatabase(await getDatabasePath());

    // dark_mode
    await _db.execute('''
      CREATE TABLE IF NOT EXISTS dark_mode(
        id      INTEGER PRIMARY KEY,
        enabled INTEGER
      );
    ''');
    final Map<String, Object?> row = await get("dark_mode");
    if(row.isEmpty)
      insert("dark_mode", { "enabled": 1 });

    // bets
    await _db.execute('''
      CREATE TABLE IF NOT EXISTS bets(
        id      INTEGER PRIMARY KEY AUTOINCREMENT,
        placed  TEXT,
        gained  TEXT,
        bet_won INTEGER
      );
    ''');
  }

  Future<void> resetDatabase() async {
    if(!Platform.isAndroid && !Platform.isIOS)
      sqflite.databaseFactory = databaseFactoryFfi;
    await sqflite.deleteDatabase(await getDatabasePath());
  }

  Future<List<Map<String, Object?>>> select(String table, [Map<String, dynamic>? conditions]) async {
    // Make strings of conditions (where & whereArgs)
    final List<Map<String, Object?>> rows = await _db.query(table);
    return rows;
  }

  Future<Map<String, Object?>> get(String table, [Map<String, dynamic>? conditions]) async {
    final List<Map<String, Object?>> row = await select(table, conditions);
    if(row.isEmpty)
      return {};
    else
      return row[0];
  }

  Future<void> insert(String table, Map<String, dynamic> data) async => await _db.insert(table, data);

  Future<void> update(String table, String attribute, dynamic data, [Map<String, dynamic>? conditions]) async {
    await _db.update(
      table,
      { attribute: data },
      where: (conditions != null) ? "${conditions.keys.first} = ${conditions.values.first}" : null
    );
  }

  Future<void> delete(String table, int index) async {
    await _db.delete(table, where: "id = $index");
  }
}