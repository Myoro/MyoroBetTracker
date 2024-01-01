import 'package:flutter/material.dart';
import 'package:myoro_bet_tracker/inputs/basic_dropdown.dart';
import 'package:myoro_bet_tracker/inputs/basic_input.dart';
import 'package:myoro_bet_tracker/widgets/modals/basic_modal.dart';

class AddBetModal extends StatelessWidget {
  const AddBetModal({ super.key });

  @override
  Widget build(BuildContext context) {
    final List<String> titles = [
      'Bet Name',
      'Sport(?)',
      '\$ Placed',
      '\$ Gained/Lost'
    ];

    return BasicModal(
      title: 'Add Bet',
      width: 500,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              for(final String title in titles)
                Text('$title:', style: Theme.of(context).textTheme.bodyMedium)
            ]
          ),
          const SizedBox(width: 20),
          const Material( // So TextFields will work property in modals
            child: Column(
              children: [
                BasicInput(),
                BasicDropdown(),
                BasicInput(),
                BasicInput()
              ]
            )
          )
        ]
      )
    );
  }
}