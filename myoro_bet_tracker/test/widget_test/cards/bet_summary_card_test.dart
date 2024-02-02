import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myoro_bet_tracker/blocs/bets_bloc/bets_bloc.dart';
import 'package:myoro_bet_tracker/widgets/cards/base_card.dart';
import 'package:myoro_bet_tracker/widgets/cards/bet_summary_card.dart';

import '../../base_test_widget.dart';
import '../../constants/bet_model_constants.dart';

void main() {
  testWidgets('BetSummaryCard Widget Test', (tester) async {
    await tester.pumpWidget(
      BlocProvider(
        create: (context) => BetsBloc(List.generate(5, (_) => BetModelConstants.bet1)),
        child: const BaseTestWidget(
          child: BetSummaryCard(),
        ),
      ),
    );

    expect(find.byType(BetSummaryCard), findsOneWidget);
    expect(find.byType(BaseCard), findsNWidgets(3));
    expect(find.text('Net Gain / Loss'), findsOneWidget);
    expect(find.text('Total \$ Placed on Bets'), findsOneWidget);
    expect(find.text('Win / Loss'), findsOneWidget);
    expect(find.text('\$0.00'), findsNWidgets(2));
    expect(find.text('0.00%'), findsOneWidget);
  });
}