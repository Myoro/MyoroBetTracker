import 'package:flutter/material.dart';
import 'package:myoro_bet_tracker/widgets/graphs/bets_graph.dart';
import 'package:myoro_bet_tracker/widgets/modals/add_bet_modal.dart';
import 'package:myoro_bet_tracker/widgets/buttons/icon_and_text_hover_button.dart';
import 'package:myoro_bet_tracker/widgets/tables/bets_table.dart';
import 'package:myoro_bet_tracker/widgets/top_bars/main_screen_top_bar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({ super.key });

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: const MainScreenTopBar(),
    body: Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: [
          const BetsGraph(),
          const BetsTable(),
          const SizedBox(height: 10),
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
      ),
    )
  );
}