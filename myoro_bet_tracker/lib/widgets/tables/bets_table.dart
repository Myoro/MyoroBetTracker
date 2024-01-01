import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myoro_bet_tracker/blocs/bets_bloc.dart';
import 'package:myoro_bet_tracker/models/bet_model.dart';

class BetsTable extends StatelessWidget {
  const BetsTable({ super.key });

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

    return BlocBuilder<BetsBloc, BetsState>(
      builder: (context, state) => Table(
        children: [
          // Title
          TableRow(
            decoration: BoxDecoration(
              color: theme.colorScheme.onPrimary,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10)
              ),
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
                    style: theme.textTheme.titleMedium!.copyWith(
                      color: theme.colorScheme.primary
                    ),
                    textAlign: TextAlign.center
                  ),
                )
            ]
          ),
          // Bets
          for(final BetModel bet in state.bets)
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
      ),
    );
  }
}