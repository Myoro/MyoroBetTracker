import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myoro_bet_tracker/widgets/modals/basic_modal.dart';

import '../base_test_widget.dart';

void main() {
  testWidgets('BasicModal Widget Test', (tester) async {
    await tester.pumpWidget(
      BaseTestWidget(
        title: 'BasicModal Widget Test',
        child: Builder(
          builder: (context) {
            return GestureDetector(
              onTap: () => showDialog(
                context: context,
                builder: (context) => const BasicModal(
                  title: 'Modal Title Working',
                  width: 300,
                  body: Text('Modal Body Working')
                )
              )
            );
          }
        )
      )
    );
    await tester.tap(find.byType(GestureDetector));
    await tester.pump();

    expect(find.byType(BasicModal), findsOneWidget);
    expect(find.text('Modal Title Working'), findsOneWidget);
    expect(find.text('Modal Body Working'), findsOneWidget);
  });
}