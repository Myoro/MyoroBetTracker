import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myoro_bet_tracker/blocs/bets_bloc.dart';
import 'package:myoro_bet_tracker/widgets/buttons/icon_and_text_hover_button.dart';
import 'package:myoro_bet_tracker/widgets/inputs/input_form.dart';
import 'package:myoro_bet_tracker/widgets/modals/basic_modal.dart';

class AvailableIncomeModal extends StatefulWidget {
  const AvailableIncomeModal({ super.key });

  @override
  State<AvailableIncomeModal> createState() => _AvailableIncomeModalState();
}

class _AvailableIncomeModalState extends State<AvailableIncomeModal> {
  final TextEditingController _availableIncomeController = TextEditingController();
  final ValueNotifier<bool> _showMessage = ValueNotifier<bool>(false);

  void addAvailableIncome() {
    if(_availableIncomeController.text.isEmpty) {
      _showMessage.value = true;
      Future.delayed(const Duration(seconds: 2), () => _showMessage.value = false);
      return;
    }

    BlocProvider.of<BetsBloc>(context).add(
      AddAvailableIncomeEvent(
        double.parse(double.parse(_availableIncomeController.text).toStringAsFixed(2))
      )
    );

    Navigator.pop(context);
  }

  @override
  void dispose() {
    super.dispose();
    _availableIncomeController.dispose();
  }

  @override
  Widget build(BuildContext context) => BasicModal(
    title: 'Set Available Income',
    width: 370,
    body: ValueListenableBuilder(
      valueListenable: _showMessage,
      builder: (context, showMessage, child) => Material(
        child: Column(
          children: [
            InputForm(
              title: 'Available Income',
              titleExpanded: true,
              inputExpanded: true,
              controller: _availableIncomeController
            ),
            const SizedBox(height: 10),
            if(showMessage) ...[
              Text('Please enter a number', style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.normal
              )),
              const SizedBox(height: 10)
            ],
            Row(
              children: [
                IconAndTextHoverButton(
                  onTap: () => addAvailableIncome(), // TODO
                  icon: Icons.add,
                  text: 'Set',
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
  );
}