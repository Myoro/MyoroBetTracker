import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myoro_bet_tracker/enums/gained_or_lost.enum.dart';
import 'package:myoro_bet_tracker/widgets/inputs/base_dropdown.dart';
import 'package:myoro_bet_tracker/widgets/inputs/base_text_field.dart';

/// Form with [BaseDropdown] and [BaseTextField]
class DropdownAndTextFieldForm extends StatelessWidget {
  /// Title of [DropdownAndTextFieldForm]
  final String title;

  /// Sets if [BaseTextField] is an obligatory input
  final bool obligatory;

  /// Input formatters of [BaseTextField]
  final List<TextInputFormatter> formatters;

  /// Controller of [BaseTextField]
  final TextEditingController controller;

  /// onChanged of [BaseDropdown]
  final Function(String) onChanged;

  const DropdownAndTextFieldForm({
    super.key,
    required this.title,
    this.obligatory = false,
    required this.controller,
    required this.onChanged,
    this.formatters = const [],
  });

  @override
  Widget build(BuildContext context) => Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 9),
              child: Text(
                '${obligatory ? '*' : ''}$title',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Padding(
            padding: const EdgeInsets.only(bottom: 9),
            child: BaseTextField(
              size: const Size(82, 40),
              controller: controller,
              formatters: formatters,
            ),
          ),
          const SizedBox(width: 10),
          BaseDropdown(
            items: GainedOrLostEnum.values.map((value) => value.result).toList(),
            onChanged: (value) => onChanged(value),
          ),
        ],
      );
}
