import 'package:flutter/material.dart';
import 'package:myoro_bet_tracker/widgets/inputs/base_dropdown.dart';

/// Dropdown form for the application
class BasicDropdownForm extends StatelessWidget {
  final String title;
  final List<String> items;
  final Function(String) onChanged;

  const BasicDropdownForm({
    super.key,
    required this.title,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) => Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 9),
              child: Text(
                title,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(width: 10),
          BaseDropdown(
            items: items,
            onChanged: onChanged,
            width: 180,
          ),
        ],
      );
}
