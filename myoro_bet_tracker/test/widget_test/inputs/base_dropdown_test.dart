import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myoro_bet_tracker/widgets/inputs/base_dropdown.dart';

import '../../base_test_widget.dart';

void main() {
  testWidgets('BaseDropdown Widget Test', (tester) async {
    await tester.pumpWidget(
      BaseTestWidget(
        child: BaseDropdown(
          items: const [ 'This', 'is', 'a', 'test' ],
          onChanged: (_) {},
        ),
      ),
    );

    expect(find.byType(DropdownButton<String>), findsOneWidget);
    expect(find.byType(DropdownMenuItem<String>), findsOneWidget);
    expect(find.text('This'), findsOneWidget);
    await tester.tap(find.text('This'));
    await tester.pump();
    expect(find.byType(DropdownMenuItem<String>), findsNWidgets(5));
    await tester.tap(find.text('test'));
    await tester.pump();
  });
}