import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myoro_bet_tracker/widgets/buttons/icon_hover_button.dart';

import '../../base_test_widget.dart';

void main() {
  testWidgets('IconHoverButton Widget Test', (tester) async {
    await tester.pumpWidget(
      BaseTestWidget(
        child: IconHoverButton(
          onTap: () {},
          icon: Icons.check,
        ),
      ),
    );

    expect(find.byType(IconHoverButton), findsOneWidget);
    expect(find.byIcon(Icons.check), findsOneWidget);
  });
}
