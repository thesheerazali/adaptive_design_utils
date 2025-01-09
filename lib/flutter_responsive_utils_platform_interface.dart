import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_responsive_utils_method_channel.dart';

abstract class FlutterResponsiveUtilsPlatform extends PlatformInterface {
  /// Constructs a FlutterResponsiveUtilsPlatform.
  FlutterResponsiveUtilsPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterResponsiveUtilsPlatform _instance = MethodChannelFlutterResponsiveUtils();

  /// The default instance of [FlutterResponsiveUtilsPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterResponsiveUtils].
  static FlutterResponsiveUtilsPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterResponsiveUtilsPlatform] when
  /// they register themselves.
  static set instance(FlutterResponsiveUtilsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
