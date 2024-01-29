import 'package:flutter/material.dart';
import 'package:myoro_bet_tracker/widgets/inputs/base_text_field.dart';

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
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Text('${obligatory ? '*' : ''} $title', style: Theme.of(context).textTheme.bodyMedium),
          const BaseTextField(size: Size(150, 40)),
        ],
      );
}
