import 'package:flutter/material.dart';
import 'package:myoro_bet_tracker/widgets/app_bars/home_screen_app_bar.dart';
import 'package:myoro_bet_tracker/widgets/modals/base_modal.dart';

/// Modal used to create bets
///
/// Used in [HomeScreenAppBar]
class CreateBetModal {
  static void show(BuildContext context) => BaseModal.show(
        context,
        title: 'Create Bet',
        content: const Text('Start'),
      );
}
