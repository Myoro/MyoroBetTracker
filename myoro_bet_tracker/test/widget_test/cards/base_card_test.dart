import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myoro_bet_tracker/widgets/cards/base_card.dart';

import '../../base_test_widget.dart';

void main() {
  testWidgets('BaseCard Widget Test', (tester) async {
    await tester.pumpWidget(
      const BaseTestWidget(
        child: BaseCard(
          title: 'Title Working',
          content: Text('Content Working'),
        ),
      ),
    );

    expect(find.byType(BaseCard), findsOneWidget);
    expect(find.text('Title Working'), findsOneWidget);
    expect(find.text('Content Working'), findsOneWidget);
  });
}
