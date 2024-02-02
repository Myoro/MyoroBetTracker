import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myoro_bet_tracker/blocs/available_income_cubit.dart';
import 'package:myoro_bet_tracker/widgets/cards/available_income_card.dart';

import '../../base_test_widget.dart';

void main() {
  testWidgets('AvailableIncomeCard Widget Test', (tester) async {
    await tester.pumpWidget(
      BaseTestWidget(
        child: BlocProvider(
          create: (context) => AvailableIncomeCubit(0),
          child: const AvailableIncomeCard(),
        ),
      ),
    );

    expect(find.text('Income'), findsOneWidget);
    expect(find.text('****'), findsOneWidget);
    expect(find.byIcon(Icons.visibility), findsOneWidget);
    await tester.tap(find.byIcon(Icons.visibility));
    await tester.pump();
    expect(find.text('\$0.00'), findsOneWidget);
    expect(find.byIcon(Icons.visibility_off), findsOneWidget);
  });
}
