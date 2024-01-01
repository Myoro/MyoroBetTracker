import 'package:flutter/material.dart';

class BasicDropdown extends StatelessWidget {
  final List<String> items;
  final double width;
  final double height;

  const BasicDropdown({
    super.key,
    required this.items,
    this.height = 40,
    this.width = 100
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    print(items);

    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: theme.colorScheme.onPrimary,
          width: 2
        )
      ),
      child: DropdownButton(
        value: items.isNotEmpty ? items[0] : null,
        isExpanded: true,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        underline: Container(), // Removes the default underline
        items: List.generate(items.length, (index) => DropdownMenuItem<String>(
          value: items[index],
          child: Text(
            items[index],
            style: theme.textTheme.bodyMedium
          )
        )),
        onChanged: (value) {} // TODO
      ),
    );
  }
}