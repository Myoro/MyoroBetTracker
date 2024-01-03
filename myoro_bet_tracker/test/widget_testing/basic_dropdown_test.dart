import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myoro_bet_tracker/widgets/inputs/basic_dropdown.dart';

import '../base_test_widget.dart';

void main() {
  String? testOnTap;

  testWidgets('BasicDropdown Widget Test', (tester) async {
    await tester.pumpWidget(
      BaseTestWidget(
        title: 'BasicDropdown Widget Test',
        child: BasicDropdown(
          items: const [ 'Basic', 'Dropdown', 'Test' ],
          onChanged: (value) => testOnTap = value
        )
      )
    );

    expect(find.byType(DropdownButton<String>), findsOneWidget);
    expect(find.byType(DropdownMenuItem<String>), findsOneWidget);
    expect(find.text('Basic'), findsOneWidget);
    await tester.tap(find.byType(DropdownMenuItem<String>));
    expect(find.byType(DropdownMenuItem<String>), findsNWidgets(3));
  });
}