// ignore_for_file: deprecated_member_use

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myoro_bet_tracker/database.dart';
import 'package:myoro_bet_tracker/widgets/graphs/bets_graph.dart';
import 'package:myoro_bet_tracker/widgets/headers/header_with_checkbox.dart';
import 'package:myoro_bet_tracker/widgets/inputs/basic_dropdown.dart';

import '../base_test_widget.dart';

void main() {
  setUp(() async {
    const MethodChannel('plugins.flutter.io/path_provider').setMockMethodCallHandler((MethodCall methodCall) async {
      if(methodCall.method == 'getApplicationSupportDirectory') return '.';
    });
    await Database.init();
  });

  testWidgets('BetsGraph Widget Test', (tester) async {
    await tester.pumpWidget(
      const BaseTestWidget(
        title: 'BetsGraph Widget Test',
        child: BetsGraph()
      )
    );

    expect(find.byType(LineChart), findsOneWidget);
    expect(find.text('Gained/Lost'), findsOneWidget);
    expect(find.text('Sport'), findsOneWidget);
    expect(find.byType(HeaderWithCheckbox), findsOneWidget);
    expect(find.text('Performance Chart'), findsOneWidget);
    expect(find.text('Show Performance Chart'), findsOneWidget);
    expect(find.byType(BasicDropdown), findsOneWidget);
  });
}