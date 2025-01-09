import 'package:flutter/material.dart';
import 'screen_utils.dart';

/// A utility class for responsive typography
class ResponsiveTypography {
  /// Creates responsive text style with adaptive font size
  static TextStyle adaptiveTextStyle(
    TextStyle style, {
    double? fontSize,
    double? height,
    double? letterSpacing,
  }) {
    return style.copyWith(
      fontSize: fontSize != null ? ScreenUtils.adaptiveFontSize(fontSize) : style.fontSize,
      height: height,
      letterSpacing: letterSpacing != null ? ScreenUtils.adaptiveWidth(letterSpacing) : style.letterSpacing,
    );
  }

  /// Predefined text styles that automatically adapt to screen size
  static TextTheme getResponsiveTextTheme(TextTheme base) {
    return base.copyWith(
      displayLarge: adaptiveTextStyle(
        base.displayLarge ?? const TextStyle(),
        fontSize: 57,
      ),
      displayMedium: adaptiveTextStyle(
        base.displayMedium ?? const TextStyle(),
        fontSize: 45,
      ),
      displaySmall: adaptiveTextStyle(
        base.displaySmall ?? const TextStyle(),
        fontSize: 36,
      ),
      headlineLarge: adaptiveTextStyle(
        base.headlineLarge ?? const TextStyle(),
        fontSize: 32,
      ),
      headlineMedium: adaptiveTextStyle(
        base.headlineMedium ?? const TextStyle(),
        fontSize: 28,
      ),
      headlineSmall: adaptiveTextStyle(
        base.headlineSmall ?? const TextStyle(),
        fontSize: 24,
      ),
      titleLarge: adaptiveTextStyle(
        base.titleLarge ?? const TextStyle(),
        fontSize: 22,
      ),
      titleMedium: adaptiveTextStyle(
        base.titleMedium ?? const TextStyle(),
        fontSize: 16,
      ),
      titleSmall: adaptiveTextStyle(
        base.titleSmall ?? const TextStyle(),
        fontSize: 14,
      ),
      bodyLarge: adaptiveTextStyle(
        base.bodyLarge ?? const TextStyle(),
        fontSize: 16,
      ),
      bodyMedium: adaptiveTextStyle(
        base.bodyMedium ?? const TextStyle(),
        fontSize: 14,
      ),
      bodySmall: adaptiveTextStyle(
        base.bodySmall ?? const TextStyle(),
        fontSize: 12,
      ),
      labelLarge: adaptiveTextStyle(
        base.labelLarge ?? const TextStyle(),
        fontSize: 14,
      ),
      labelMedium: adaptiveTextStyle(
        base.labelMedium ?? const TextStyle(),
        fontSize: 12,
      ),
      labelSmall: adaptiveTextStyle(
        base.labelSmall ?? const TextStyle(),
        fontSize: 11,
      ),
    );
  }
}
