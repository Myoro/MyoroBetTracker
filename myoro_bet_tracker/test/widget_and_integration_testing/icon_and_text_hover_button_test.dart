import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myoro_bet_tracker/widgets/buttons/icon_and_text_hover_button.dart';

import '../base_test_widget.dart';

void main() {
  testWidgets('IconAndTextHoverButton Widget Test', (tester) async {
    await tester.pumpWidget(
      BaseTestWidget(
        title: 'IconAndTextHoverButton Widget Test',
        child: IconAndTextHoverButton(
          onTap: () {},
          icon: Icons.abc,
          text: 'Working'
        )
      )
    );
    await tester.pumpAndSettle();

    expect(find.byType(IconAndTextHoverButton), findsOneWidget);
    expect(find.byType(Icon), findsOneWidget);
    expect(find.byType(Text), findsOneWidget);
    expect(find.byIcon(Icons.abc), findsOneWidget);
    expect(find.text('Working'), findsOneWidget);
  });
}