import 'package:flutter/material.dart';

class AppColors {
  // Primary colors
  static const Color primary = Colors.white;
  static const Color background = Color(0xFF000000);
  static const Color surface = Color(0xFF1C1C1E);
  
  // Accents
  static const Color accent = Color(0xFF0A84FF);
  static const Color success = Color(0xFF32D74B);
  static const Color error = Color(0xFFFF453A);
  static const Color warning = Color(0xFFFF9F0A);
  
  // Text
  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Color(0xFF8E8E93);
  static const Color textTertiary = Color(0xFF48484A);

  // Overlays
  static const Color glassBackground = Color(0x33FFFFFF);
  static const Color glassBorder = Color(0x1AFFFFFF);
  
  // Gradients
  static const LinearGradient premiumGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF2C2C2E),
      Color(0xFF1C1C1E),
    ],
  );

  static const LinearGradient highlightGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF0A84FF),
      Color(0xFF5E5CE6),
    ],
  );
}
