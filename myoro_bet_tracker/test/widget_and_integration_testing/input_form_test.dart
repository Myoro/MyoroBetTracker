// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myoro_bet_tracker/widgets/inputs/basic_dropdown.dart';
import 'package:myoro_bet_tracker/widgets/inputs/basic_input.dart';
import 'package:myoro_bet_tracker/widgets/inputs/input_form.dart';

import '../base_test_widget.dart';

void main() {
  testWidgets('InputForm Widget Test', (tester) async {
    await tester.pumpWidget(
      const BaseTestWidget(
        title: 'InputForm Widget Test',
        child: Row(
          children: [
            InputForm(
              title: 'InputForm Working',
              hintText: 'Hint Text Working',
              expanded: true,
              titleExpanded: true,
              inputExpanded: true
            ),
            InputForm(
              title: '',
              expanded: true,
              titleExpanded: true,
              showInput: false,
              dropdownTitle: true
            )
          ],
        )
      )
    );

    expect(find.byType(InputForm), findsNWidgets(2));
    expect(find.text('InputForm Working:'), findsOneWidget);
    expect(find.text('Hint Text Working'), findsOneWidget);
    expect(find.byType(BasicInput), findsOneWidget);
    expect(find.byType(BasicDropdown), findsOneWidget);
    expect(find.text('Missing items'), findsOneWidget);
  });
}