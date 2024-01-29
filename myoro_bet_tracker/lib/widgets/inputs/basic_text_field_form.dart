import 'package:flutter/material.dart';

/// Form for every [TextField] in the application
class BasicTextFieldForm extends StatelessWidget {
  final bool obligatory;
  final String title;

  const BasicTextFieldForm({
    super.key,
    this.obligatory = false,
    required this.title,
  });

  @override
  Widget build(BuildContext context) => Wrap(
        children: [
          Text('${obligatory ? '*' : ''} $title', style: Theme.of(context).textTheme.bodyMedium),
        ],
      );
}
