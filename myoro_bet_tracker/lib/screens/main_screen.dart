import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myoro_bet_tracker/bloc/betting_bloc.dart';
import 'package:myoro_bet_tracker/widgets/buttons/icon_and_text_hover_button.dart';
import 'package:myoro_bet_tracker/widgets/cards/bet_card.dart';
import 'package:myoro_bet_tracker/widgets/top_bars/main_screen_top_bar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({ super.key });

  @override
  Widget build(BuildContext context) => BlocBuilder<BettingBloc, BettingState>(
    builder: (context, bettingState) => Scaffold(
      appBar: const MainScreenTopBar(),
      body: Center(
        child: SizedBox(
          width: 300,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17), // Makes scrollbar much more visible
                child: Column(
                  children: [
                    // Add available income or new bet
                    const SizedBox(height: 10),
                    IconAndTextHoverButton(
                      onTap: () => print('Soon'),
                      icon: Icons.attach_money,
                      text: 'Add Available Income'
                    ),
                    const SizedBox(height: 10),
                    IconAndTextHoverButton(
                      onTap: () => BlocProvider.of<BettingBloc>(context).add(AddBet()),
                      icon: Icons.add,
                      text: 'Add Bet'
                    ),
    
                    // Bets
                    SizedBox(height: bettingState.bets.isNotEmpty ? 20 : 10),
                    if(bettingState.bets.isNotEmpty) ...[
                      Text('My Bets', style: Theme.of(context).textTheme.displayLarge),
                      const SizedBox(height: 10),
                      for(int i = bettingState.bets.length - 1; i >= 0; i--) ...[
                        BetCard(
                          id: bettingState.bets[i].id,
                          index: i,
                          editing: bettingState.selectedBet == i,
                          placed: bettingState.bets[i].placed,
                          won: bettingState.bets[i].won
                        ),
                        const SizedBox(height: 10)
                      ]
                    ]
                  ]
                )
              )
            ]
          ),
        ),
      )
    ),
  );
}