import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Input extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;

  const Input({
    super.key,
    required this.controller,
    this.hintText
  });

  @override
  Widget build(BuildContext context) => TextField(
    controller: controller,
    inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))],
    style: Theme.of(context).textTheme.bodyMedium,
    textAlign: TextAlign.center,
    decoration: InputDecoration(
      hintText: hintText,
      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.onPrimary)),
      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.onPrimary))
    )
  );
}