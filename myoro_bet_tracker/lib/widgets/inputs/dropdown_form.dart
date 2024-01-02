import 'package:flutter/material.dart';
import 'package:myoro_bet_tracker/widgets/inputs/basic_dropdown.dart';

class DropdownForm extends StatelessWidget {
  final String title;
  final List<String> dropdownItems;
  final Function onChanged;
  final bool expanded;
  final bool textExpanded;
  final TextAlign textAlignment;
  final bool dropdownExpanded;

  const DropdownForm({
    super.key,
    required this.title,
    required this.dropdownItems,
    required this.onChanged,
    this.expanded = false,
    this.textExpanded = false,
    this.textAlignment = TextAlign.center,
    this.dropdownExpanded = true
  });

  @override
  Widget build(BuildContext context) => !expanded
    ? _widget(context)
    : Expanded(child: _widget(context));

  Widget _widget(BuildContext context) => Row(
    children: [
      !textExpanded
        ?
        Text(
          '$title:',
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: textAlignment
        )
        :
        Expanded(
        child:
          Text(
            '$title:',
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: textAlignment
          ),
        ),
      const SizedBox(width: 10),
      !dropdownExpanded
        ?
        BasicDropdown(items: dropdownItems, onChanged: onChanged)
        :
        Expanded(child: BasicDropdown(items: dropdownItems, onChanged: onChanged))
    ]
  );
}