import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myoro_bet_tracker/bloc/betting_bloc.dart';
import 'package:myoro_bet_tracker/widgets/buttons/icon_and_text_hover_button.dart';
import 'package:myoro_bet_tracker/widgets/inputs/input.dart';

class BetCard extends StatefulWidget {
  final int id;
  final int index;
  final bool editing;
  final double placed;
  final double won;

  const BetCard({
    super.key,
    required this.id,
    required this.index,
    required this.editing,
    required this.placed,
    required this.won
  });

  @override
  State<BetCard> createState() => _BetCardState();
}

class _BetCardState extends State<BetCard> {
  final TextEditingController _placedController = TextEditingController();
  final TextEditingController _wonController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _placedController.dispose();
    _wonController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

   void saveBet() {
      if(_placedController.text.isEmpty || _wonController.text.isEmpty) return;

      try {
        BlocProvider.of<BettingBloc>(context).add(SaveBetEvent(
          widget.id,
          widget.index,
          double.parse(double.parse(_placedController.text).toStringAsFixed(2)),
          double.parse(double.parse(_wonController.text).toStringAsFixed(2))
        ));
      } catch(e) { print('Invalid Input'); }
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: theme.colorScheme.onPrimary,
          width: 2,
        )
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: widget.editing
                    ? SizedBox(height: 40, child: Input(controller: _placedController, hintText: '\$ Placed'))
                    : Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        '\$${widget.placed.toStringAsFixed(2)}',
                        style: theme.textTheme.displayMedium, textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis
                      )
                    )
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: widget.editing
                    ? SizedBox(height: 40, child: Input(controller: _wonController, hintText: '\$ Won/Lost'))
                    : Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        '\$${widget.won.toStringAsFixed(2)}',
                        style: theme.textTheme.displayMedium, textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis
                      )
                    )
                )
              ]
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: IconAndTextHoverButton(
                    onTap: widget.editing
                      ? () => saveBet()
                      : () => BlocProvider.of<BettingBloc>(context).add(EditBetEvent(widget.index)),
                    icon: widget.editing ? Icons.save : Icons.add,
                    text: widget.editing ? 'Save Bet' : 'Edit Bet',
                    padding: const EdgeInsets.only(top: 5, bottom: 5, right: 5),
                    textStyle: theme.textTheme.bodyMedium
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: IconAndTextHoverButton(
                    onTap: widget.editing
                      ? () => BlocProvider.of<BettingBloc>(context).add(ResetSelectedBetEvent())
                      : () => BlocProvider.of<BettingBloc>(context).add(DeleteBetEvent(widget.id, widget.index)),
                    icon: widget.editing ? Icons.cancel : Icons.delete,
                    text: widget.editing ? 'Cancel' : 'Delete Bet',
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    textStyle: theme.textTheme.bodyMedium
                  ),
                ),
              ]
            )
          ]
        ),
      )
    );
  }
}