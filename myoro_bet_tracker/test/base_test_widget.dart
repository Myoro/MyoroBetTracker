import 'package:flutter/material.dart';
import 'package:myoro_bet_tracker/theme.dart';

enum WidgetTestType { scaffold, appBar, widget }

class BaseTestWidget extends StatelessWidget {
  final WidgetTestType widgetTestType;
  final Widget child;

  const BaseTestWidget({
    super.key,
    this.widgetTestType = WidgetTestType.widget,
    required this.child,
  });

  @override
  Widget build(BuildContext context) => switch (widgetTestType) {
        WidgetTestType.scaffold => MaterialApp(theme: createTheme(false), home: child),
        WidgetTestType.appBar => MaterialApp(theme: createTheme(false), home: Scaffold(appBar: child as PreferredSizeWidget)),
        WidgetTestType.widget => MaterialApp(theme: createTheme(false), home: Scaffold(body: child))
      };
}
