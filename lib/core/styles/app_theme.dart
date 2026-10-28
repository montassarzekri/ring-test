import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velia_test/core/styles/theme_colors.dart';

class AppTheme {
  static final shape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(16),
  );
  static final radius = BorderRadius.circular(16);

  static final scheme = ThemeColors.scheme;
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,

      scaffoldBackgroundColor: scheme.surface,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),

      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: const Size.fromHeight(58),
          shape: RoundedRectangleBorder(borderRadius: radius),
        ),
      ),
      cardTheme: CardThemeData(shape: shape),
      chipTheme: ChipThemeData(
        shape: shape,
        // backgroundColor: (scheme.surfaceContainerLow),
        color: WidgetStatePropertyAll(scheme.surfaceContainerLowest),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: scheme.secondaryContainer,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 18,
        ),
        border: OutlineInputBorder(
          borderRadius: radius,
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: radius,
          borderSide: BorderSide(color: scheme.outline),
        ),
      ),
    );
  }
}
