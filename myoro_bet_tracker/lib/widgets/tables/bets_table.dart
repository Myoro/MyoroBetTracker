import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myoro_bet_tracker/models/bet_model.dart';
import 'package:myoro_bet_tracker/widgets/bodies/home_screen_body.dart';
import 'package:myoro_bet_tracker/widgets/buttons/icon_hover_button.dart';

/// Displays bet history of the user
///
/// Used in [HomeScreenBody]
class BetsTable extends StatelessWidget {
  const BetsTable({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Remove this mock when finished
    final List<BetModel> bets = List.generate(
        5,
        (index) => BetModel(
              name: '$index Bet',
              sport: ['Soccer', 'Basketball', 'Hockey', 'Casino'][Random().nextInt(4)],
              placed: Random().nextDouble() * 2000,
              gainedOrLost: Random().nextDouble() * 2000,
              datePlaced: DateFormat('dd/MM/yyyy').format(DateTime.now()),
            ));

    final ThemeData theme = Theme.of(context);
    final TextStyle title = theme.textTheme.titleMedium!.copyWith(
      color: theme.colorScheme.primary,
    );
    final TextStyle row = theme.textTheme.bodyMedium!;

    return Table(
      columnWidths: const {
        5: FixedColumnWidth(32),
        6: FixedColumnWidth(32),
      },
      children: [
        for (final BetModel bet in bets)
          if (bets.indexOf(bet) == 0)
            TableRow(
              decoration: BoxDecoration(
                color: theme.colorScheme.onPrimary,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              children: [
                _Text(text: bet.name ?? '', textStyle: title, onTap: () {}), // TODO: onTap
                _Text(text: bet.sport ?? '', textStyle: title, onTap: () {}), // TODO: onTap
                _Text(text: bet.placed.toStringAsFixed(2), textStyle: title, onTap: () {}), // TODO: onTap
                _Text(text: bet.gainedOrLost.toStringAsFixed(2), textStyle: title, onTap: () {}), // TODO: onTap
                _Text(text: bet.datePlaced, textStyle: title, onTap: () {}),
                const SizedBox(),
                const SizedBox(),
              ],
            )
          else
            TableRow(
              children: [
                _Text(text: bet.name ?? '', textStyle: row),
                _Text(text: bet.sport ?? '', textStyle: row),
                _Text(text: bet.placed.toStringAsFixed(2), textStyle: row),
                _Text(text: bet.gainedOrLost.toStringAsFixed(2), textStyle: row),
                _Text(text: bet.datePlaced, textStyle: row),
                _Button(icon: Icons.edit, onTap: () {}), // TODO: onTap
                _Button(icon: Icons.delete, onTap: () {}), // TODO: onTap
              ],
            ),
      ],
    );
  }
}

class _Text extends StatelessWidget {
  /// Used as the onTap to trigger a filter
  final Function? onTap;

  /// Text to be displayed
  final String text;

  /// Style of the text being displayed
  final TextStyle textStyle;

  const _Text({
    this.onTap,
    required this.text,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) => MouseRegion(
        cursor: onTap != null ? SystemMouseCursors.click : SystemMouseCursors.basic,
        child: GestureDetector(
          onTap: onTap != null ? () => onTap : () {}, // TODO: Implement filters
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
            child: Text(
              text,
              style: textStyle,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
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
          padding: const EdgeInsets.symmetric(horizontal: 3),
          child: IconHoverButton(
            onTap: () => onTap(),
            icon: icon,
          ),
        ),
      );
}
