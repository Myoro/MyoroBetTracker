import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myoro_bet_tracker/blocs/bets_bloc.dart';
import 'package:myoro_bet_tracker/widgets/buttons/icon_and_text_hover_button.dart';
import 'package:myoro_bet_tracker/widgets/tables/bets_table.dart';
import 'package:myoro_bet_tracker/widgets/top_bars/main_screen_top_bar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({ super.key });

  @override
  Widget build(BuildContext context) => BlocBuilder<BetsBloc, BetsState>(
    builder: (context, state) => Scaffold(
      appBar: const MainScreenTopBar(),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            BetsTable(bets: state.bets),
            const SizedBox(height: 10),
            IconAndTextHoverButton(
              onTap: () => BlocProvider.of<BetsBloc>(context).add(AddBetEvent()), // TODO
              icon: Icons.add,
              text: 'Add Bet'
            ),
            const SizedBox(height: 10),
            IconAndTextHoverButton(
              onTap: () {}, // TODO
              icon: Icons.attach_money,
              text: 'Add Available Income'
            )
          ]
        ),
      )
    ),
  );
}