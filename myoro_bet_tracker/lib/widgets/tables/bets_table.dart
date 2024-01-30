import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myoro_bet_tracker/blocs/bets_bloc/bets_bloc.dart';
import 'package:myoro_bet_tracker/blocs/bets_bloc/bets_state.dart';
import 'package:myoro_bet_tracker/models/bet_model.dart';
import 'package:myoro_bet_tracker/widgets/bodies/home_screen_body.dart';
import 'package:myoro_bet_tracker/widgets/buttons/button_without_feedback.dart';
import 'package:myoro_bet_tracker/widgets/buttons/icon_hover_button.dart';

/// Displays bet history of the user
///
/// Used in [HomeScreenBody]
class BetsTable extends StatelessWidget {
  const BetsTable({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return BlocBuilder<BetsBloc, BetsState>(
      builder: (context, state) => Table(
        columnWidths: const {
          5: FixedColumnWidth(32),
          6: FixedColumnWidth(32),
        },
        children: [
          TableRow(
            decoration: BoxDecoration(
              color: theme.colorScheme.onPrimary,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            children: const [
              _TitleCell(text: 'Bet Name'),
              _TitleCell(text: 'Sport/Casino'),
              _TitleCell(text: '\$ Placed'),
              _TitleCell(text: '\$ Gained or Lost'),
              _TitleCell(text: 'Date Placed', padding: EdgeInsets.only(top: 5, bottom: 5, left: 25, right: 5)),
              SizedBox(),
              SizedBox(),
            ],
          ),
          for (final BetModel bet in state.bets)
            TableRow(
              children: [
                _NormalCell(text: bet.name ?? 'N/A'),
                _NormalCell(text: bet.sport ?? 'N/A'),
                _NormalCell(text: bet.placed.toStringAsFixed(2)),
                _NormalCell(text: bet.gainedOrLost.toStringAsFixed(2)),
                _NormalCell(text: bet.datePlaced),
                _Button(icon: Icons.edit, onTap: () {}), // TODO: onTap
                _Button(icon: Icons.delete, onTap: () {}), // TODO: onTap
              ],
            ),
        ],
      ),
    );
  }
}

class _TitleCell extends StatefulWidget {
  final String text;
  final EdgeInsets padding;

  const _TitleCell({
    required this.text,
    this.padding = const EdgeInsets.all(5),
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
      onTap: () {}, // TODO: Filter
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
