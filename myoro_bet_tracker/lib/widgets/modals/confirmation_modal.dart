import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myoro_bet_tracker/blocs/bets_bloc.dart';
import 'package:myoro_bet_tracker/models/bet_model.dart';
import 'package:myoro_bet_tracker/widgets/buttons/icon_and_text_hover_button.dart';
import 'package:myoro_bet_tracker/widgets/modals/basic_modal.dart';

class ConfirmationModal extends StatelessWidget {
  final BetModel bet;

  const ConfirmationModal({ super.key, required this.bet });

  @override
  Widget build(BuildContext context) => BasicModal(
    title: 'Delete Bet',
    width: 300,
    body: Material(
      child: Column(
        children: [
          Text(
            'Are you sure you want to delete this bet?',
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              IconAndTextHoverButton(
                onTap: () {
                  BlocProvider.of<BetsBloc>(context).add(DeleteBetEvent(bet));
                  Navigator.pop(context);
                },
                icon: Icons.check,
                text: 'Yes',
                expanded: true
              ),
              const SizedBox(width: 10),
              IconAndTextHoverButton(
                onTap: () => Navigator.pop(context),
                icon: Icons.cancel,
                text: 'Cancel',
                expanded: true
              )
            ]
          )
        ],
      ),
    )
  );
}