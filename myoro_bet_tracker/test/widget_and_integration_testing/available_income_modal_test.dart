import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myoro_bet_tracker/widgets/buttons/icon_and_text_hover_button.dart';
import 'package:myoro_bet_tracker/widgets/inputs/input_form.dart';
import 'package:myoro_bet_tracker/widgets/modals/available_income_modal.dart';

import '../base_test_widget.dart';

void main() {
  testWidgets('AvailableIncomeModal Widget Test', (tester) async {
    await tester.pumpWidget(
      BaseTestWidget(
        title: 'AvailableIncomeModal Widget Test',
        child: Builder(
          builder: (context) {
            return GestureDetector(
              onTap: () => showDialog(
                context: context,
                builder: (context) => const AvailableIncomeModal()
              )
            );
          }
        )
      )
    );
    await tester.tap(find.byType(GestureDetector));
    await tester.pump();

    expect(find.byType(AvailableIncomeModal), findsOneWidget);
    expect(find.text('Set Available Income'), findsOneWidget);
    expect(find.byType(InputForm), findsOneWidget);
    expect(find.byType(IconAndTextHoverButton), findsNWidgets(2));
  });
}