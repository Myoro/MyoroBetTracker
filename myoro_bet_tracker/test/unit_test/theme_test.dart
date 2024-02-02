import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myoro_bet_tracker/theme.dart';

void main() {
  test('theme.dart Unit Test', () {
    final ThemeData dark = createTheme(true);
    expect(dark.colorScheme.brightness, Brightness.dark);
    expect(dark.colorScheme.primary, const Color(0xFF181818));
    expect(dark.colorScheme.onPrimary, const Color(0xFFEDE6D6));
    expect(dark.colorScheme.error, Colors.red);
    expect(dark.colorScheme.onError, const Color(0xFF181818));
    expect(dark.colorScheme.secondary, const Color(0xFF181818));
    expect(dark.colorScheme.onSecondary, const Color(0xFFEDE6D6));
    expect(dark.colorScheme.background, const Color(0xFF181818));
    expect(dark.colorScheme.onBackground, const Color(0xFFEDE6D6));
    expect(dark.colorScheme.surface, const Color(0xFF181818));
    expect(dark.colorScheme.onSurface, const Color(0xFFEDE6D6));
    expect(dark.textSelectionTheme.cursorColor, const Color(0xFFEDE6D6));
    expect(dark.textSelectionTheme.selectionColor, const Color(0xFFEDE6D6).withOpacity(0.3));
    expect(dark.textSelectionTheme.selectionHandleColor, const Color(0xFFEDE6D6).withOpacity(0.3));

    final ThemeData light = createTheme(false);
    expect(light.colorScheme.brightness, Brightness.light);
    expect(light.colorScheme.primary, const Color(0xFFEDE6D6));
    expect(light.colorScheme.onPrimary, const Color(0xFF181818));
    expect(light.colorScheme.error, Colors.red);
    expect(light.colorScheme.onError, const Color(0xFFEDE6D6));
    expect(light.colorScheme.secondary, const Color(0xFFEDE6D6));
    expect(light.colorScheme.onSecondary, const Color(0xFF181818));
    expect(light.colorScheme.background, const Color(0xFFEDE6D6));
    expect(light.colorScheme.onBackground, const Color(0xFF181818));
    expect(light.colorScheme.surface, const Color(0xFFEDE6D6));
    expect(light.colorScheme.onSurface, const Color(0xFF181818));
    expect(light.textSelectionTheme.cursorColor, const Color(0xFF181818));
    expect(light.textSelectionTheme.selectionColor, const Color(0xFF181818).withOpacity(0.3));
    expect(light.textSelectionTheme.selectionHandleColor, const Color(0xFF181818).withOpacity(0.3));
  });
}
