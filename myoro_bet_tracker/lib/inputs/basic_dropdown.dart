import 'package:flutter/material.dart';

class BasicDropdown extends StatelessWidget {
  final double height;

  const BasicDropdown({ super.key, this.height = 40 });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: theme.colorScheme.onPrimary,
          width: 2
        )
      ),
      child: DropdownButton(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        underline: Container(), // Removes the default underline
        items: [
          DropdownMenuItem(child: Text(
            'Poopoo',
            style: theme.textTheme.bodyMedium
          ))
        ],
        onChanged: (value) {} // TODO
      ),
    );
  }
}