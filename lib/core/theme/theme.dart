import 'package:flutter/material.dart';

class FacebookTheme {
  static const Color fbPrimary = Color(0xff0866ff);
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
      foregroundColor: Colors.white,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      iconTheme: IconThemeData(color: Colors.black),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        borderSide: BorderSide(
          color: Color(0xFF65676B), // Facebook blue
          width: 2,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        borderSide: BorderSide(
          color: Color.fromARGB(255, 192, 195, 201), // Gray for unfocused state
          width: 1.5,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        borderSide: BorderSide(color: Color(0xFF65676B), width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        borderSide: BorderSide(color: Colors.red, width: 2),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        borderSide: BorderSide(color: Colors.red, width: 2),
      ),
    ),

    colorScheme: const ColorScheme.light(
      primary: fbSecondaryTextLight,
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
        minimumSize: Size.fromHeight(50),
        backgroundColor: fbPrimary,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
          side: BorderSide(color: fbPrimary),
        ),
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
