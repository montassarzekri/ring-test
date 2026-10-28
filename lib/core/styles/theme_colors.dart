import 'package:flutter/material.dart';

class ThemeColors {
  static const _ink = Color(0xFF0A0F1C);
  static const _tonal = Color(0xFF1F2636);
  static const _white = Color(0xFFF8FAFC);
  static const _muted = Color(0xFF6B7385);

  static const ColorScheme scheme = ColorScheme.dark(
    primary: _white,
    onPrimary: _ink,
    secondary: Color(0xFF9AA3B2),
    onSecondary: _ink,
    secondaryContainer: _tonal,
    onSecondaryContainer: _white,
    surface: _ink,
    onSurface: _white,
    onSurfaceVariant: _muted,
    surfaceContainerLow: Color(0xFF121827),
    surfaceContainer: _tonal,
    surfaceContainerHigh: Color(0xFF262E40),
    outline: Color(0xFF2A3142),
    outlineVariant: _tonal,
    error: Color(0xFFF2B8B5),
    onError: Color(0xFF601410),
  );

  static const primaryGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0, .65],
    colors: [Color(0x661C2333), _ink],
  );
}
