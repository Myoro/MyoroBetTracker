import 'package:flutter/material.dart';

/// Widget that all cards will use as a base in the application
class BaseCard extends StatelessWidget {
  /// Title of [BaseCard]
  final String? title;

  /// Additional width so the programmer doesn't have to wrap [BaseCard] with [SizedBox]
  final double? width;

  /// Additional height argument so the programmer doesn't have to wrap [BaseCard] with [SizedBox]
  final double? height;

  /// Contents of [BaseCard]
  final Widget content;

  const BaseCard({
    super.key,
    this.title,
    this.width,
    this.height,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: theme.colorScheme.onPrimary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (title != null)
              Text(
                title!,
                style: theme.textTheme.titleLarge,
              ),
            const SizedBox(height: 10),
            content,
          ],
        ),
      ),
    );
  }
}
