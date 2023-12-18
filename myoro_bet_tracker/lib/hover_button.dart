import "package:flutter/material.dart";

class HoverButton extends StatefulWidget {
  final String buttonText;
  final Function onTap;
  final IconData? icon;

  const HoverButton({
    super.key,
    required this.buttonText,
    required this.onTap,
    this.icon
  });

  @override
  State<HoverButton> createState() => _HoverButtonState();
}

class _HoverButtonState extends State<HoverButton> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return InkWell(
      onTap: () => widget.onTap(),
      onHover: (hovered) => setState(() => this.hovered = hovered),
      child: Container(
        decoration: BoxDecoration(
          color: hovered ? theme.colorScheme.onPrimary : Colors.transparent,
          border: Border.all(
            color: theme.colorScheme.onPrimary,
            width: 2
          ),
          borderRadius: BorderRadius.circular(10)
        ),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.buttonText,
                style: theme.textTheme.bodySmall!.copyWith(
                  color: hovered ? theme.colorScheme.primary : theme.colorScheme.onPrimary,
                )
              ),
              if(widget.icon != null) ...[
                const SizedBox(width: 3),
                Icon(
                  widget.icon,
                  size: 20, color: hovered ? theme.colorScheme.primary : theme.colorScheme.onPrimary
                )
              ]
            ]
          ),
        ),
      )
    );
  }
}