import 'package:flutter/material.dart';

/// Dropdown form for the application
class BasicDropdownForm extends StatelessWidget {
  final String title;

  const BasicDropdownForm({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) => Wrap(
        children: [
          Text(title, style: Theme.of(context).textTheme.bodyMedium),
        ],
      );
}
