import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myoro_bet_tracker/widgets/buttons/icon_and_text_hover_button.dart';
import 'package:myoro_bet_tracker/widgets/modals/confirmation_modal.dart';

import '../base_test_widget.dart';
import '../bet_model_constants.dart';

void main() {
  testWidgets('ConfirmationModal Widget Test', (tester) async {
    await tester.pumpWidget(
      BaseTestWidget(
        title: 'ConfirmationModal Widget Test',
        child: Builder(
          builder: (context) {
            return GestureDetector(
              onTap: () => showDialog(
                context: context,
                builder: (context) => ConfirmationModal(bet: BetModelConstants.betModel)
              )
            );
          }
        )
      )
    );
    await tester.tap(find.byType(GestureDetector));
    await tester.pump();

    expect(find.byType(ConfirmationModal), findsOneWidget);
    expect(find.text('Delete Bet'), findsOneWidget);
    expect(find.text('Are you sure you want to delete this bet?'), findsOneWidget);
    expect(find.byType(IconAndTextHoverButton), findsNWidgets(2));
    expect(find.text('Yes'), findsOneWidget);
    expect(find.text('Cancel'), findsOneWidget);
  });
}