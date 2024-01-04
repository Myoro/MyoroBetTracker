import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myoro_bet_tracker/widgets/buttons/button_without_feedback.dart';
import 'package:myoro_bet_tracker/widgets/top_bars/main_screen_top_bar.dart';

import '../base_test_widget.dart';

void main() {
  testWidgets('MainScreenTopBar Widget Test', (tester) async {
    await tester.pumpWidget(
      const BaseTestWidget(
        title: 'MainScreenTopBar Widget Test',
        topBarTest: true,
        child: MainScreenTopBar()
      )
    );

    expect(find.byType(MainScreenTopBar), findsOneWidget);
    expect(find.text('MyoroBetTracker'), findsOneWidget);
    expect(find.byType(ButtonWithoutFeedback), findsOneWidget);
    expect(find.byIcon(Icons.sunny), findsOneWidget);
  });
}