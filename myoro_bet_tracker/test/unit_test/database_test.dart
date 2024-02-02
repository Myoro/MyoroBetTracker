// ignore_for_file: deprecated_member_use

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myoro_bet_tracker/database.dart';
import 'package:myoro_bet_tracker/models/bet_model.dart';

import '../constants/bet_model_constants.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    const MethodChannel('plugins.flutter.io/path_provider').setMockMethodCallHandler((MethodCall methodCall) async {
      if(methodCall.method == 'getApplicationSupportDirectory') return '.';
    });
    await Database.init();
  });

  test('Database::init & Database::resetDatabase', () async {
    await Database.reset();
    await Database.init();
  });

  test('Database::select', () async {
    final List<Map<String, Object?>> rows = await Database.select('dark_mode');
    expect(rows.length, 1);
  });

  test('Database::get', () async {
    final Map<String, Object?> row = await Database.get('dark_mode');
    expect(row.entries.length, 2);
  });

  test('Database::insert', () async {
    await Database.insert('bets', BetModelConstants.bet1.toJSON());
    expect((await Database.get('bets')).isNotEmpty, true);
  });

  test('Database::update', () async {
    Map<String, Object?> row;

    await Database.insert('bets', BetModelConstants.bet1.toJSON());
    row = await Database.get('bets');
    expect(BetModel.fromJSON(row), BetModelConstants.bet1);

    await Database.update('bets', BetModelConstants.bet2.toJSON(), BetModelConstants.bet1.toJSON());
    row = await Database.get('bets');
    expect(BetModel.fromJSON(row), BetModelConstants.bet2);
  });

  test('Database::delete', () async {
    Map<String, Object?> row;

    await Database.insert('bets', BetModelConstants.bet1.toJSON());
    row = await Database.get('bets');
    expect(row.isNotEmpty, true);

    await Database.delete('bets');
    row = await Database.get('bets');
    expect(row.isEmpty, true);
  });

  test('Database::formatConditions', () => expect(
    Database.formatConditions(BetModelConstants.bet1.toJSON()),
    BetModelConstants.bet1ConditionsFormatted,
  ));
}