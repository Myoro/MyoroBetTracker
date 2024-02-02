import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myoro_bet_tracker/widgets/buttons/button_without_feedback.dart';
import 'package:myoro_bet_tracker/widgets/buttons/text_hover_button.dart';
import 'package:myoro_bet_tracker/widgets/modals/base_modal.dart';

import '../../base_test_widget.dart';

void main() {
  testWidgets('BaseModal Widget Test', (tester) async {
    await tester.pumpWidget(
      BaseTestWidget(
        child: BaseModal(
          title: 'Title Working',
          size: const Size(300, 400),
          showFooterButtons: true,
          yesOnTap: () {},
          yesText: 'Yes Text Working',
          content: const Text('Content Working'),
        ),
      ),
    );

    expect(find.byType(BaseModal), findsOneWidget);
    expect(find.text('Title Working'), findsOneWidget);
    expect(find.text('Content Working'), findsOneWidget);
    expect(find.byType(ButtonWithoutFeedback), findsOneWidget);
    expect(find.byIcon(Icons.close), findsOneWidget);
    expect(find.byType(TextHoverButton), findsNWidgets(2));
    expect(find.text('Yes Text Working'), findsOneWidget);
    expect(find.text('Cancel'), findsOneWidget);
  });
}