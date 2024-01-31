import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Creates all [TextField]s in the application
class BaseTextField extends StatelessWidget {
  /// Width & height for [BaseTextField]
  final Size size;

  /// [TextEditingController] for [BaseTextField]
  final TextEditingController controller;

  /// List of [TextInputFormatter], i.e. only allowing numbers and dots
  final List<TextInputFormatter> formatters;

  /// Decides if the text is centered or not
  final TextAlign textAlign;

  const BaseTextField({
    super.key,
    required this.size,
    required this.controller,
    this.formatters = const [],
    this.textAlign = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final UnderlineInputBorder border = UnderlineInputBorder(
      borderSide: BorderSide(
        width: 2,
        color: theme.colorScheme.onPrimary,
      ),
    );

    return SizedBox(
      width: size.width,
      height: size.height,
      child: TextField(
        controller: controller,
        style: theme.textTheme.bodyMedium,
        inputFormatters: formatters,
        textAlign: textAlign,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(bottom: 8),
          focusedBorder: border,
          enabledBorder: border,
        ),
      ),
    );
  }
}
