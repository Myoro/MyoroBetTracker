import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myoro_bet_tracker/widgets/app_bars/home_screen_app_bar.dart';
import 'package:myoro_bet_tracker/widgets/buttons/button_without_feedback.dart';

import '../../base_test_widget.dart';

void main() {
  testWidgets('HomeScreenAppBar Widget Test', (tester) async {
    await tester.pumpWidget(
      const BaseTestWidget(
        widgetTestType: WidgetTestType.appBar,
        child: HomeScreenAppBar(),
      ),
    );

    expect(find.text('Bet Tracker'), findsOneWidget);
    expect(find.byType(ButtonWithoutFeedback), findsNWidgets(3));
    expect(find.byIcon(Icons.attach_money), findsOneWidget);
    expect(find.byIcon(Icons.add), findsOneWidget);
    expect(find.byIcon(Icons.sunny), findsOneWidget);
  });
}
