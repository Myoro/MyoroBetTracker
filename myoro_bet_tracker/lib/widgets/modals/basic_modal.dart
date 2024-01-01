import 'package:flutter/material.dart';
import 'package:myoro_bet_tracker/widgets/buttons/button_without_feedback.dart';

class BasicModal extends StatelessWidget {
  final String title;
  final Widget body;
  final double width;

  const BasicModal({
    super.key,
    required this.title,
    required this.body,
    required this.width
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.primary,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: theme.colorScheme.onPrimary,
            width: 2
          )
        ),
        width: width,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Row(
                  children: [
                    Text(title, style: theme.textTheme.titleLarge),
                    const Spacer(),
                    ButtonWithoutFeedback(
                      onTap: () => Navigator.pop(context),
                      child: Icon(
                        Icons.close,
                        size: 30,
                        color: theme.colorScheme.onPrimary
                      )
                    )
                  ]
                ),
              ),
              body
            ]
          ),
        ),
      ),
    );
  }
}