import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_responsive_utils_platform_interface.dart';

/// An implementation of [FlutterResponsiveUtilsPlatform] that uses method channels.
class MethodChannelFlutterResponsiveUtils extends FlutterResponsiveUtilsPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_responsive_utils');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
