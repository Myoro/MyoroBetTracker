import 'package:flutter/material.dart';
import 'package:myoro_bet_tracker/models/bet_model.dart';

class BetsTable extends StatelessWidget {
  final List<BetModel> bets;

  const BetsTable({ super.key, required this.bets });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final double screenWidth = MediaQuery.of(context).size.width;

    final List<String> titleRow = [
      'Name',
      'Sport',
      '\$ Placed',
      '\$ Gained/Lost',
      'Date Placed'
    ];

    if(screenWidth < 700) {
      titleRow.removeAt(titleRow.length - 1);
      if(screenWidth < 580) {
        titleRow.removeAt(titleRow.length - 1);
        if(screenWidth < 280) {
          titleRow.removeAt(titleRow.length - 1);
        }
      }
    }

    return Table(
      children: [
        // Title
        TableRow(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: theme.colorScheme.onPrimary,
              width: 2
            )
          ),
          children: [
            for(final String title in titleRow)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  title,
                  style: theme.textTheme.titleMedium,
                  textAlign: TextAlign.center
                ),
              )
          ]
        ),
        // Bets
        for(final BetModel bet in bets)
          TableRow(
            children: [
              for(int i = 0; i < titleRow.length; i++)
                Text(
                  bet.toList()[i] == null ? '' : (bet.toList()[i] is double ? '\$${bet.toList()[i].toString()}' : bet.toList()[i]),
                  style: theme.textTheme.bodyMedium,
                  textAlign: TextAlign.center
                )
            ]
          )
      ]
    );
  }
}