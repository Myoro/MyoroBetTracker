import 'package:flutter/material.dart';

/// Form with [BaseDropdown] and [BaseTextField]
class DropdownAndTextFieldForm extends StatelessWidget {
  final String title;

  const DropdownAndTextFieldForm({
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
