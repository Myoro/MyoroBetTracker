import 'package:flutter/material.dart';

class IconAndTextHoverButton extends StatelessWidget {
  final Function onTap;
  final IconData icon;
  final String text;

  const IconAndTextHoverButton({
    super.key,
    required this.onTap,
    required this.icon,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: theme.colorScheme.onPrimary,
          width: 2
        )
      ),
      child: InkWell(
        onTap: () => onTap(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: theme.colorScheme.onPrimary),
              Text(text, style: theme.textTheme.bodyMedium)
            ]
          ),
        )
      ),
    );
  }
}