import 'package:flutter/material.dart';

/// Defines standard breakpoints for responsive design
class Breakpoints {
  static const double xs = 0;
  static const double sm = 600;
  static const double md = 960;
  static const double lg = 1280;
  static const double xl = 1920;

  /// Get the current breakpoint name based on screen width
  static String getBreakpointName(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width >= xl) return 'xl';
    if (width >= lg) return 'lg';
    if (width >= md) return 'md';
    if (width >= sm) return 'sm';
    return 'xs';
  }

  /// Check if current width is mobile
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < sm;

  /// Check if current width is tablet
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= sm &&
      MediaQuery.of(context).size.width < lg;

  /// Check if current width is desktop
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= lg;
}
