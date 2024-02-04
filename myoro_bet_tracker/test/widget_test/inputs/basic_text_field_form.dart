import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myoro_bet_tracker/widgets/inputs/base_text_field.dart';
import 'package:myoro_bet_tracker/widgets/inputs/basic_text_field_form.dart';

import '../../base_test_widget.dart';

void main() {
  testWidgets('BasicTextFieldForm Widget Test', (tester) async {
    await tester.pumpWidget(
      BaseTestWidget(
        child: BasicTextFieldForm(
          obligatory: true,
          title: 'Title Working',
          controller: TextEditingController(),
        ),
      ),
    );

    expect(find.text('* Title Working'), findsOneWidget);
    expect(find.byType(BaseTextField), findsOneWidget);
  });
}
