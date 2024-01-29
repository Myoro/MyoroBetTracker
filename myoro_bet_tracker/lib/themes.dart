import 'package:flutter/material.dart';

TextStyle _textStyle({
  required double fontSize,
  FontWeight fontWeight = FontWeight.normal,
}) =>
    TextStyle(
      fontSize: fontSize,
    );

ThemeData createTheme(bool isDarkMode) => ThemeData(
      colorScheme: ColorScheme(
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
        primary: isDarkMode ? const Color(0xFF181818) : const Color(0xFFEDE6D6),
        onPrimary: isDarkMode ? const Color(0xFFEDE6D6) : const Color(0xFF181818),
        error: Colors.red,
        onError: isDarkMode ? const Color(0xFF181818) : const Color(0xFFEDE6D6),

        // Unused
        secondary: isDarkMode ? const Color(0xFF181818) : const Color(0xFFEDE6D6),
        onSecondary: isDarkMode ? const Color(0xFFEDE6D6) : const Color(0xFF181818),
        background: isDarkMode ? const Color(0xFF181818) : const Color(0xFFEDE6D6),
        onBackground: isDarkMode ? const Color(0xFFEDE6D6) : const Color(0xFF181818),
        surface: isDarkMode ? const Color(0xFF181818) : const Color(0xFFEDE6D6),
        onSurface: isDarkMode ? const Color(0xFFEDE6D6) : const Color(0xFF181818),
      ),
      textTheme: TextTheme(
        titleLarge: _textStyle(fontSize: 24, fontWeight: FontWeight.bold),
        titleMedium: _textStyle(fontSize: 20, fontWeight: FontWeight.bold),
        titleSmall: _textStyle(fontSize: 16, fontWeight: FontWeight.bold),
        bodyLarge: _textStyle(fontSize: 24),
        bodyMedium: _textStyle(fontSize: 20),
        bodySmall: _textStyle(fontSize: 16),
      ),
    );
