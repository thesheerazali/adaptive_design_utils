import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'dart:io' show Platform;

/// Utility class for device-specific information and adaptations
class DeviceUtils {
  static final DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();
  
  /// Get device type (phone, tablet, desktop)
  static Future<DeviceType> getDeviceType() async {
    if (Platform.isAndroid) {
      final androidInfo = await _deviceInfo.androidInfo;
      // Calculate physical size in inches
      final double diagonalInches = androidInfo.displayMetrics.sizeInches;
      if (diagonalInches >= 10) return DeviceType.tablet;
      return DeviceType.phone;
    } else if (Platform.isIOS) {
      final iosInfo = await _deviceInfo.iosInfo;
      // Check if device is iPad
      if (iosInfo.model.toLowerCase().contains('ipad')) {
        return DeviceType.tablet;
      }
      return DeviceType.phone;
    }
    return DeviceType.desktop;
  }

  /// Check if device is in dark mode
  static bool isDarkMode(BuildContext context) {
    return MediaQuery.platformBrightnessOf(context) == Brightness.dark;
  }

  /// Get safe area padding
  static EdgeInsets getSafeAreaPadding(BuildContext context) {
    return MediaQuery.of(context).padding;
  }

  /// Get device pixel ratio
  static double getDevicePixelRatio(BuildContext context) {
    return MediaQuery.of(context).devicePixelRatio;
  }

  /// Check if device has notch
  static bool hasNotch(BuildContext context) {
    final padding = MediaQuery.of(context).padding;
    return padding.top > 24.0;
  }

  /// Get platform specific rounded corner radius
  static double getPlatformRadius() {
    if (Platform.isIOS) {
      return 10.0;
    }
    return 4.0;
  }

  /// Get platform specific animation duration
  static Duration getPlatformDuration({bool short = false}) {
    if (Platform.isIOS) {
      return Duration(milliseconds: short ? 200 : 350);
    }
    return Duration(milliseconds: short ? 150 : 300);
  }

  /// Check if device is in landscape orientation
  static bool isLandscape(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.landscape;
  }

  /// Get screen size category
  static ScreenSize getScreenSize(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width >= 1200) return ScreenSize.xlarge;
    if (width >= 992) return ScreenSize.large;
    if (width >= 768) return ScreenSize.medium;
    if (width >= 576) return ScreenSize.small;
    return ScreenSize.xsmall;
  }
}

/// Enum representing different device types
enum DeviceType {
  phone,
  tablet,
  desktop,
}

/// Enum representing different screen size categories
enum ScreenSize {
  xsmall,
  small,
  medium,
  large,
  xlarge,
}
