// You have generated a new plugin project without specifying the `--platforms`
// flag. A plugin project with no platform support was generated. To add a
// platform, run `flutter create -t plugin --platforms <platforms> .` under the
// same directory. You can also find a detailed instruction on how to add
// platforms in the `pubspec.yaml` at
// https://flutter.dev/to/pubspec-plugin-platforms.

library flutter_responsive_utils;

import 'package:flutter/material.dart';
import 'src/screen_utils.dart';
export 'src/screen_utils.dart';
export 'src/breakpoints.dart';
export 'src/device_utils.dart';
export 'src/advanced_layout.dart';
export 'src/advanced_typography.dart';
export 'src/responsive_extensions.dart';
export 'src/alert_utils.dart';
export 'src/responsive_widgets.dart';
export 'src/typography.dart';

/// The main class for Adaptive Design Utils plugin
class AdaptiveDesignUtils {
  /// Initialize the adaptive design utilities
  static void initialize(BuildContext context) {
    ScreenUtils.initialize(context);
  }
}
