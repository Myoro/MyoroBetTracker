import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myoro_bet_tracker/enums/gained_or_lost_enum.dart';
import 'package:myoro_bet_tracker/widgets/inputs/base_dropdown.dart';
import 'package:myoro_bet_tracker/widgets/inputs/base_text_field.dart';

/// Form with [BaseDropdown] and [BaseTextField]
///
/// Currently, this is only used for gained/lost forms, so [BaseDropdown] items will remain static
class DropdownAndTextFieldForm extends StatefulWidget {
  /// Title of [DropdownAndTextFieldForm]
  final String title;

  /// Sets if [BaseTextField] is an obligatory input
  final bool obligatory;

  /// Width of [BaseTextField]
  final double width;

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
    required this.width,
    required this.controller,
    required this.onChanged,
    this.formatters = const [],
  });

  @override
  State<DropdownAndTextFieldForm> createState() => _DropdownAndTextFieldFormState();
}

class _DropdownAndTextFieldFormState extends State<DropdownAndTextFieldForm> {
  final ValueNotifier<bool> _showTextField = ValueNotifier<bool>(true);

  @override
  void dispose() {
    _showTextField.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => ValueListenableBuilder(
        valueListenable: _showTextField,
        builder: (context, showTextField, child) => Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 9),
                child: Text(
                  '${widget.obligatory ? '* ' : ''}${widget.title}',
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(width: 10),
            if (showTextField) ...[
              Padding(
                padding: const EdgeInsets.only(bottom: 9),
                child: BaseTextField(
                  size: Size(widget.width, 40),
                  controller: widget.controller,
                  formatters: widget.formatters,
                ),
              ),
              const SizedBox(width: 10),
            ],
            BaseDropdown(
              items: GainedOrLostEnum.values.map((value) => value.result).toList(),
              onChanged: (value) {
                widget.onChanged(value);

                if (value == GainedOrLostEnum.pending.result) {
                  _showTextField.value = false;
                } else {
                  _showTextField.value = true;
                }
              },
              width: showTextField ? null : widget.width + 110,
            ),
          ],
        ),
      );
}
