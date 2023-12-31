import 'package:flutter/material.dart';

final ThemeData dark = ThemeData(
  colorScheme: const ColorScheme(
    brightness:     Brightness.dark,
    primary:      Color(0xFF181818),
    onPrimary:    Color(0xFFEDE6D6),
    secondary:    Color(0xFF181818),
    onSecondary:  Color(0xFFEDE6D6),
    error:        Colors.red,
    onError:      Color(0xFFEDE6D6),
    background:   Color(0xFF181818),
    onBackground: Color(0xFFEDE6D6),
    surface:      Color(0xFF181818),
    onSurface:    Color(0xFFEDE6D6)
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontSize:   24,
      fontWeight: FontWeight.bold,
      color:     Color(0xFFEDE6D6)
    ),
    titleMedium: TextStyle(
      fontSize:   20,
      fontWeight: FontWeight.bold,
      color:     Color(0xFFEDE6D6)
    ),
    titleSmall: TextStyle(
      fontSize:   18,
      fontWeight: FontWeight.bold,
      color:     Color(0xFFEDE6D6)
    ),
    bodyMedium: TextStyle(
      fontSize: 20,
      color:    Color(0xFFEDE6D6)
    ),
    bodySmall: TextStyle(
      fontSize: 18,
      color:    Color(0xFFEDE6D6)
    ),
  ),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor:          const Color(0xFFEDE6D6),
    selectionColor:       const Color(0xFFEDE6D6).withOpacity(0.3),
    selectionHandleColor: const Color(0xFFEDE6D6)
  )
);

final ThemeData light = ThemeData(
  colorScheme: const ColorScheme(
    brightness:     Brightness.dark,
    primary:      Color(0xFFEDE6D6),
    onPrimary:    Color(0xFF181818),
    secondary:    Color(0xFFEDE6D6),
    onSecondary:  Color(0xFF181818),
    error:        Colors.red,
    onError:      Color(0xFF181818),
    background:   Color(0xFFEDE6D6),
    onBackground: Color(0xFF181818),
    surface:      Color(0xFFEDE6D6),
    onSurface:    Color(0xFF181818)
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontSize:   24,
      fontWeight: FontWeight.bold,
      color:     Color(0xFF181818)
    ),
    titleMedium: TextStyle(
      fontSize:   20,
      fontWeight: FontWeight.bold,
      color:     Color(0xFF181818)
    ),
    titleSmall: TextStyle(
      fontSize:   18,
      fontWeight: FontWeight.bold,
      color:     Color(0xFF181818)
    ),
    bodyMedium: TextStyle(
      fontSize: 20,
      color:    Color(0xFF181818)
    ),
    bodySmall: TextStyle(
      fontSize: 18,
      color:    Color(0xFF181818)
    )
  ),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor:          const Color(0xFF181818),
    selectionColor:       const Color(0xFF181818).withOpacity(0.3),
    selectionHandleColor: const Color(0xFF181818)
  )
);