library adaptive_design_utils;

import 'package:flutter/material.dart';
import 'src/screen_utils.dart';

export 'src/screen_utils.dart';
export 'src/breakpoints.dart';
export 'src/device_utils.dart';
export 'src/advanced_layout.dart';
export 'src/advanced_typography.dart';
export 'src/responsive_extensions.dart';
export 'src/alert_utils.dart';

/// Main class for initializing the Adaptive Design Utils package
class AdaptiveDesignUtils {
  /// Initialize the package with the given context
  static void initialize(BuildContext context) {
    ScreenUtils.initialize(context);
  }
}
