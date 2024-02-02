import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myoro_bet_tracker/widgets/inputs/base_dropdown.dart';
import 'package:myoro_bet_tracker/widgets/inputs/base_text_field.dart';
import 'package:myoro_bet_tracker/widgets/inputs/dropdown_and_text_field_form.dart';

import '../../base_test_widget.dart';

void main() {
  testWidgets('DropdownAndTextFieldForm Widget Test', (tester) async {
    await tester.pumpWidget(
      BaseTestWidget(
        child: DropdownAndTextFieldForm(
          title: 'Title Working',
          obligatory: true,
          controller: TextEditingController(),
          onChanged: (_) {},
        ),
      ),
    );

    expect(find.byType(DropdownAndTextFieldForm), findsOneWidget);
    expect(find.text('* Title Working'), findsOneWidget);
    expect(find.byType(BaseTextField), findsOneWidget);
    expect(find.byType(BaseDropdown), findsOneWidget);
  });
}