import 'package:flutter/material.dart';

/// A utility class for responsive screen measurements and adaptations
class ScreenUtils {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double defaultSize;
  static late Orientation orientation;
  static late double _safeAreaHorizontal;
  static late double _safeAreaVertical;
  static late double safeBlockHorizontal;
  static late double safeBlockVertical;
  static late bool isInitialized;

  /// Initialize ScreenUtils with the BuildContext
  static void initialize(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;

    // Calculate safe area
    _safeAreaHorizontal = _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical = _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;

    // Set default size based on screen width
    defaultSize = orientation == Orientation.portrait ? screenWidth / 100 : screenHeight / 100;
    isInitialized = true;
  }

  /// Convert width to adaptive width
  static double adaptiveWidth(double width) {
    _checkInitialization();
    return (width * screenWidth) / 375.0; // Using iPhone 8 width as base
  }

  /// Convert height to adaptive height
  static double adaptiveHeight(double height) {
    _checkInitialization();
    return (height * screenHeight) / 812.0; // Using iPhone 8 height as base
  }

  /// Get adaptive font size
  static double adaptiveFontSize(double size) {
    _checkInitialization();
    double scale = screenWidth / 375.0; // Using iPhone 8 width as base
    return size * scale;
  }

  /// Get percentage of screen width
  static double widthPercent(double percent) {
    _checkInitialization();
    return screenWidth * (percent / 100);
  }

  /// Get percentage of screen height
  static double heightPercent(double percent) {
    _checkInitialization();
    return screenHeight * (percent / 100);
  }

  /// Check if device is in landscape orientation
  static bool get isLandscape => orientation == Orientation.landscape;

  /// Check if device is in portrait orientation
  static bool get isPortrait => orientation == Orientation.portrait;

  /// Get status bar height
  static double get statusBarHeight => _mediaQueryData.padding.top;

  /// Get bottom padding (for devices with notch)
  static double get bottomPadding => _mediaQueryData.padding.bottom;

  /// Get device pixel ratio
  static double get pixelRatio => _mediaQueryData.devicePixelRatio;

  /// Get safe area padding
  static EdgeInsets get safePadding => _mediaQueryData.padding;

  /// Check if ScreenUtils is initialized
  static void _checkInitialization() {
    assert(isInitialized, 
      'ScreenUtils is not initialized. Call ScreenUtils.initialize(context) in your widget tree.');
  }

  /// Get adaptive radius
  static double adaptiveRadius(double radius) {
    _checkInitialization();
    return adaptiveWidth(radius);
  }

  /// Get adaptive spacing
  static double adaptiveSpacing(double spacing) {
    _checkInitialization();
    return adaptiveWidth(spacing);
  }
}
