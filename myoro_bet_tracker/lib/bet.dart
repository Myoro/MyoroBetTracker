import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:myoro_bet_tracker/bloc/bet_cubit.dart";
import "package:myoro_bet_tracker/dropdown.dart";
import "package:myoro_bet_tracker/hover_button.dart";
import "package:myoro_bet_tracker/input_field.dart";

class Bet extends StatefulWidget {
  final bool removingBets;
  final int index;
  final TextEditingController placedController;
  final TextEditingController gainedController;
  final int betWon;

  const Bet({
    super.key,
    required this.removingBets,
    required this.index,
    required this.placedController,
    required this.gainedController,
    required this.betWon
  });

  @override
  State<Bet> createState() => _BetState();
}

class _BetState extends State<Bet> {
  late int betWon;
  String placed = "";
  String gained = "";

  @override
  void initState() {
    super.initState();
    betWon = widget.betWon;
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: theme.colorScheme.onPrimary,
          width: 2
        )
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InputField(
                  placeholder: "\$ Placed",
                  onChanged: (text) {
                    BlocProvider.of<BetCubit>(context).editBet(widget.index, "placed", text.isNotEmpty ? text : '0');
                    setState(() => placed = text);
                  }
                ),
                if(betWon == 1) ...[
                  const SizedBox(width: 10),
                  InputField(
                    placeholder: "\$ Won",
                    onChanged: (text) {
                      BlocProvider.of<BetCubit>(context).editBet(widget.index, "gained", text.isNotEmpty ? text : '0');
                      setState(() => gained = text);
                    }
                  ),
                ]
              ]
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Dropdown(
                  onChanged: (value) {
                    BlocProvider.of<BetCubit>(context).editBet(widget.index, "bet_won", (value == "Won") ? 1 : 0);
                    setState(() => betWon = (value == "Won") ? 1 : 0);
                  }
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    (betWon == 1)
                      ? "Gained: \$${gained.isNotEmpty ? gained : '0'}"
                      : "Lost: \$${placed.isNotEmpty ? placed : '0'}",
                    textAlign: TextAlign.center
                  )
                ),
                if(widget.removingBets) ...[
                  const SizedBox(width: 10),
                  HoverButton(
                    buttonText: "Remove",
                    onTap: () => BlocProvider.of<BetCubit>(context).deleteBet(widget.index)
                  )
                ]
              ]
            )
          ]
        ),
      ),
    );
  }
}