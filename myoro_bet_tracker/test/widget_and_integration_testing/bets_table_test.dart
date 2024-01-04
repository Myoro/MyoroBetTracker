// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myoro_bet_tracker/database.dart';
import 'package:myoro_bet_tracker/widgets/headers/header_with_checkbox.dart';
import 'package:myoro_bet_tracker/widgets/tables/bets_table.dart';

import '../base_test_widget.dart';

void main() {
  setUp(() async {
    const MethodChannel('plugins.flutter.io/path_provider').setMockMethodCallHandler((MethodCall methodCall) async {
      if(methodCall.method == 'getApplicationSupportDirectory') return '.';
    });
    await Database.init();
  });

  testWidgets('BetsTable Widget Test', (tester) async {
    await tester.pumpWidget(
      const BaseTestWidget(
        title: 'BetsTable Widget Test',
        child: BetsTable()
      )
    );

    expect(find.byType(HeaderWithCheckbox), findsOneWidget);
    expect(find.text('Bets Table'), findsNWidgets(2));
    expect(find.byType(Table), findsOneWidget);
  });
}