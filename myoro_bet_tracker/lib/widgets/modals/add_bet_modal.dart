import 'package:flutter/material.dart';
import 'package:myoro_bet_tracker/widgets/inputs/dropdown_form.dart';
import 'package:myoro_bet_tracker/widgets/inputs/input_form.dart';
import 'package:myoro_bet_tracker/widgets/modals/basic_modal.dart';

class AddBetModal extends StatefulWidget {
  const AddBetModal({ super.key });

  @override
  State<AddBetModal> createState() => _AddBetModalState();
}

class _AddBetModalState extends State<AddBetModal> {
  final TextEditingController betNameController = TextEditingController();
  final TextEditingController placedController = TextEditingController();
  final TextEditingController gainedController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    betNameController.dispose();
    placedController.dispose();
    gainedController.dispose();
  }

  @override
  Widget build(BuildContext context) => const BasicModal(
    title: 'Add Bet',
    width: 350,
    body: Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          InputForm(
            title: 'Bet Name',
            textExpanded: true,
            textAlignment: TextAlign.right
          ),
          SizedBox(height: 5),
          DropdownForm(
            title: 'Sport(?)',
            dropdownItems: [ 'mock', 'test' ],
            textExpanded: true,
            textAlignment: TextAlign.right
          ),
          SizedBox(height: 5),
          InputForm(
            title: '\$ Placed',
            textExpanded: true,
            textAlignment: TextAlign.right
          ),
          SizedBox(height: 5),
          InputForm(
            title: '\$ Gained/Lost',
            textExpanded: true,
            textAlignment: TextAlign.right
          )
        ]
      ),
    )
  );
}