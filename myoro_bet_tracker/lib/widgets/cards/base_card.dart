import 'package:flutter/material.dart';

/// Widget used to create every card in the application
class BaseCard extends StatelessWidget {
  /// Contents of the card
  final Widget content;

  const BaseCard({ super.key, required this.content });

  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.1),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: content,
    ),
  );
}