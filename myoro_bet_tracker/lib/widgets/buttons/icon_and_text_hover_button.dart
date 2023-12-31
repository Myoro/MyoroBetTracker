import 'package:flutter/material.dart';

class IconAndTextHoverButton extends StatefulWidget {
  final Function onTap;
  final IconData icon;
  final String text;
  final bool expanded;

  const IconAndTextHoverButton({
    super.key,
    required this.onTap,
    required this.icon,
    required this.text,
    this.expanded = false
  });

  @override
  State<IconAndTextHoverButton> createState() => _IconAndTextHoverButtonState();
}

class _IconAndTextHoverButtonState extends State<IconAndTextHoverButton> {
  final ValueNotifier<bool> _hovered = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) => !widget.expanded
    ? _widget(Theme.of(context))
    : Expanded(child: _widget(Theme.of(context)));

  Widget _widget(ThemeData theme) => ValueListenableBuilder(
    valueListenable: _hovered,
    builder: (context, hovered, builder) => Container(
      decoration: BoxDecoration(
        color: hovered ? theme.colorScheme.onPrimary : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: theme.colorScheme.onPrimary,
          width: 2
        )
      ),
      child: InkWell(
        onTap: () => widget.onTap(),
        onHover: (value) => _hovered.value = value,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                widget.icon,
                color: hovered ? theme.colorScheme.primary : theme.colorScheme.onPrimary
              ),
              const SizedBox(width: 5),
              Text(
                widget.text,
                style: theme.textTheme.bodyMedium!.copyWith(
                  color: hovered ? theme.colorScheme.primary : theme.colorScheme.onPrimary
                )
              )
            ]
          ),
        )
      ),
    ),
  );
}