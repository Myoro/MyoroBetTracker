import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myoro_bet_tracker/bloc/betting_bloc.dart';
import 'package:myoro_bet_tracker/widgets/buttons/icon_and_text_hover_button.dart';
import 'package:myoro_bet_tracker/widgets/inputs/input.dart';

class BetCard extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

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
                  child: editing
                    ? const SizedBox(height: 40, child: Input(hintText: '\$ Placed'))
                    : Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text('\$$placed', style: theme.textTheme.displayMedium, textAlign: TextAlign.center)
                    )
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: editing
                    ? const SizedBox(height: 40, child: Input(hintText: '\$ Won/Lost'))
                    : Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text('\$$won', style: theme.textTheme.displayMedium, textAlign: TextAlign.center)
                    )
                )
              ]
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: IconAndTextHoverButton(
                    onTap: editing ? () => print('Save Bet') : () => print('Edit Bet'),
                    icon: editing ? Icons.save : Icons.add,
                    text: editing ? 'Save Bet' : 'Edit Bet',
                    padding: const EdgeInsets.only(top: 5, bottom: 5, right: 5),
                    textStyle: theme.textTheme.bodyMedium
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: IconAndTextHoverButton(
                    onTap: editing
                      ? () => print('Cancel')
                      : () => BlocProvider.of<BettingBloc>(context).add(DeleteBetEvent(id, index)),
                    icon: editing ? Icons.cancel : Icons.delete,
                    text: editing ? 'Cancel' : 'Delete Bet',
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