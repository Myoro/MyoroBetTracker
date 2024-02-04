import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myoro_bet_tracker/widgets/inputs/base_text_field.dart';

/// Form for every [TextField] in the application
class BasicTextFieldForm extends StatelessWidget {
  /// Displays an asteriks next to title
  final bool obligatory;

  /// Title of [BasicTextFieldForm]
  final String title;

  /// Width of [BaseTextField]
  final double width;

  /// Input formatters of [BaseTextField]
  final List<TextInputFormatter> formatters;

  /// Controller of [BaseTextField]
  final TextEditingController controller;

  const BasicTextFieldForm({
    super.key,
    this.obligatory = false,
    required this.title,
    required this.controller,
    this.formatters = const [],
    required this.width,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 9),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Text(
                '${obligatory ? '* ' : ''}$title',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(width: 10),
            BaseTextField(
              size: Size(width, 40),
              controller: controller,
              formatters: formatters,
            ),
          ],
        ),
      );
}
