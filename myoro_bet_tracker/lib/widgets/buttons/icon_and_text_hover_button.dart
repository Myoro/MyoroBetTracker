import 'package:flutter/material.dart';

class IconAndTextHoverButton extends StatefulWidget {
  final Function onTap;
  final IconData icon;
  final String text;
  final EdgeInsets padding;
  final TextStyle? textStyle;

  const IconAndTextHoverButton({
    super.key,
    required this.onTap,
    required this.icon,
    required this.text,
    this.padding = const EdgeInsets.all(10),
    this.textStyle
  });

  @override
  State<IconAndTextHoverButton> createState() => _IconAndTextHoverButtonState();
}

class _IconAndTextHoverButtonState extends State<IconAndTextHoverButton> {
  final ValueNotifier<bool> _hovered = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return ValueListenableBuilder(
      valueListenable: _hovered,
      builder: (context, hovered, child) {
        final TextStyle textStyle = widget.textStyle ?? theme.textTheme.displayMedium!;

        return Container(
          decoration: BoxDecoration(
            color: hovered ? theme.colorScheme.onPrimary : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: theme.colorScheme.onPrimary,
              width: 2
            )
          ),
          child: Padding(
            padding: widget.padding,
            child: InkWell(
              onHover: (value) => _hovered.value = value,
              onTap: () => widget.onTap(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    widget.icon,
                    size: 22,
                    color: hovered ? theme.colorScheme.primary : theme.colorScheme.onPrimary
                  ),
                  const SizedBox(width: 5),
                  Text(
                    widget.text,
                    style: textStyle.copyWith(color: hovered ? theme.colorScheme.primary : theme.colorScheme.onPrimary)
                  )
                ]
              )
            ),
          ),
        );
      }
    );
  }
}