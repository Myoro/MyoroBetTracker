import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myoro_bet_tracker/blocs/bets_bloc.dart';
import 'package:myoro_bet_tracker/models/bet_model.dart';
import 'package:myoro_bet_tracker/widgets/buttons/icon_and_text_hover_button.dart';
import 'package:myoro_bet_tracker/widgets/inputs/dropdown_form.dart';
import 'package:myoro_bet_tracker/widgets/inputs/input_form.dart';
import 'package:myoro_bet_tracker/widgets/modals/basic_modal.dart';

class AddBetModal extends StatefulWidget {
  const AddBetModal({ super.key });

  @override
  State<AddBetModal> createState() => _AddBetModalState();
}

class _AddBetModalState extends State<AddBetModal> {
  final ValueNotifier<bool> _showMessage = ValueNotifier<bool>(false);
  final ValueNotifier<bool> _gained = ValueNotifier<bool>(false);
  String _sport = 'Soccer';
  final TextEditingController betNameController = TextEditingController();
  final TextEditingController placedController = TextEditingController();
  final TextEditingController gainedController = TextEditingController();

  void addBet(BuildContext context) {
    if(
      placedController.text.isEmpty
      ||
      (
        _gained.value
        &&
        gainedController.text.isEmpty
      )
    ) {
      _showMessage.value = true;
      Future.delayed(const Duration(seconds: 2), () => _showMessage.value = false);
      return;
    }

    // Add to database
    BlocProvider.of<BetsBloc>(context).add(AddBetEvent(BetModel(
      name: betNameController.text,
      sport: _sport,
      placed: double.parse(double.parse(placedController.text).toStringAsFixed(2)),
      gainedOrLost: _gained.value ? double.parse(double.parse(gainedController.text).toStringAsFixed(2)) : 'Lost',
      datePlaced: DateTime.now()
    )));

    Navigator.pop(context);
  }

  @override
  void dispose() {
    super.dispose();
    betNameController.dispose();
    placedController.dispose();
    gainedController.dispose();
  }

  @override
  Widget build(BuildContext context) => ValueListenableBuilder(
    valueListenable: _showMessage,
    builder: (context, showMessage, child) => BasicModal(
      title: 'Add Bet',
      width: 350,
      body: Material( // Required for our widgets to function
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              InputForm(
                title: 'Bet Name',
                hintText: 'Bet Name',
                titleExpanded: true,
                textAlignment: TextAlign.right,
                inputExpanded: true,
                controller: betNameController,
                numberFormatters: false
              ),
              const SizedBox(height: 10),
              DropdownForm(
                title: 'Sport(?)',
                dropdownItems: const [
                  'Soccer',
                  'Basketball',
                  'Hockey',
                  'Casino'
                ],
                textExpanded: true,
                textAlignment: TextAlign.right,
                dropdownExpanded: true,
                onChanged: (value) => _sport = value
              ),
              const SizedBox(height: 10),
              InputForm(
                title: '\$ Placed*',
                hintText: '\$ Placed',
                titleExpanded: true,
                textAlignment: TextAlign.right,
                inputExpanded: true,
                controller: placedController
              ),
              const SizedBox(height: 10),
              ValueListenableBuilder(
                valueListenable: _gained,
                builder: (context, gained, child) => InputForm(
                  title: '\$ Gained/Lost*',
                  hintText: '\$ Gained/Lost',
                  titleExpanded: true,
                  textAlignment: TextAlign.right,
                  inputExpanded: true,
                  controller: gainedController,
                  dropdownTitle: true,
                  dropdownItems: const [ 'Lost*', 'Gained*' ],
                  dropdownOnChanged: (value) => _gained.value = value == 'Gained*' ? true : false,
                  showInput: gained,
                  noInputText: 'Bet Lost'
                ),
              ),
              const SizedBox(height: 10),
              if(showMessage) ...[
                Text(
                  'Please fill every field with *',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontStyle: FontStyle.italic)
                ),
                const SizedBox(height: 10)
              ],
              Row(
                children: [
                  IconAndTextHoverButton(
                    onTap: () => addBet(context), // TODO
                    icon: Icons.add,
                    text: 'Add Bet',
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
            ]
          ),
        ),
      )
    ),
  );
}