import 'package:flutter/material.dart';

/// Basic hover button with only an Icon within it
class IconHoverButton extends StatefulWidget {
  /// When will be executed when [IconHoverButton] is clicked
  final Function onTap;

  /// Icon of [IconHoverButton]
  final IconData icon;

  const IconHoverButton({
    super.key,
    required this.onTap,
    required this.icon,
  });

  @override
  State<IconHoverButton> createState() => _IconHoverButtonState();
}

class _IconHoverButtonState extends State<IconHoverButton> {
  final ValueNotifier<bool> _hovered = ValueNotifier<bool>(false);

  @override
  void dispose() {
    _hovered.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return ValueListenableBuilder(
      valueListenable: _hovered,
      builder: (context, hovered, child) => InkWell(
        hoverColor: Colors.transparent,
        focusColor: Colors.transparent,
        onHover: (value) => _hovered.value = value,
        onTap: () => widget.onTap(),
        child: Container(
          decoration: BoxDecoration(
            color: !hovered ? Colors.transparent : colorScheme.onPrimary,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(3),
            child: Icon(
              widget.icon,
              size: 20,
              color: !hovered ? colorScheme.onPrimary : colorScheme.primary,
            ),
          ),
        ),
      ),
    );
  }
}
