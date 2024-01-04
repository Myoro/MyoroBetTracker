// ignore_for_file: deprecated_member_use, curly_braces_in_flow_control_structures

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myoro_bet_tracker/database.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    const MethodChannel('plugins.flutter.io/path_provider').setMockMethodCallHandler(
      (MethodCall methodCall) async {
        if(methodCall.method == 'getApplicationSupportDirectory')
          return '.';
      }
    );
  });

  test('init and resetDatabase', () async {
    await Database.init();
    expect((await Database.get('dark_mode'))['enabled'], 1); 
    expect(await Database.get('bets'), isEmpty);
    expect((await Database.get('available_income'))['income'], '0');
    expect(
      await Database.get('show'),
      {
        'id':                     1,
        'show_performance_chart': 1,
        'show_bets_table':        1,
        'show_bet_summary':       1
      }
    );
    await Database.reset();
  });
}