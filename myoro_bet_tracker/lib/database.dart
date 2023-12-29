import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class Database {
  static late sqflite.Database _db;
  static final Database _singletonInstance = Database._internal();

  factory Database() => _singletonInstance;

  Database._internal();

  static Future<void> init() async {
    if(!Platform.isIOS && !Platform.isAndroid) sqflite.databaseFactory = databaseFactoryFfi;
    _db = await sqflite.openDatabase(join((await getApplicationSupportDirectory()).path, "myoro_bet_tracker.db"));

    _db.execute('CREATE TABLE IF NOT EXISTS dark_mode(id INTEGER PRIMARY KEY, enabled INTEGER);');
    final Map<String, Object?> row = await get('dark_mode');
    if(row.isEmpty) insert('dark_mode', { 'enabled': 1 });

    _db.execute('CREATE TABLE IF NOT EXISTS bet(id INTEGER PRIMARY KEY AUTOINCREMENT, placed TEXT, won TEXT);');
  }

  static Future<List<Map<String, Object?>>> select(
    String table,
    {
      List<String>? columns,
      String? where,
      List<String>? whereArgs,
    }
  ) async => await _db.query(table, columns: columns, where: where, whereArgs: whereArgs); 

  static Future<Map<String, Object?>> get(
    String table,
    {
      List<String>? columns,
      String? where,
      List<String>? whereArgs,
    }
  ) async {
    final List<Map<String, Object?>> result = await select(table, columns: columns, where: where, whereArgs: whereArgs);
    return result.isEmpty ? {} : result[0];
  }

  static Future<void> insert(String table, Map<String, Object?> data) async => await _db.insert(table, data);

  static Future<void> delete(
    String table,
    {
      String? where,
      List<Object?>? whereArgs
    }
  ) async => await _db.delete(table, where: where, whereArgs: whereArgs);
}