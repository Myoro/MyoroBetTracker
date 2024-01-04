import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myoro_bet_tracker/widgets/inputs/basic_dropdown.dart';

import '../base_test_widget.dart';

void main() {
  final List<String> dropdownValues = [ 'Basic', 'Dropdown' ];
  String? testOnTap;

  testWidgets('BasicDropdown Widget Test', (tester) async {
    await tester.pumpWidget(
      BaseTestWidget(
        title: 'BasicDropdown Widget Test',
        child: BasicDropdown(
          items: dropdownValues,
          onChanged: (value) => testOnTap = value
        )
      )
    );

    expect(find.byType(DropdownButton<String>), findsOneWidget);
    expect(find.byType(DropdownMenuItem<String>), findsOneWidget);
    expect(find.text('Basic'), findsOneWidget);
    await tester.tap(find.byType(DropdownMenuItem<String>));
    await tester.pump();
    expect(find.byType(DropdownMenuItem<String>), findsNWidgets(3));
    await tester.tap(
      find.byWidgetPredicate(
        (widget) => (
          widget is DropdownMenuItem<String>
          &&
          widget.value == dropdownValues[1]
        )
      )
    );
    await tester.pump();
    expect(testOnTap, 'Dropdown');
    expect(find.byType(DropdownMenuItem<String>), findsOneWidget);
    expect(
      find.byWidgetPredicate(
        (widget) => (
          widget is DropdownMenuItem<String>
          &&
          widget.value == dropdownValues[1]
        )
      ),
      findsOneWidget
    );
  });
}