import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:myoro_bet_tracker/blocs/bets_bloc/bets_bloc.dart';
import 'package:myoro_bet_tracker/blocs/bets_bloc/bets_event.dart';
import 'package:myoro_bet_tracker/enums/type_of_bet_enum.dart';
import 'package:myoro_bet_tracker/input_formatters/date_formatter.dart';
import 'package:myoro_bet_tracker/models/bet_model.dart';
import 'package:myoro_bet_tracker/widgets/app_bars/home_screen_app_bar.dart';
import 'package:myoro_bet_tracker/widgets/inputs/basic_dropdown_form.dart';
import 'package:myoro_bet_tracker/widgets/inputs/basic_text_field_form.dart';
import 'package:myoro_bet_tracker/widgets/inputs/dropdown_and_text_field_form.dart';
import 'package:myoro_bet_tracker/widgets/modals/base_modal.dart';

/// Modal used to create bets
///
/// Used in [HomeScreenAppBar]
class CreateBetModal extends StatefulWidget {
  const CreateBetModal({super.key});

  static void show(BuildContext context) => showDialog(
        context: context,
        builder: (context) => const CreateBetModal(),
      );

  @override
  State<CreateBetModal> createState() => _CreateBetModalState();
}

class _CreateBetModalState extends State<CreateBetModal> {
  final TextEditingController _betNameController = TextEditingController();
  final TextEditingController _moneyPlacedController = TextEditingController();
  final TextEditingController _gainedOrLostController = TextEditingController();
  final TextEditingController _datePlacedController = TextEditingController();
  String? _betType;
  String _gainedOrLost = 'Gained';
  final ValueNotifier<double> _modalHeight = ValueNotifier<double>(351);

  void createBet() {
    // Validation
    if (_moneyPlacedController.text.isEmpty || _gainedOrLostController.text.isEmpty) {
      _modalHeight.value = 381;
      Future.delayed(const Duration(milliseconds: 1500), () => _modalHeight.value = 351);
      return;
    }

    BlocProvider.of<BetsBloc>(context).add(AddBetEvent(
      BetModel(
        name: _betNameController.text,
        sport: _betType,
        placed: double.parse(double.parse(_moneyPlacedController.text).toStringAsFixed(2)),
        gainedOrLost: double.parse((double.parse(_gainedOrLostController.text) * (_gainedOrLost == 'Gained' ? 1 : -1)).toStringAsFixed(2)),
        datePlaced: _datePlacedController.text.isNotEmpty ? _datePlacedController.text : DateFormat('dd/MM/yyyy').format(DateTime.now()),
      ),
    ));

    Navigator.pop(context);
  }

  @override
  void dispose() {
    _betNameController.dispose();
    _moneyPlacedController.dispose();
    _gainedOrLostController.dispose();
    _datePlacedController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => ValueListenableBuilder(
        valueListenable: _modalHeight,
        builder: (context, modalHeight, child) => BaseModal(
          title: 'Create Bet',
          size: Size(370, modalHeight),
          showFooterButtons: true,
          yesOnTap: () => createBet(),
          yesText: 'Create Bet',
          content: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Column(
              children: [
                BasicTextFieldForm(
                  title: 'Bet Name',
                  controller: _betNameController,
                ),
                BasicDropdownForm(
                  title: 'Sport or Casino?',
                  items: TypeOfBetEnum.values.map((value) => value.type).toList(),
                  onChanged: (value) => _betType = value,
                ),
                BasicTextFieldForm(
                  title: '\$ Placed',
                  obligatory: true,
                  controller: _moneyPlacedController,
                  formatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))],
                ),
                DropdownAndTextFieldForm(
                  title: 'Gained / Lost',
                  controller: _gainedOrLostController,
                  obligatory: true,
                  onChanged: (value) => _gainedOrLost = value,
                  formatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))],
                ),
                BasicTextFieldForm(title: 'Date Placed', controller: _datePlacedController, formatters: [DateFormatter()]),
                if (modalHeight != 351)
                  Text(
                    'Bet Incomplete',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
              ],
            ),
          ),
        ),
      );
}
