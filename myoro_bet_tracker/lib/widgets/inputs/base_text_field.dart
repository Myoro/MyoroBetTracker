import 'package:flutter/material.dart';

/// Creates all [TextField]s in the application
class BaseTextField extends StatelessWidget {
  final Size size;

  const BaseTextField({
    super.key,
    required this.size,
  });

  @override
  Widget build(BuildContext context) => SizedBox(
    width: size.width,
    height: size.height,
    child: TextField(
    ),
  );
}
