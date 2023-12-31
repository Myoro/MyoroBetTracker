// ignore_for_file: curly_braces_in_flow_control_structures

import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class Database {
  static late sqflite.Database _database;
  static final Database _singletonInstance = Database._internal();

  factory Database() => _singletonInstance;
  Database._internal();

  static Future<String> getDatabasePath() async => join(
    (await getApplicationSupportDirectory()).path,
    'myoro_bet_tracker.db'
  );

  static Future<void> init() async {
    if(!Platform.isIOS && !Platform.isAndroid)
      sqflite.databaseFactory = databaseFactoryFfi;

    _database = await sqflite.openDatabase(await getDatabasePath());

    // Dark mode table
    await _database.execute('CREATE TABLE IF NOT EXISTS dark_mode(id INTEGER PRIMARY KEY, enabled INTEGER);');
    if((await get('dark_mode')).isEmpty) _database.insert('dark_mode', { 'enabled': 1 });

    // Bets table
    await _database.execute('''
      CREATE TABLE IF NOT EXISTS bets(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name           TEXT,
        sport          TEXT,
        placed         TEXT,
        gained_or_lost TEXT,
        date_placed    TEXT
      );
    ''');

    // Available income table
    await _database.execute('''
      CREATE TABLE IF NOT EXISTS available_income(
        id INTEGER PRIMARY KEY,
        income             TEXT
      );
    ''');
    if((await get('available_income')).isEmpty) insert('available_income', { 'income': '0' });

    // Widgets to display on startup
    await _database.execute('''
      CREATE TABLE IF NOT EXISTS show(
        id                     INTEGER PRIMARY KEY,
        show_performance_chart INTEGER,
        show_bets_table        INTEGER,
        show_bet_summary       INTEGER
      );
    ''');
    if((await get('show')).isEmpty) insert('show', { 'show_performance_chart': 1, 'show_bets_table': 1, 'show_bet_summary': 1 });
  }

  static Future<void> reset() async {
    await sqflite.deleteDatabase(await getDatabasePath());
    await _database.close();
    await init();
  }

  static Future<List<Map<String, Object?>>> select(String table) async => await _database.query(table);

  static Future<Map<String, Object?>> get(String table) async {
    final List<Map<String, Object?>> rows = await select(table);
    return rows.isEmpty ? {} : rows[0];
  }

  static Future<void> insert(String table, Map<String, Object?> data) async => await _database.insert(table, data);

  static Future<void> update(String table, Map<String, Object?> values) async => await _database.update(table, values);

  static Future<void> delete(
    String table,
    {
      required String where,
      required List<Object?> whereArgs
    }
  ) async => await _database.delete(table, where: where, whereArgs: whereArgs);
}