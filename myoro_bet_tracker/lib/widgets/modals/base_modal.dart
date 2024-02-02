import 'package:flutter/material.dart';
import 'package:myoro_bet_tracker/widgets/buttons/button_without_feedback.dart';
import 'package:myoro_bet_tracker/widgets/buttons/text_hover_button.dart';
import 'package:myoro_bet_tracker/widgets/modals/bet_form_modal.dart';

/// Modal used to create all other modals in the application
///
/// In other modal files, use static void show(BuildContext) => showDialog... to call BaseModal
/// If your modal is stateful, check a modal like [BetFormModal] to see how to use static void show
class BaseModal extends StatelessWidget {
  /// Title of the modal
  final String? title;

  /// The (mandatory) size of the modal
  final Size size;

  /// Dictates whether there will be a yes/no buttons at the footer of the modal
  final bool showFooterButtons;

  /// onTap function for the positive action button of [BaseModal]
  final Function? yesOnTap;

  /// Text of the positive action button of [BaseModal]
  final String? yesText;

  /// Content of [BaseModal]
  final Widget content;

  /// [TextStyle] of [BaseModal]'s title
  final TextStyle? titleTextStyle;

  const BaseModal({
    super.key,
    this.title,
    required this.size,
    this.showFooterButtons = false,
    this.yesOnTap,
    this.yesText,
    required this.content,
    this.titleTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    if (showFooterButtons) {
      assert(yesOnTap != null && yesText != null);
    }

    final ThemeData theme = Theme.of(context);
    final TextStyle titleStyle = titleTextStyle == null ? theme.textTheme.titleLarge! : titleTextStyle!;

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
          child: Material(
            // Allows custom widgets like [TextHoverButton] to work propertly
            child: Column(
              children: [
                Row(
                  children: [
                    if (title != null) Text(title!, style: titleStyle),
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
                content,
                if (showFooterButtons) ...[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Row(
                      children: [
                        TextHoverButton(
                          onTap: () => yesOnTap!(),
                          text: yesText!,
                          expanded: true,
                          bordered: true,
                        ),
                        const SizedBox(width: 10),
                        TextHoverButton(
                          onTap: () => Navigator.pop(context),
                          text: 'Cancel',
                          expanded: true,
                          bordered: true,
                        ),
                      ],
                    ),
                  ),
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}
