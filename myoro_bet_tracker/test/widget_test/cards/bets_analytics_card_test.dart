import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myoro_bet_tracker/blocs/available_income_cubit.dart';
import 'package:myoro_bet_tracker/blocs/bets_bloc/bets_bloc.dart';
import 'package:myoro_bet_tracker/widgets/buttons/button_without_feedback.dart';
import 'package:myoro_bet_tracker/widgets/cards/bets_analytics_card.dart';
import 'package:myoro_bet_tracker/widgets/outputs/form_output.dart';

import '../../base_test_widget.dart';

void main() {
  testWidgets('BetsAnalyticsCard Widget Test', (tester) async {
    await tester.pumpWidget(
      BaseTestWidget(
        child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => AvailableIncomeCubit(0)),
            BlocProvider(create: (context) => BetsBloc([])),
          ],
          child: const BetsAnalyticsCard(),
        ),
      ),
    );

    expect(find.text('Available Income'), findsOneWidget);
    expect(find.text('*****'), findsOneWidget);
    expect(find.byType(ButtonWithoutFeedback), findsOneWidget);
    expect(find.byIcon(Icons.visibility), findsOneWidget);
    expect(find.byType(FormOutput), findsNWidgets(2));
    expect(find.text('Net Gained or Lost'), findsOneWidget);
    expect(find.text('Total Money Placed on Bets'), findsOneWidget);
    expect(find.text('\$0.00'), findsNWidgets(2));

    await tester.tap(find.byIcon(Icons.visibility));
    await tester.pump();

    expect(find.text('\$0.00'), findsNWidgets(3));
    expect(find.byIcon(Icons.visibility_off), findsOneWidget);
  });
}
