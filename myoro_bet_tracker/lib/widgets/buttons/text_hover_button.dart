import 'package:flutter/material.dart';

/// Basic hover button with only text
class TextHoverButton extends StatefulWidget {
  /// Function to be called when the button is pressed
  final Function onTap;

  /// Text of the button
  final String text;

  /// Wrap [TextHoverButton] with [Expanded] or not
  final bool expanded;

  /// Apply a outlined border around [TextHoverButton]
  final bool bordered;

  const TextHoverButton({
    super.key,
    required this.onTap,
    required this.text,
    this.expanded = false,
    this.bordered = false,
  });

  @override
  State<TextHoverButton> createState() => _TextHoverButtonState();
}

class _TextHoverButtonState extends State<TextHoverButton> {
  final ValueNotifier<bool> _hovered = ValueNotifier<bool>(false);

  @override
  void dispose() {
    _hovered.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => !widget.expanded ? _widget() : Expanded(child: _widget());

  Widget _widget() {
    final ThemeData theme = Theme.of(context);

    return ValueListenableBuilder(
      valueListenable: _hovered,
      builder: (context, hovered, child) => InkWell(
        hoverColor: Colors.transparent,
        onHover: (value) => _hovered.value = value,
        onTap: () => widget.onTap(),
        child: Container(
          decoration: BoxDecoration(
            color: !hovered ? Colors.transparent : theme.colorScheme.onPrimary,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              width: 2,
              color: widget.bordered ? theme.colorScheme.onPrimary : Colors.transparent,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              widget.text,
              style: theme.textTheme.bodyMedium!.copyWith(
                color: !hovered ? theme.colorScheme.onPrimary : theme.colorScheme.primary,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
