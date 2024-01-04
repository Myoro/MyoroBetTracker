import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myoro_bet_tracker/widgets/headers/header_with_checkbox.dart';

import '../base_test_widget.dart';

void main() {
  bool? testOnTap;

  testWidgets('HeaderWithCheckbox Widget Test', (tester) async {
    await tester.pumpWidget(
      BaseTestWidget(
        title: 'HeaderWithCheckbox Widget Test',
        child: HeaderWithCheckbox(
          title: 'Working',
          onChanged: (value) => testOnTap = value
        )
      )
    );

    expect(find.byType(Text), findsNWidgets(2));
    expect(find.byType(Checkbox), findsOneWidget);
    expect(find.text('Working'), findsOneWidget);
    expect(find.text('Show Working'), findsOneWidget);
    await tester.tap(find.byType(Checkbox));
    expect(testOnTap, isFalse);
  });
}