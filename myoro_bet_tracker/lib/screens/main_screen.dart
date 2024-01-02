import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myoro_bet_tracker/blocs/bets_bloc.dart';
import 'package:myoro_bet_tracker/widgets/graphs/bets_graph.dart';
import 'package:myoro_bet_tracker/widgets/modals/add_bet_modal.dart';
import 'package:myoro_bet_tracker/widgets/buttons/icon_and_text_hover_button.dart';
import 'package:myoro_bet_tracker/widgets/tables/bets_table.dart';
import 'package:myoro_bet_tracker/widgets/top_bars/main_screen_top_bar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({ super.key });

  @override
  Widget build(BuildContext context) => BlocBuilder<BetsBloc, BetsState>(
    builder: (context, state) => Scaffold(
      appBar: const MainScreenTopBar(),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 17),
            child: Column(
              children: [
                if(state.bets.isNotEmpty) ...[
                  const BetsGraph(),
                  const SizedBox(height: 50)
                ],
                const BetsTable(),
                const SizedBox(height: 50),
                IconAndTextHoverButton(
                  onTap: () => showDialog(
                    context: context,
                    builder: (context) => const AddBetModal()
                  ),
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
            )
          )
        ]
      )
    ),
  );
}