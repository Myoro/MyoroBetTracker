import 'package:flutter/material.dart';
import 'package:myoro_bet_tracker/widgets/cards/bets_analytics_card.dart';
import 'package:myoro_bet_tracker/widgets/cards/bets_table_card.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(3),
        child: ListView(
          padding: const EdgeInsets.all(17),
          children: const [
            BetsAnalyticsCard(),
            SizedBox(height: 10),
            BetsTableCard(),
          ],
        ),
      );
}
