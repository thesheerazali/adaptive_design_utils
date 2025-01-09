import 'package:flutter/material.dart';
import 'screen_utils.dart';

/// A utility class for advanced typography management
class AdaptiveTypography {
  /// Creates a responsive text style that scales based on screen size
  static TextStyle createResponsiveStyle({
    required double fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? height,
    double? letterSpacing,
    String? fontFamily,
    TextDecoration? decoration,
    double minFontSize = 12,
    double maxFontSize = 32,
  }) {
    final scaledSize = ScreenUtils.adaptiveWidth(fontSize).clamp(minFontSize, maxFontSize);
    
    return TextStyle(
      fontSize: scaledSize,
      fontWeight: fontWeight,
      color: color,
      height: height,
      letterSpacing: letterSpacing,
      fontFamily: fontFamily,
      decoration: decoration,
    );
  }

  /// Predefined text styles for different purposes
  static TextStyle headline1(BuildContext context, {Color? color}) {
    return createResponsiveStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: color ?? Theme.of(context).textTheme.displayLarge?.color,
      height: 1.2,
      letterSpacing: -0.5,
    );
  }

  static TextStyle headline2(BuildContext context, {Color? color}) {
    return createResponsiveStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: color ?? Theme.of(context).textTheme.displayMedium?.color,
      height: 1.3,
    );
  }

  static TextStyle headline3(BuildContext context, {Color? color}) {
    return createResponsiveStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: color ?? Theme.of(context).textTheme.displaySmall?.color,
      height: 1.3,
    );
  }

  static TextStyle bodyLarge(BuildContext context, {Color? color}) {
    return createResponsiveStyle(
      fontSize: 18,
      fontWeight: FontWeight.normal,
      color: color ?? Theme.of(context).textTheme.bodyLarge?.color,
      height: 1.5,
    );
  }

  static TextStyle bodyMedium(BuildContext context, {Color? color}) {
    return createResponsiveStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: color ?? Theme.of(context).textTheme.bodyMedium?.color,
      height: 1.5,
    );
  }

  static TextStyle bodySmall(BuildContext context, {Color? color}) {
    return createResponsiveStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: color ?? Theme.of(context).textTheme.bodySmall?.color,
      height: 1.5,
    );
  }

  static TextStyle caption(BuildContext context, {Color? color}) {
    return createResponsiveStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: color ?? Theme.of(context).textTheme.bodySmall?.color,
      height: 1.4,
      letterSpacing: 0.4,
    );
  }

  static TextStyle button(BuildContext context, {Color? color}) {
    return createResponsiveStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: color ?? Theme.of(context).textTheme.labelLarge?.color,
      height: 1.4,
      letterSpacing: 0.5,
    );
  }
}

/// A widget that displays text with responsive sizing
class AdaptiveText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final double minFontSize;
  final double maxFontSize;

  const AdaptiveText(
    this.text, {
    Key? key,
    this.style,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.minFontSize = 12,
    this.maxFontSize = 32,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final defaultStyle = Theme.of(context).textTheme.bodyMedium;
    final baseStyle = style ?? defaultStyle;
    
    if (baseStyle == null) return Text(text);

    final responsiveStyle = AdaptiveTypography.createResponsiveStyle(
      fontSize: baseStyle.fontSize ?? 16,
      fontWeight: baseStyle.fontWeight,
      color: baseStyle.color,
      height: baseStyle.height,
      letterSpacing: baseStyle.letterSpacing,
      fontFamily: baseStyle.fontFamily,
      decoration: baseStyle.decoration,
      minFontSize: minFontSize,
      maxFontSize: maxFontSize,
    );

    return Text(
      text,
      style: responsiveStyle,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
