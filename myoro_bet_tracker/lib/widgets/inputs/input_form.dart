import 'package:flutter/material.dart';
import 'package:myoro_bet_tracker/widgets/inputs/basic_input.dart';

class InputForm extends StatelessWidget {
  final String title;
  final bool expanded;
  final bool textExpanded;
  final TextAlign textAlignment;

  const InputForm({
    super.key,
    required this.title,
    this.expanded = false,
    this.textExpanded = false,
    this.textAlignment = TextAlign.right
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
          child: Text(
            '$title:',
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: textAlignment
          )
        ),
      const SizedBox(width: 5),
      BasicInput()
    ]
  );
}