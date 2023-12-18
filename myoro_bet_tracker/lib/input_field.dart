import "package:flutter/material.dart";
import "package:flutter/services.dart";

class InputField extends StatelessWidget {
  final Function onChanged;
  final String placeholder;

  const InputField({
    super.key,
    required this.onChanged,
    this.placeholder = ""
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final OutlineInputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: theme.colorScheme.onPrimary,
        width: 2
      )
    );

    return Expanded(
      child: TextField(
        onChanged: (text) => onChanged(text),
        textAlign: TextAlign.center,
        inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))],
        decoration: InputDecoration(
          focusedBorder: border,
          enabledBorder: border,
          hintText: placeholder
        ),
      ),
    );
  }
}