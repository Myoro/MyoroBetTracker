import 'package:flutter/material.dart';

/// Basic button without feedback
class ButtonWithoutFeedback extends StatelessWidget {
  /// Function called by onTap
  final Function onTap;

  /// Contents of the button
  final Widget child;

  const ButtonWithoutFeedback({
    super.key,
    required this.onTap,
    required this.child,
  });

  @override
  Widget build(BuildContext context) => MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => onTap(),
          child: child,
        ),
      );
}
