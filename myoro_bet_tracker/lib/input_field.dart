import "package:flutter/material.dart";

class InputField extends StatelessWidget {
  final String placeholder;

  const InputField({
    super.key,
    this.placeholder = ""
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final UnderlineInputBorder border = UnderlineInputBorder(
      borderSide: BorderSide(color: theme.colorScheme.onPrimary)
    );

    return Expanded(
      child: TextField(
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          focusedBorder: border,
          enabledBorder: border,
          hintText: placeholder
        )
      ),
    );
  }
}