import 'package:flutter/material.dart';

class AppThemes {
  /// Light Theme
  static final lightTheme = ThemeData(
    primaryColor: const Color(0xFF0A84FF),
    scaffoldBackgroundColor: const Color(0xFFF8F9FA),
    cardColor: Colors.white.withOpacity(0.9),
    shadowColor: Colors.grey.withOpacity(0.3),
    iconTheme: const IconThemeData(color: Colors.black87),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Color(0xFF212121), fontSize: 16, fontWeight: FontWeight.w500),
      bodyMedium: TextStyle(color: Color(0xFF616161), fontSize: 14, fontWeight: FontWeight.w400),
      headlineMedium: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white70,
      elevation: 0,
      titleTextStyle: TextStyle(color: Colors.black87, fontSize: 20, fontWeight: FontWeight.bold),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF0A84FF),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 6,
      ),
    ),
    colorScheme: const ColorScheme.light(
      primary: Color(0xFF0A84FF),
      secondary: Color(0xFFFF9800),
      error: Color(0xFFE53935),
    ),
  );

  /// Dark Theme
  static final darkTheme = ThemeData(
    primaryColor: const Color(0xFF081F3F),
    scaffoldBackgroundColor: const Color(0xFF121212),
    cardColor: Colors.black.withOpacity(0.6),
    shadowColor: Colors.black.withOpacity(0.7),
    iconTheme: const IconThemeData(color: Colors.white70),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Color(0xFFE0E0E0), fontSize: 16, fontWeight: FontWeight.w500),
      bodyMedium: TextStyle(color: Color(0xFFBDBDBD), fontSize: 14, fontWeight: FontWeight.w400),
      headlineMedium: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black54,
      elevation: 0,
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFFF9800),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 8,
      ),
    ),
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF081F3F),
      secondary: Color(0xFFFF9800),
      error: Color(0xFFE53935),
    ),
  );

  /// Theme Getter
  static ThemeData of(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark ? darkTheme : lightTheme;
  }
}