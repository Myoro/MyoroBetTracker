import 'package:flutter/material.dart';

class BasicInput extends StatelessWidget {
  final double width;
  final double height;
  final String? hintText;
  final TextEditingController? controller;

  const BasicInput({
    super.key,
    this.width = 100,
    this.height = 40,
    this.hintText,
    this.controller
  });

  @override
  Widget build(BuildContext context) {
    final OutlineInputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.onPrimary,
        width: 2
      )
    );

    return Material( // Required for this widget to work
      child: SizedBox(
        width: width,
        height: height,
        child: TextField(
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium,
          decoration: InputDecoration(
            enabledBorder:  border,
            focusedBorder:  border,
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            hintText: hintText
          ),
          controller: controller
        ),
      ),
    );
  }
}