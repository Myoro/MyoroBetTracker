// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myoro_bet_tracker/widgets/inputs/dropdown_form.dart';

import '../base_test_widget.dart';

void main() {
  final List<String> dropdownValues = [ 'Dropdown', 'Form' ];
  testWidgets('DropdownForm Widget Test', (tester) async {
    await tester.pumpWidget(
      BaseTestWidget(
        title: 'DropdownForm Widget Test',
        child: Column(
          children: [
            DropdownForm(
              title: 'Dropdown #1 Working',
              dropdownItems: dropdownValues,
              onChanged: () {},
              expanded: true,
              dropdownExpanded: true
            ),
            DropdownForm(
              title: 'Dropdown #2 Working',
              dropdownItems: dropdownValues,
              onChanged: () {},
              textExpanded: true
            ),
            DropdownForm(
              title: 'Dropdown #3 Working',
              dropdownItems: dropdownValues,
              onChanged: () {},
              expanded: true,
              textExpanded: true,
              dropdownExpanded: true
            )
          ]
        )
      )
    );

    expect(find.byType(DropdownForm), findsNWidgets(3));
    for(int i = 0; i < 3; i++) expect(find.text('Dropdown #${i + 1} Working:'), findsOneWidget);
  });
}