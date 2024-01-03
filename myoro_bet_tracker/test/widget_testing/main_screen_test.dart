import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myoro_bet_tracker/screens/main_screen.dart';
import 'package:myoro_bet_tracker/widgets/buttons/icon_and_text_hover_button.dart';

import '../base_test_widget.dart';

void main() {
  testWidgets('MainScreen Widget Test', (tester) async {
    await tester.pumpWidget(
      const BaseTestWidget(
        title: 'MainScreen Widget Test',
        screenTest: true,
        child: MainScreen()
      )
    );

    expect(find.text('MyoroBetTracker'), findsOneWidget);
    expect(find.byIcon(Icons.sunny), findsOneWidget);
    expect(find.byType(IconAndTextHoverButton), findsNWidgets(2));
    expect(find.text('Available Income:'), findsOneWidget);
    expect(find.text('\$0.00'), findsOneWidget);
  });
}