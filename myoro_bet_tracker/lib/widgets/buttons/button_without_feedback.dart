import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Basic button without feedback
class ButtonWithoutFeedback extends StatefulWidget {
  /// Function called by onTap
  final Function onTap;

  /// Contents of the button
  final Widget child;

  /// If not null, shows a tooltip when [ButtonWithoutFeedback] is hovered
  final String? tooltip;

  const ButtonWithoutFeedback({
    super.key,
    required this.onTap,
    required this.child,
    this.tooltip,
  });

  @override
  State<ButtonWithoutFeedback> createState() => _ButtonWithoutFeedbackState();
}

class _ButtonWithoutFeedbackState extends State<ButtonWithoutFeedback> {
  final ValueNotifier<SystemMouseCursor> _cursor = ValueNotifier<SystemMouseCursor>(SystemMouseCursors.basic);

  @override
  void dispose() {
    _cursor.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => ValueListenableBuilder(
        valueListenable: _cursor,
        builder: (context, cursor, child) => Tooltip(
          message: widget.tooltip ?? '',
          child: MouseRegion(
            cursor: cursor,
            onEnter: (_) => _cursor.value = SystemMouseCursors.click,
            onExit: (_) => _cursor.value = SystemMouseCursors.basic,
            child: GestureDetector(
              onTap: () => widget.onTap(),
              child: widget.child,
            ),
          ),
        ),
      );
}
