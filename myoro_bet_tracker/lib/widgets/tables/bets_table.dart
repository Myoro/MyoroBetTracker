import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myoro_bet_tracker/blocs/bets_bloc/bets_bloc.dart';
import 'package:myoro_bet_tracker/blocs/bets_bloc/bets_event.dart';
import 'package:myoro_bet_tracker/blocs/bets_bloc/bets_state.dart';
import 'package:myoro_bet_tracker/enums/bets_table_columns_enum.dart';
import 'package:myoro_bet_tracker/models/bet_model.dart';
import 'package:myoro_bet_tracker/widgets/cards/bets_table_card.dart';
import 'package:myoro_bet_tracker/widgets/buttons/button_without_feedback.dart';
import 'package:myoro_bet_tracker/widgets/buttons/icon_hover_button.dart';
import 'package:myoro_bet_tracker/widgets/modals/bet_form_modal.dart';
import 'package:myoro_bet_tracker/widgets/modals/confirmation_modal.dart';

/// Displays bet history of the user
///
/// Used in [BetsTableCard]
class BetsTable extends StatefulWidget {
  const BetsTable({super.key});

  @override
  State<BetsTable> createState() => _BetsTableState();
}

class _BetsTableState extends State<BetsTable> {
  late final ValueNotifier<String> _filter;

  void deleteBet(BetModel bet) {
    BlocProvider.of<BetsBloc>(context).add(DeleteBetEvent(bet));
    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
    _filter = ValueNotifier<String>(BetsTableColumnsEnum.betName.attribute);
  }

  @override
  void dispose() {
    _filter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BlocBuilder<BetsBloc, BetsState>(
        builder: (context, state) => ValueListenableBuilder(
            valueListenable: _filter,
            builder: (context, filter, child) {
              final double screenWidth = MediaQuery.of(context).size.width;

              final List<BetModel> bets = List.from(state.bets);
              bets.sort((a, b) {
                if (a.toJSON()[filter] != null) {
                  if (b.toJSON()[filter] != null) {
                    return a.toJSON()[filter]!.compareTo(b.toJSON()[filter]!);
                  } else {
                    return bets.indexOf(a);
                  }
                } else {
                  return bets.indexOf(a);
                }
              });

              List<_TitleCell> titleCells = BetsTableColumnsEnum.values
                  .map((value) => _TitleCell(
                        text: value.column,
                        filter: _filter,
                        padding: value.column == 'Date Placed'
                            ? const EdgeInsets.only(
                                top: 5,
                                bottom: 5,
                                left: 25,
                                right: 5,
                              )
                            : const EdgeInsets.all(5),
                      ))
                  .toList();

              if (screenWidth <= 1055) titleCells.removeLast();
              if (screenWidth <= 867) titleCells.removeAt(1);
              if (screenWidth <= 681) titleCells.removeAt(0);
              if (screenWidth <= 495) titleCells[1].text = '\$ Gained';

              return Table(
                columnWidths: {
                  titleCells.length + 1: FixedColumnWidth(bets.isNotEmpty ? 32 : 0),
                  titleCells.length: FixedColumnWidth(bets.isNotEmpty ? 32 : 0),
                },
                children: [
                  TableRow(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onPrimary,
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(10),
                        topRight: const Radius.circular(10),
                        bottomLeft: bets.isEmpty ? const Radius.circular(10) : Radius.zero,
                        bottomRight: bets.isEmpty ? const Radius.circular(10) : Radius.zero,
                      ),
                    ),
                    children: [
                      for (final _TitleCell titleCell in titleCells) titleCell,
                      const SizedBox(),
                      const SizedBox(),
                    ],
                  ),
                  for (final BetModel bet in bets)
                    TableRow(
                      children: [
                        if (titleCells.length >= 3) _NormalCell(text: bet.name ?? 'N/A'),
                        if (titleCells.length >= 4) _NormalCell(text: bet.sport ?? 'N/A'),
                        _NormalCell(text: '\$${bet.placed.toStringAsFixed(2)}'),
                        _NormalCell(text: '\$${bet.gainedOrLost.toStringAsFixed(2)}'),
                        if (titleCells.length == 5) _NormalCell(text: bet.datePlaced),
                        _Button(
                          icon: Icons.edit,
                          onTap: () => BetFormModal.show(context, bet: bet),
                        ),
                        _Button(
                          icon: Icons.delete,
                          onTap: () => ConfirmationModal.show(
                            context,
                            title: 'Delete Bet',
                            message: 'Are you sure you want to permanently delete this bet?',
                            yesOnTap: () => deleteBet(bet),
                          ),
                        ),
                      ],
                    ),
                ],
              );
            }),
      );
}

// ignore: must_be_immutable
class _TitleCell extends StatefulWidget {
  String text;
  final EdgeInsets padding;
  final ValueNotifier<String> filter;

  _TitleCell({
    required this.text,
    this.padding = const EdgeInsets.all(5),
    required this.filter,
  });

  @override
  State<_TitleCell> createState() => _TitleCellState();
}

class _TitleCellState extends State<_TitleCell> {
  final ValueNotifier<SystemMouseCursor> _cursor = ValueNotifier<SystemMouseCursor>(SystemMouseCursors.basic);

  @override
  void dispose() {
    _cursor.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return ButtonWithoutFeedback(
      onTap: () => widget.filter.value = BetsTableColumnsEnum.values.firstWhere((value) => value.column == widget.text).attribute,
      child: Padding(
        padding: widget.padding,
        child: Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text(
              widget.text,
              style: theme.textTheme.titleMedium!.copyWith(
                color: theme.colorScheme.primary,
              ),
            ),
            const SizedBox(width: 5),
            Icon(
              Icons.filter_alt,
              size: 20,
              color: theme.colorScheme.primary,
            ),
          ],
        ),
      ),
    );
  }
}

class _NormalCell extends StatelessWidget {
  final String text;

  const _NormalCell({required this.text});

  @override
  Widget build(BuildContext context) => Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium,
        textAlign: TextAlign.center,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );
}

class _Button extends StatelessWidget {
  final Function onTap;
  final IconData icon;

  const _Button({
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) => TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child: Padding(
          padding: const EdgeInsets.only(top: 5, left: 3, right: 3),
          child: IconHoverButton(
            onTap: () => onTap(),
            icon: icon,
          ),
        ),
      );
}
