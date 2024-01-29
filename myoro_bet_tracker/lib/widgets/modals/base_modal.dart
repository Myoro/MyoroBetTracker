import 'package:flutter/material.dart';
import 'package:myoro_bet_tracker/widgets/buttons/button_without_feedback.dart';

/// Modal used to create all other modals in the application
///
/// Static function stucture to avoid using [showDialog] elsewhere in the application
class BaseModal {
  static void show(
    BuildContext context, {
    String? title,
    required Size size,
    required Widget content,
  }) =>
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            final ThemeData theme = Theme.of(context);

            return Center(
              child: Container(
                width: size.width,
                height: size.height,
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    width: 2,
                    color: theme.colorScheme.onPrimary,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 5,
                    bottom: 5,
                    left: 10,
                    right: 5,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          if (title != null)
                            Text(
                              title,
                              style: theme.textTheme.titleMedium,
                            ),
                          const Spacer(),
                          ButtonWithoutFeedback(
                            onTap: () => Navigator.pop(context),
                            child: Icon(
                              Icons.close,
                              size: 30,
                              color: theme.colorScheme.onPrimary,
                            ),
                          ),
                        ],
                      ),
                      content
                    ],
                  ),
                ),
              ),
            );
          });
}
