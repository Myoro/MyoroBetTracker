import 'package:flutter_test/flutter_test.dart';
import 'package:myoro_bet_tracker/widgets/inputs/base_dropdown.dart';
import 'package:myoro_bet_tracker/widgets/inputs/basic_dropdown_form.dart';

import '../../base_test_widget.dart';

void main() {
  testWidgets('BasicDropdownForm Widget Test', (tester) async {
    await tester.pumpWidget(
      BaseTestWidget(
        child: BasicDropdownForm(
          title: 'Title Working',
          items: const [ 'This', 'is', 'a', 'test' ],
          onChanged: (_) {},
        ),
      ),
    );

    expect(find.text('Title Working'), findsOneWidget);
    expect(find.byType(BaseDropdown), findsOneWidget);
  });
}