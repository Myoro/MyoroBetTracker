// ignore_for_file: curly_braces_in_flow_control_structures

import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:myoro_bet_tracker/bet.dart";
import "package:myoro_bet_tracker/bloc/bet_cubit.dart";
import "package:myoro_bet_tracker/hover_button.dart";

class Body extends StatefulWidget {
  const Body({ super.key });

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Map<String, dynamic>> controllers = [];
  bool removingBets = false;

  @override
  void dispose() {
    super.dispose();
    for(final controllerSet in controllers)
      for(int i = 0; i < 2; i++)
        controllerSet[(i == 0) ? "placed" : "gained"].dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return BlocBuilder<BetCubit, List<Map<String, dynamic>>>(
      builder: (context, state) {
        double total = 0;
        for(int i = 0; i < state.length; i++) {
          if(state[i]["bet_won"] == 1) total += double.parse(state[i]["gained"]);
          else                         total -= double.parse(state[i]["placed"]);
          controllers.add({
            "placed":  TextEditingController(text: state[i]["placed"]),
            "gained":  TextEditingController(text: state[i]["gained"]),
            "bet_won": state[i]["bet_won"]
          });
        }

        return Center(
          child: SizedBox(
            width: 300,
            child: ListView(
              padding: const EdgeInsets.only(left: 17, right: 17),
              children: [
                // Buttons to add, remove, or export bets
                Column(
                  children: [
                    HoverButton(
                      buttonText: "Add Bet",
                      icon: Icons.add,
                      onTap: () => BlocProvider.of<BetCubit>(context).addBet()
                    ),
                    if(state.isNotEmpty) ...[
                      const SizedBox(height: 5),
                      HoverButton(
                        buttonText: !removingBets ? "Remove Bets" : "Back",
                        icon: !removingBets ? Icons.remove : Icons.arrow_back,
                        onTap: () => setState(() => removingBets = !removingBets)
                      )
                    ],
                  ]
                ),
                // Totals
                if(state.isNotEmpty) 
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    child: Text(
                      "Total Gained/Lost: \$${total.toStringAsFixed(2)}",
                      style: theme.textTheme.bodyMedium,
                      textAlign: TextAlign.center
                    ),
                  ),
                // Bets
                for(int i = 0; i < state.length; i++) ...[
                  Bet(
                    removingBets: removingBets,
                    index: i,
                    placedController: controllers[i]["placed"],
                    gainedController: controllers[i]["gained"],
                    betWon: controllers[i]["bet_won"]
                  ),
                  if(i != (state.length - 1)) const SizedBox(height: 10)
                ]
              ]
            ),
          ),
        );
      }
    );
  }
}