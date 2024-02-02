import 'package:flutter_test/flutter_test.dart';
import 'package:myoro_bet_tracker/widgets/buttons/text_hover_button.dart';

import '../../base_test_widget.dart';

void main() {
  testWidgets('TextHoverButton Widget Test', (tester) async {
    await tester.pumpWidget(
      BaseTestWidget(
        child: TextHoverButton(
          onTap: () {},
          text: 'Working',
        ),
      ),
    );

    expect(find.byType(TextHoverButton), findsOneWidget);
    expect(find.text('Working'), findsOneWidget);
  });
}
