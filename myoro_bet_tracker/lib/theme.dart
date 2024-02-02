import 'package:flutter/material.dart';

TextStyle _textStyle(
  bool isDarkMode,
  {
    required double fontSize,
    FontWeight fontWeight = FontWeight.normal,
    FontStyle fontStyle = FontStyle.normal,
  }
) =>
    TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      color: isDarkMode ? const Color(0xFFEDE6D6) : const Color(0xFF181818),
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
        // Normal styles
        bodyLarge: _textStyle(isDarkMode, fontSize: 24),
        bodyMedium: _textStyle(isDarkMode, fontSize: 20),
        bodySmall: _textStyle(isDarkMode, fontSize: 16),
        // Bolded styles
        titleLarge: _textStyle(isDarkMode, fontSize: 24, fontWeight: FontWeight.bold),
        titleMedium: _textStyle(isDarkMode, fontSize: 20, fontWeight: FontWeight.bold),
        titleSmall: _textStyle(isDarkMode, fontSize: 16, fontWeight: FontWeight.bold),
        // Italicized styles
        headlineLarge: _textStyle(isDarkMode, fontSize: 24, fontStyle: FontStyle.italic),
        headlineMedium: _textStyle(isDarkMode, fontSize: 20, fontStyle: FontStyle.italic),
        headlineSmall: _textStyle(isDarkMode, fontSize: 16, fontStyle: FontStyle.italic),
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: isDarkMode ? const Color(0xFFEDE6D6) : const Color(0xFF181818),
        selectionColor: isDarkMode ? const Color(0xFFEDE6D6).withOpacity(0.3) : const Color(0xFF181818).withOpacity(0.3),
        selectionHandleColor: isDarkMode ? const Color(0xFFEDE6D6).withOpacity(0.3) : const Color(0xFF181818).withOpacity(0.3),
      ),
    );
