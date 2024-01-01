import 'package:flutter/material.dart';

class ButtonWithoutFeedback extends StatelessWidget {
  final Function onTap;
  final Widget child;

  const ButtonWithoutFeedback({
    super.key,
    required this.onTap,
    required this.child
  });

  @override
  Widget build(BuildContext context) => MouseRegion(
    cursor: SystemMouseCursors.click,
    child: GestureDetector(
      onTap: () => onTap(),
      child: child
    ),
  );
}