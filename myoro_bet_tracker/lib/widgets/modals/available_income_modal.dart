import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myoro_bet_tracker/blocs/available_income_cubit.dart';
import 'package:myoro_bet_tracker/widgets/inputs/base_text_field.dart';
import 'package:myoro_bet_tracker/widgets/modals/base_modal.dart';

/// Modal used to set or edit the available income the user has
class AvailableIncomeModal extends StatefulWidget {
  const AvailableIncomeModal({ super.key });

  static void show(BuildContext context) => showDialog(
    context: context,
    builder: (context) => const AvailableIncomeModal(),
  );

  @override
  State<AvailableIncomeModal> createState() => _AvailableIncomeModalState();
}

class _AvailableIncomeModalState extends State<AvailableIncomeModal> {
  final TextEditingController _controller = TextEditingController();
  final ValueNotifier<double> _modalHeight = ValueNotifier<double>(157);

  void setAvailableIncome() {
    if(_controller.text.isEmpty) {
      _modalHeight.value = 195;
      Future.delayed(const Duration(milliseconds: 1500), () => _modalHeight.value = 157);
    } else {
      BlocProvider.of<AvailableIncomeCubit>(context).setAvailableIncome(
        double.parse(double.parse(_controller.text).toStringAsFixed(2)),
      );
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _modalHeight.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return ValueListenableBuilder(
      valueListenable: _modalHeight,
      builder: (context, modalHeight, child) => BaseModal(
        size: Size(280, modalHeight),
        title: 'Set Available Income',
        titleTextStyle: textTheme.titleMedium,
        showFooterButtons: true,
        yesText: 'Save',
        yesOnTap: () => setAvailableIncome(),
        content: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Column(
            children: [
              Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text('\$', style: textTheme.bodyLarge),
                  const SizedBox(width: 5),
                  BaseTextField(
                    controller: _controller,
                    size: const Size(220, 40),
                    formatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))],
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              if(modalHeight != 157) ...[
                const SizedBox(height: 12),
                Text(
                  'Blank Field',
                  style: textTheme.headlineMedium,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}