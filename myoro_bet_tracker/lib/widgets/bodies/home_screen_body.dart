import 'package:flutter/material.dart';
import 'package:myoro_bet_tracker/widgets/cards/available_income_card.dart';
import 'package:myoro_bet_tracker/widgets/cards/bet_summary_card.dart';
import 'package:myoro_bet_tracker/widgets/cards/bets_table_card.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) => const Padding(
        padding: EdgeInsets.all(20),
        child: OverflowBox(
          alignment: Alignment.topCenter,
          minWidth: 1000,
          child: Column(
            children: [
              AvailableIncomeCard(),
              SizedBox(height: 10),
              BetSummaryCard(),
              SizedBox(height: 10),
              BetsTableCard(),
            ],
          ),
        ),
      );
}
