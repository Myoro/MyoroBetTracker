import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myoro_bet_tracker/widgets/buttons/icon_and_text_hover_button.dart';
import 'package:myoro_bet_tracker/widgets/inputs/basic_input.dart';
import 'package:myoro_bet_tracker/widgets/inputs/dropdown_form.dart';
import 'package:myoro_bet_tracker/widgets/inputs/input_form.dart';
import 'package:myoro_bet_tracker/widgets/modals/add_bet_modal.dart';

import '../base_test_widget.dart';

void main() {
  testWidgets('AddBetModal Widget Test', (tester) async {
    await tester.pumpWidget(
      BaseTestWidget(
        title: 'AddBetModal Widget Test',
        child: Builder(
          builder: (context) => GestureDetector(
            onTap: () => showDialog(
              context: context,
              builder: (context) => const AddBetModal()
            )
          )
        )
      )
    );
    await tester.tap(find.byType(GestureDetector));
    await tester.pump();

    expect(find.byType(AddBetModal), findsOneWidget);
    expect(find.text('Add Bet'), findsNWidgets(2));
    expect(find.byType(InputForm), findsNWidgets(3));
    expect(find.byType(DropdownForm), findsOneWidget);
    expect(find.text('Bet Name'), findsOneWidget);
    expect(find.text('Sport(?):'), findsOneWidget);
    expect(find.text('Soccer'), findsOneWidget);
    expect(find.text('\$ Placed*:'), findsOneWidget);
    expect(find.text('\$ Placed'), findsOneWidget);
    expect(find.text('Lost*'), findsOneWidget);
    expect(find.text('Bet Lost'), findsOneWidget);
    expect(find.byType(IconAndTextHoverButton), findsNWidgets(2));

    await tester.tap(
      find.byWidgetPredicate(
        (widget) => (
          widget is DropdownMenuItem<String>
          &&
          widget.value == 'Lost*'
        )
      )
    );
    await tester.pump();
    await tester.tap(
      find.byWidgetPredicate(
        (widget) => (
          widget is DropdownMenuItem<String>
          &&
          widget.value == 'Gained*'
        )
      )
    );
    await tester.pump();
    expect(find.byType(BasicInput), findsNWidgets(3));
  });
}