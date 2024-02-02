import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myoro_bet_tracker/widgets/buttons/button_without_feedback.dart';

import '../../base_test_widget.dart';

void main() {
  testWidgets('ButtonWithoutFeedback Widget Test', (tester) async {
    await tester.pumpWidget(
      BaseTestWidget(
        child: ButtonWithoutFeedback(
          onTap: () {},
          child: const Text('Working'),
        ),
      ),
    );

    expect(find.text('Working'), findsOneWidget);
  });
}
