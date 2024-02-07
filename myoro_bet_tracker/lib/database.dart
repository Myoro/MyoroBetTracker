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

  static Future<String> getDatabasePath() async => join((await getApplicationSupportDirectory()).path, 'myoro_bet_tracker.db');

  static Future<void> init() async {
    if (!Platform.isIOS && !Platform.isAndroid) sqflite.databaseFactory = databaseFactoryFfi;

    _database = await sqflite.openDatabase(await getDatabasePath());

    // Dark mode table
    await _database.execute('CREATE TABLE IF NOT EXISTS dark_mode(id INTEGER PRIMARY KEY, enabled INTEGER);');
    if ((await get('dark_mode')).isEmpty) _database.insert('dark_mode', {'enabled': 2}); // 0 = light mode, 1 = dark mode, 2 = system

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
    if ((await get('available_income')).isEmpty) insert('available_income', {'income': '0'});
  }

  static Future<void> reset() async {
    await sqflite.deleteDatabase(await getDatabasePath());
    await _database.close();
    await init();
  }

  static Future<List<Map<String, Object?>>> select(String table, [Map<String, Object?>? conditions]) async {
    final Map<String, dynamic>? formattedConditions = formatConditions(conditions);

    return await _database.query(
      table,
      where: formattedConditions != null ? formattedConditions['where'] : null,
      whereArgs: formattedConditions != null ? formattedConditions['where_args'] : null,
    );
  }

  static Future<Map<String, Object?>> get(String table, [Map<String, Object?>? conditions]) async {
    final List<Map<String, Object?>> rows = await select(table, conditions);
    return rows.isEmpty ? {} : rows[0];
  }

  static Future<void> insert(String table, Map<String, Object?> data) async {
    if ((await get('bets', {'name': data['name']})).isNotEmpty) return;
    await _database.insert(table, data);
  }

  static Future<void> update(String table, Map<String, Object?> values, [Map<String, Object?>? conditions]) async {
    final Map<String, dynamic>? formattedConditions = formatConditions(conditions);

    await _database.update(
      table,
      values,
      where: formattedConditions != null ? formattedConditions['where'] : null,
      whereArgs: formattedConditions != null ? formattedConditions['where_args'] : null,
    );
  }

  static Future<void> delete(String table, [Map<String, Object?>? conditions]) async {
    final Map<String, dynamic>? formattedConditions = formatConditions(conditions);

    await _database.delete(
      table,
      where: formattedConditions != null ? formattedConditions['where'] : null,
      whereArgs: formattedConditions != null ? formattedConditions['where_args'] : null,
    );
  }

  static Map<String, dynamic>? formatConditions(Map<String, Object?>? conditions) {
    if (conditions == null) return null;

    final List<MapEntry> conditionsList = conditions.entries.toList();
    String where = '';
    final List<Object?> whereArgs = [];
    for (final MapEntry entry in conditionsList) {
      where += '${entry.key} = ?${conditionsList.indexOf(entry) != conditionsList.length - 1 ? ' AND ' : ''}';
      whereArgs.add(entry.value);
    }

    return {'where': where, 'where_args': whereArgs};
  }
}
