import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myoro_bet_tracker/blocs/available_income_cubit.dart';
import 'package:myoro_bet_tracker/blocs/bets_bloc/bets_bloc.dart';
import 'package:myoro_bet_tracker/widgets/bodies/home_screen_body.dart';
import 'package:myoro_bet_tracker/widgets/cards/available_income_card.dart';
import 'package:myoro_bet_tracker/widgets/cards/bet_summary_card.dart';
import 'package:myoro_bet_tracker/widgets/cards/bets_table_card.dart';

import '../../base_test_widget.dart';
import '../../bet_model_constants.dart';

void main() {
  testWidgets('HomeScreenBody Widget Test', (tester) async {
    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AvailableIncomeCubit(0)),
          BlocProvider(create: (context) => BetsBloc(List.generate(5, (index) => BetModelConstants.bet1))),
        ],
        child: const BaseTestWidget(child: HomeScreenBody()),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byType(AvailableIncomeCard), findsOneWidget);
    expect(find.byType(BetSummaryCard), findsOneWidget);
    expect(find.byType(BetsTableCard), findsOneWidget);
  });
}
