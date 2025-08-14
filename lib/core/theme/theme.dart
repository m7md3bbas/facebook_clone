import 'package:flutter/material.dart';

class FacebookTheme {
  static const Color fbPrimary = Color(0xFF1877F2);
  static const Color fbBackgroundLight = Colors.white;
  static const Color fbBackgroundDark = Color(0xFF18191A);
  static const Color fbSurfaceLight = Colors.white;
  static const Color fbSurfaceDark = Color(0xFF242526);
  static const Color fbTextLight = Colors.black87;
  static const Color fbTextDark = Colors.white;
  static const Color fbSecondaryTextLight = Colors.black54;
  static const Color fbSecondaryTextDark = Colors.white70;
  static const Color fbDividerLight = Color(0xFFE4E6EB);
  static const Color fbDividerDark = Color(0xFF3A3B3C);

  static final ThemeData light = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: fbBackgroundLight,
    appBarTheme: const AppBarTheme(
      backgroundColor: fbPrimary,
      foregroundColor: Colors.white,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      iconTheme: IconThemeData(color: Colors.white),
    ),
    colorScheme: const ColorScheme.light(
      primary: fbPrimary,
      secondary: fbPrimary,
      surface: fbSurfaceLight,
      background: fbBackgroundLight,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: fbTextLight,
      onBackground: fbTextLight,
      error: Colors.red,
    ),
    dividerTheme: const DividerThemeData(color: fbDividerLight),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 16, color: fbTextLight),
      bodyMedium: TextStyle(fontSize: 14, color: fbTextLight),
      bodySmall: TextStyle(fontSize: 12, color: fbSecondaryTextLight),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: fbPrimary,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      ),
    ),
  );

  static final ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: fbBackgroundDark,
    appBarTheme: const AppBarTheme(
      backgroundColor: fbSurfaceDark,
      foregroundColor: fbTextDark,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: fbTextDark,
      ),
      iconTheme: IconThemeData(color: fbTextDark),
    ),
    colorScheme: const ColorScheme.dark(
      primary: fbPrimary,
      secondary: fbPrimary,
      surface: fbSurfaceDark,
      background: fbBackgroundDark,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: fbTextDark,
      onBackground: fbTextDark,
      error: Colors.red,
    ),
    dividerTheme: const DividerThemeData(color: fbDividerDark),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 16, color: fbTextDark),
      bodyMedium: TextStyle(fontSize: 14, color: fbTextDark),
      bodySmall: TextStyle(fontSize: 12, color: fbSecondaryTextDark),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: fbPrimary,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      ),
    ),
  );
}
