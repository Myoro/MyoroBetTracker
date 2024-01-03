import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myoro_bet_tracker/blocs/bets_bloc.dart';
import 'package:myoro_bet_tracker/database.dart';
import 'package:myoro_bet_tracker/models/bet_model.dart';
import 'package:myoro_bet_tracker/widgets/buttons/button_without_feedback.dart';
import 'package:myoro_bet_tracker/widgets/headers/header_with_checkbox.dart';
import 'package:myoro_bet_tracker/widgets/modals/confirmation_modal.dart';

class BetsTable extends StatefulWidget {
  const BetsTable({ super.key });

  @override
  State<BetsTable> createState() => _BetsTableState();
}

class _BetsTableState extends State<BetsTable> {
  final ValueNotifier<bool> _showTable = ValueNotifier<bool>(true);

  @override
  void initState() {
    super.initState();
    Database.get('show').then((row) => _showTable.value = row['show_bets_table'] == 1 ? true : false);
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final double screenWidth = MediaQuery.of(context).size.width;

    final List<String> titleRow = [
      'Name',
      'Sport',
      '\$ Placed',
      '\$ Gained/Lost',
      'Date Placed',
      '' // Delete column
    ];

    if(screenWidth < 870) {
      titleRow.removeAt(titleRow.length - 2);
      if(screenWidth < 700) {
        titleRow.removeAt(titleRow.length - 2);
        if(screenWidth < 400) {
          titleRow.removeAt(titleRow.length - 2);
        }
      }
    }

    return BlocBuilder<BetsBloc, BetsState>(
      builder: (context, state) => ValueListenableBuilder(
        valueListenable: _showTable,
        builder: (context, showTable, child) => Column(
          children: [
            HeaderWithCheckbox(
              title: 'Bets Table',
              onChanged: (checked) {
                _showTable.value = checked;
                Database.update('show', { 'show_bets_table': checked ? 1 : 0 });
              }
            ),
            if(showTable) ...[
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
                  columnWidths: { titleRow.length - 1: const FixedColumnWidth(50) },
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
                              onTap: () => BlocProvider.of<BetsBloc>(context).add(FilterBetsEvent(title)),
                              child: Wrap(
                                alignment: WrapAlignment.center,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  Text(
                                    title,
                                    style: theme.textTheme.titleMedium!.copyWith(
                                      color: theme.colorScheme.primary
                                    ),
                                    textAlign: TextAlign.center
                                  ),
                                  if(titleRow.indexOf(title) != titleRow.length - 1) Icon(Icons.filter_alt, size: 20, color: theme.colorScheme.primary)
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
                              child: titleRow[i].isNotEmpty
                                ?
                                Text(
                                  bet.toList()[i] == null ? '' : (bet.toList()[i] is double ? '\$${bet.toList()[i].toString()}' : bet.toList()[i]),
                                  style: theme.textTheme.bodyMedium,
                                  textAlign: TextAlign.center
                                )
                                :
                                ButtonWithoutFeedback(
                                  onTap: () => showDialog(
                                    context: context,
                                    builder: (context) => ConfirmationModal(bet: bet)
                                  ),
                                  child: Icon(
                                    Icons.delete,
                                    size: 30,
                                    color: Theme.of(context).colorScheme.onPrimary
                                  )
                                )
                            )
                        ]
                      )
                  ]
                ),
              ),
            ]
          ]
        )
      )
    );
  }
}