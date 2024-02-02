import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myoro_bet_tracker/widgets/inputs/basic_dropdown_form.dart';
import 'package:myoro_bet_tracker/widgets/inputs/basic_text_field_form.dart';
import 'package:myoro_bet_tracker/widgets/inputs/dropdown_and_text_field_form.dart';
import 'package:myoro_bet_tracker/widgets/modals/bet_form_modal.dart';

import '../../base_test_widget.dart';

void main() {
  testWidgets('BetFormModal Widget Test', (tester) async {
    await tester.pumpWidget(
      BaseTestWidget(
        child: Builder(
          builder: (context) => GestureDetector(
            onTap: () => BetFormModal.show(context),
          ),
        ),
      ),
    );
    await tester.tap(find.byType(GestureDetector));
    await tester.pump();

    expect(find.text('Create Bet'), findsOneWidget);
    expect(find.text('Create'), findsOneWidget);
    expect(find.byType(BasicTextFieldForm), findsNWidgets(3));
    expect(find.byType(BasicDropdownForm), findsOneWidget);
    expect(find.byType(DropdownAndTextFieldForm), findsOneWidget);
    expect(find.text('Bet Incomplete'), findsNothing);
  });
}