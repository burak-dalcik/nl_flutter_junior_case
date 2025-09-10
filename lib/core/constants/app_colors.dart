import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Figma'dan alınan ana renkler
  static const Color primary = Color(0xFFE50914); // Brand/Primary
  static const Color primaryGradientStart = Color(0xFFE50914); // Gradient başlangıç
  static const Color primaryGradientEnd = Color(0xFF7F050B); // Gradient bitiş
  
  // Arka plan renkleri
  static const Color background = Color(0xFF000000); // Siyah arka plan
  static const Color surface = Color(0xFF1A1A1A);
  
  // Text renkleri - Figma'dan
  static const Color textPrimary = Color(0xFFFFFFFF); // Others/White
  static const Color textSecondary = Color(0xE6FFFFFF); // White - %90
  static const Color textTertiary = Color(0xCCFFFFFF); // White - %80  
  static const Color textHint = Color(0x80FFFFFF); // White - %50
  static const Color textMuted = Color(0x4DFFFFFF); // White - %30
  
  // Input renkleri - Figma'dan
  static const Color inputBackground = Color(0x0DFFFFFF); // White - %5
  static const Color inputBorder = Color(0x33FFFFFF); // White - %20
  static const Color inputFocusedBorder = Color(0xFFE50914); // Primary
  
  // Sosyal medya buton renkleri
  static const Color socialButtonBackground = Color(0x0DFFFFFF); // White - %5
  static const Color socialButtonBorder = Color(0x33FFFFFF); // White - %20
  
  // Diğer renkler
  static const Color white = Color(0xFFFFFFFF);
  static const Color transparent = Colors.transparent;
  static const Color error = Color(0xFFDC2626);
  static const Color success = Color(0xFF059669);
}
