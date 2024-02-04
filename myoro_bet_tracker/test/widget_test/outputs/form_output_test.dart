import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myoro_bet_tracker/widgets/outputs/form_output.dart';

import '../../base_test_widget.dart';

void main() {
  testWidgets('FormOutput Widget Test', (tester) async {
    await tester.pumpWidget(
      const BaseTestWidget(
        child: FormOutput(
          title: 'Title Working',
          information: 'Information Working',
        ),
      ),
    );

    expect(find.byType(Column), findsOneWidget);
    expect(find.byType(Text), findsNWidgets(2));
    expect(find.byType(SizedBox), findsOneWidget);
    expect(find.text('Title Working'), findsOneWidget);
    expect(find.text('Information Working'), findsOneWidget);
  });
}
