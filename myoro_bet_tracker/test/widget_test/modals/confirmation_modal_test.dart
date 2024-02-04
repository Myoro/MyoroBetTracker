import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myoro_bet_tracker/widgets/modals/base_modal.dart';
import 'package:myoro_bet_tracker/widgets/modals/confirmation_modal.dart';

import '../../base_test_widget.dart';

void main() {
  testWidgets('ConfirmationModal Widget Test', (tester) async {
    await tester.pumpWidget(
      BaseTestWidget(
        child: Builder(
          builder: (context) => GestureDetector(
            onTap: () => ConfirmationModal.show(
              context,
              title: 'Title Working',
              message: 'Message Working',
              yesOnTap: () {},
            ),
          ),
        ),
      ),
    );
    await tester.tap(find.byType(GestureDetector));
    await tester.pump();

    expect(find.byType(BaseModal), findsOneWidget);
    expect(find.text('Title Working'), findsOneWidget);
    expect(find.text('Message Working'), findsOneWidget);
    expect(find.text('Yes'), findsOneWidget);
    expect(find.text('Cancel'), findsOneWidget);
  });
}
