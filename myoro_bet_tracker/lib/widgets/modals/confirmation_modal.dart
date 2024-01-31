import 'package:flutter/material.dart';
import 'package:myoro_bet_tracker/widgets/modals/base_modal.dart';

/// Modal used for simple dialog confirmations
class ConfirmationModal {
  static void show(
    BuildContext context,
    {
      required String title,
      required String message,
      required Function yesOnTap,
    }
  ) => showDialog(
    context: context,
    builder: (context) => BaseModal(
      size: const Size(300, 165),
      title: title,
      showFooterButtons: true,
      yesText: 'Yes',
      yesOnTap: () => yesOnTap(),
      content: Text(
        message,
        style: Theme.of(context).textTheme.bodyMedium,
        textAlign: TextAlign.center,
      ),
    ),
  );
}