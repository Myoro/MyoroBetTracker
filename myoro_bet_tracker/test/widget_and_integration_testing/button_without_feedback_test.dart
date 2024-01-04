// button without feedback
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myoro_bet_tracker/widgets/buttons/button_without_feedback.dart';

import '../base_test_widget.dart';

void main() {
  testWidgets('ButtonWithoutFeedback Widget Test', (tester) async {
    await tester.pumpWidget(
      BaseTestWidget(
        title: 'ButtonWithoutFeedback Widget Test',
        child: ButtonWithoutFeedback(
          onTap: () {},
          child: const Icon(Icons.abc)
        )
      )
    );

    expect(find.byType(ButtonWithoutFeedback), findsOneWidget);
    expect(find.byIcon(Icons.abc), findsOneWidget);
  });
}