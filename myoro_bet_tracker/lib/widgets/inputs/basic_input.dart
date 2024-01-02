import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BasicInput extends StatelessWidget {
  final double width;
  final double height;
  final String? hintText;
  final TextEditingController? controller;
  final bool numberFormatters;

  const BasicInput({
    super.key,
    this.width = 100,
    this.height = 40,
    this.hintText,
    this.controller,
    this.numberFormatters = true
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final OutlineInputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.onPrimary,
        width: 2
      )
    );

    return SizedBox(
      width: width,
      height: height,
      child: TextField(
        textAlign: TextAlign.center,
        style: theme.textTheme.bodyMedium,
        inputFormatters: [
          if(numberFormatters) FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))
        ],
        decoration: InputDecoration(
          enabledBorder:  border,
          focusedBorder:  border,
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          hintText: hintText,
          hintStyle: theme.textTheme.bodySmall!.copyWith(
            color: theme.textTheme.bodySmall!.color!.withOpacity(0.8)
          )
        ),
        controller: controller
      ),
    );
  }
}