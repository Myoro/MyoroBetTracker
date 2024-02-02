import 'package:flutter/material.dart';

/// Widget that all cards will use as a base in the application
class BaseCard extends StatelessWidget {
  /// Title of [BaseCard]
  final String? title;

  /// Additional width so the programmer doesn't have to wrap [BaseCard] with [SizedBox]
  final double? width;

  /// Additional height argument so the programmer doesn't have to wrap [BaseCard] with [SizedBox]
  final double? height;

  /// Additional expanded argument so the programmer doesn't have to wrap [BaseCard] with [Expanded]
  final bool expanded;

  /// Contents of [BaseCard]
  final Widget content;

  const BaseCard({
    super.key,
    this.title,
    this.width,
    this.height,
    this.expanded = false,
    required this.content,
  });

  @override
  Widget build(BuildContext context) => expanded
      ? Expanded(child: _Widget(title: title, width: width, height: height, content: content))
      : _Widget(title: title, width: width, height: height, content: content);
}

class _Widget extends StatelessWidget {
  final String? title;
  final double? width;
  final double? height;
  final Widget content;

  const _Widget({
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
                style: theme.textTheme.titleMedium,
              ),
            const SizedBox(height: 5),
            content,
          ],
        ),
      ),
    );
  }
}
