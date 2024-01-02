import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myoro_bet_tracker/blocs/bets_bloc.dart';
import 'package:myoro_bet_tracker/models/bet_model.dart';
import 'package:myoro_bet_tracker/widgets/buttons/button_without_feedback.dart';

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

    if(screenWidth < 820) {
      titleRow.removeAt(titleRow.length - 1);
      if(screenWidth < 700) {
        titleRow.removeAt(titleRow.length - 1);
        if(screenWidth < 400) {
          titleRow.removeAt(titleRow.length - 1);
        }
      }
    }

    return BlocBuilder<BetsBloc, BetsState>(
      builder: (context, state) => Column(
        children: [
          Text('Bets Table', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: theme.colorScheme.onPrimary,
                width: 2
              )
            ),
            child: Table(
              children: [
                // Title
                TableRow(
                  decoration: BoxDecoration(
                    color: theme.colorScheme.onPrimary,
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(5),
                      topRight: const Radius.circular(5),
                      bottomLeft: Radius.circular(state.bets.isEmpty ? 5 : 0),
                      bottomRight: Radius.circular(state.bets.isEmpty ? 5 : 0)
                    )
                  ),
                  children: [
                    for(final String title in titleRow)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: ButtonWithoutFeedback(
                          onTap: () => BlocProvider.of<BetsBloc>(context).add(FilterBets(title)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                title,
                                style: theme.textTheme.titleMedium!.copyWith(
                                  color: theme.colorScheme.primary
                                ),
                                textAlign: TextAlign.center
                              ),
                              Icon(Icons.filter_alt, size: 20, color: theme.colorScheme.primary)
                            ],
                          )
                        )
                      )
                  ]
                ),
                // Bets
                for(final BetModel bet in state.bets)
                  TableRow(
                    children: [
                      for(int i = 0; i < titleRow.length; i++)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            bet.toList()[i] == null ? '' : (bet.toList()[i] is double ? '\$${bet.toList()[i].toString()}' : bet.toList()[i]),
                            style: theme.textTheme.bodyMedium,
                            textAlign: TextAlign.center
                          ),
                        )
                    ]
                  )
              ]
            ),
          ),
        ],
      ),
    );
  }
}