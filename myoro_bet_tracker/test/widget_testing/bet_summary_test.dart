// ignore_for_file: deprecated_member_use

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myoro_bet_tracker/database.dart';
import 'package:myoro_bet_tracker/widgets/headers/header_with_checkbox.dart';
import 'package:myoro_bet_tracker/widgets/outputs/bet_summary.dart';

import '../base_test_widget.dart';

void main() {
  setUp(() async {
    const MethodChannel('plugins.flutter.io/path_provider').setMockMethodCallHandler((MethodCall methodCall) async {
      if(methodCall.method == 'getApplicationSupportDirectory') return '.';
    });
    await Database.init();
  });

  testWidgets('BetSummary Widget Test', (tester) async {
    await tester.pumpWidget(
      const BaseTestWidget(
        title: 'BetSummary Widget Test',
        child: BetSummary()
      )
    );

    expect(find.byType(HeaderWithCheckbox), findsOneWidget);
    expect(find.text('Show Bet Summary'), findsOneWidget);
    expect(find.text('Total \$ Placed:'), findsOneWidget);
    expect(find.text('Total \$ Gained or Lost:'), findsOneWidget);
    expect(find.text('Available Income:'), findsOneWidget);
  });
}