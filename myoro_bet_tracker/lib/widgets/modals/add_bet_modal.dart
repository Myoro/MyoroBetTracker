import 'package:flutter/material.dart';
import 'package:myoro_bet_tracker/inputs/basic_dropdown.dart';
import 'package:myoro_bet_tracker/inputs/basic_input.dart';
import 'package:myoro_bet_tracker/widgets/buttons/icon_and_text_hover_button.dart';
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
      width: 350,
      body: Material( // For BasicInput & BasicDropdown to work
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              for(final String title in titles) ...[
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        '$title:',
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.right
                      ),
                    ),
                    const SizedBox(width: 10),
                    if(title != 'Sport(?)')
                      const Expanded(child: BasicInput())
                    else
                      const Expanded(child: BasicDropdown())
                  ]
                ),
                const SizedBox(height: 10)
              ],
              Row(
                children: [
                  Expanded(
                    child: IconAndTextHoverButton(
                      onTap: () {}, // TODO
                      icon: Icons.add,
                      text: 'Add Bet'
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: IconAndTextHoverButton(
                      onTap: () {}, // TODO
                      icon: Icons.cancel,
                      text: 'Cancel'
                    ),
                  )
                ]
              )
            ]
          ),
        ),
      )
    );
  }
}