import 'package:flutter/material.dart';
import 'package:myoro_bet_tracker/widgets/app_bars/home_screen_app_bar.dart';
import 'package:myoro_bet_tracker/widgets/inputs/basic_dropdown_form.dart';
import 'package:myoro_bet_tracker/widgets/inputs/basic_text_field_form.dart';
import 'package:myoro_bet_tracker/widgets/inputs/dropdown_and_text_field_form.dart';
import 'package:myoro_bet_tracker/widgets/modals/base_modal.dart';

/// Modal used to create bets
///
/// Used in [HomeScreenAppBar]
class CreateBetModal {
  static void show(BuildContext context) => BaseModal.show(
        context,
        title: 'Create Bet',
        size: const Size(350, 300),
        content: const Column(
          children: [
            BasicTextFieldForm(title: 'Bet Name'),
            BasicDropdownForm(title: 'Sport or Casino?'),
            BasicTextFieldForm(title: '\$ Placed'),
            DropdownAndTextFieldForm(title: 'Gained / Lost'),
            BasicTextFieldForm(title: 'Date Placed'),
          ],
        ),
      );
}
