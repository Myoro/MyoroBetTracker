import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myoro_bet_tracker/widgets/inputs/base_text_field.dart';

import '../../base_test_widget.dart';

void main() {
  testWidgets('BaseTextField Widget Test', (tester) async {
    await tester.pumpWidget(
      BaseTestWidget(
        child: BaseTextField(
          size: const Size(300, 400),
          controller: TextEditingController(),
        ),
      ),
    );

    expect(
      find.byWidgetPredicate((widget) => (
        widget is SizedBox
        &&
        widget.width == 300
        &&
        widget.height == 400
      )),
      findsOneWidget
    );
    expect(find.byType(TextField), findsOneWidget);
  });
}