import 'package:flutter/material.dart';
import 'package:myoro_bet_tracker/widgets/bodies/home_screen_body.dart';
import 'package:myoro_bet_tracker/widgets/cards/base_card.dart';
import 'package:myoro_bet_tracker/widgets/tables/bets_table.dart';

/// [BetsTable] within a [BaseCard] to show the user's bets
///
/// Used in [HomeScreenBody]
class BetsTableCard extends StatelessWidget {
  const BetsTableCard({super.key});

  @override
  Widget build(BuildContext context) => const BaseCard(
        title: 'My Bets',
        content: BetsTable(),
      );
}
