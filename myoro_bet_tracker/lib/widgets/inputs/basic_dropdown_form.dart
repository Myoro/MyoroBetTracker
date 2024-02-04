import 'package:flutter/material.dart';
import 'package:myoro_bet_tracker/widgets/inputs/base_dropdown.dart';

/// Dropdown form for the application
class BasicDropdownForm extends StatelessWidget {
  /// Title of [BasicDropdownForm]
  final String title;

  /// Items of [BaseDropdown]
  final List<String> items;

  /// onChange of [BaseDropdown]
  final Function(String) onChanged;

  /// Width of [BaseDropdown]
  final double? width;

  const BasicDropdownForm({
    super.key,
    required this.title,
    required this.items,
    required this.onChanged,
    this.width,
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
            width: width,
          ),
        ],
      );
}
