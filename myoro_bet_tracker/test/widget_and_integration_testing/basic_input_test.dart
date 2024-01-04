import 'package:flutter_test/flutter_test.dart';
import 'package:myoro_bet_tracker/widgets/inputs/basic_input.dart';

import '../base_test_widget.dart';

void main() {
  testWidgets('BasicInput Widget Test', (tester) async {
    await tester.pumpWidget(
      const BaseTestWidget(
        title: 'BasicInput Widget Test',
        child: BasicInput(hintText: 'Hint Text Working')
      )
    );

    expect(find.byType(BasicInput), findsOneWidget);
    expect(find.text('Hint Text Working'), findsOneWidget);
  });
}