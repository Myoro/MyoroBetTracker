import 'package:flutter/material.dart';

/// Columned output with a title and the information itself
class FormOutput extends StatelessWidget {
  /// Title of [FormOutput]
  final String title;

  /// Information of [FormOutput]
  final String information;

  const FormOutput({
    super.key,
    required this.title,
    required this.information,
  });

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        Text(title, style: textTheme.titleMedium),
        const SizedBox(height: 5),
        Text(information, style: textTheme.bodyMedium),
      ],
    );
  }
}
