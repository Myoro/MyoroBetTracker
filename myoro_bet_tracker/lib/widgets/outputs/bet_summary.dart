import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myoro_bet_tracker/blocs/bets_bloc.dart';
import 'package:myoro_bet_tracker/database.dart';
import 'package:myoro_bet_tracker/models/bet_model.dart';
import 'package:myoro_bet_tracker/widgets/headers/header_with_checkbox.dart';

class BetSummary extends StatefulWidget {
  const BetSummary({ super.key });

  @override
  State<BetSummary> createState() => _BetSummaryState();
}

class _BetSummaryState extends State<BetSummary> {
  final ValueNotifier<bool> _showSummary = ValueNotifier<bool>(true);

  @override
  void initState() {
    super.initState();
    Database.get('show').then((row) => _showSummary.value = row['show_bet_summary'] == 1 ? true : false);
  }

  @override
  Widget build(BuildContext context) => BlocBuilder<BetsBloc, BetsState>(
    builder: (context, state) {
      double totalPlaced = 0;
      double totalGainedOrLost = 0;

      for(final BetModel bet in state.bets) {
        totalPlaced += bet.placed;
        totalGainedOrLost += bet.gainedOrLost == 'Lost' ? -bet.placed : bet.gainedOrLost;
      }

      return ValueListenableBuilder(
        valueListenable: _showSummary,
        builder: (context, showSummary, child) => Column(
          children: [
            HeaderWithCheckbox(
              title: 'Show Bet Summary',
              onChanged: (checked) {
                Database.update('show', { 'show_bet_summary': checked ? 1 : 0 });
                _showSummary.value = checked;
              }
            ),
            if(showSummary)
              Column(
                children: [
                  _summaryRow('Total \$ Placed', totalPlaced),
                  _summaryRow('Total \$ Gained or Lost', totalGainedOrLost),
                  if(state.availableIncome != null)
                    _summaryRow('Available Income', state.availableIncome!)
                ]
              )
          ]
        ),
      );
    }
  );

  Widget _summaryRow(String title, double data) => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text('$title:', style: Theme.of(context).textTheme.titleSmall),
      const SizedBox(width: 5),
      Flexible(child: Text('\$${data.toStringAsFixed(2)}', style: Theme.of(context).textTheme.bodySmall))
    ]
  );
}