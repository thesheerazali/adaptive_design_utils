import 'package:flutter/material.dart';
import 'screen_utils.dart';

/// Extension methods for responsive sizing and widget generation
extension ResponsiveExtension on num {
  /// Width extension: converts number to responsive width
  /// Example: 20.w will return a responsive width
  double get w => ScreenUtils.adaptiveWidth(toDouble());

  /// Height extension: creates a SizedBox with responsive height
  /// Example: 20.h creates SizedBox(height: 20)
  SizedBox get height => SizedBox(height: ScreenUtils.adaptiveHeight(toDouble()));

  /// Width extension: creates a SizedBox with responsive width
  /// Example: 20.w creates SizedBox(width: 20)
  SizedBox get width => SizedBox(width: ScreenUtils.adaptiveWidth(toDouble()));

  /// Font size extension: converts number to responsive font size
  /// Example: 16.sp will return a responsive font size
  double get sp => ScreenUtils.adaptiveFontSize(toDouble());

  /// Padding extension: converts number to responsive padding
  /// Example: 10.p will return a responsive padding
  EdgeInsets get p => EdgeInsets.all(ScreenUtils.adaptiveWidth(toDouble()));

  /// Horizontal padding extension
  /// Example: 10.ph will return horizontal padding
  EdgeInsets get ph => EdgeInsets.symmetric(horizontal: ScreenUtils.adaptiveWidth(toDouble()));

  /// Vertical padding extension
  /// Example: 10.pv will return vertical padding
  EdgeInsets get pv => EdgeInsets.symmetric(vertical: ScreenUtils.adaptiveHeight(toDouble()));
}
