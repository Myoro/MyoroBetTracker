import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myoro_bet_tracker/widgets/inputs/base_text_field.dart';
import 'package:myoro_bet_tracker/widgets/modals/available_income_modal.dart';

import '../../base_test_widget.dart';

void main() {
  testWidgets('AvailableIncomeModal Widget Test', (tester) async {
    await tester.pumpWidget(
      BaseTestWidget(
        child: Builder(
          builder: (context) => GestureDetector(
            onTap: () => AvailableIncomeModal.show(context),
          ),
        ),
      ),
    );
    await tester.tap(find.byType(GestureDetector));
    await tester.pump();

    expect(find.byType(AvailableIncomeModal), findsOneWidget);
    expect(find.text('Set Available Income'), findsOneWidget);
    expect(find.text('Save'), findsOneWidget);
    expect(find.text('Cancel'), findsOneWidget);
    expect(find.text('\$'), findsOneWidget);
    expect(find.byType(BaseTextField), findsOneWidget);
    expect(find.text('Blank Field'), findsNothing);
  });
}