# Adaptive Design Utils

A lightweight yet powerful Flutter package for creating adaptive and responsive applications. This package provides a rich set of utilities and widgets to help you build apps that look great on any device and screen size, with zero external dependencies.

## Features

### 1. Device-Specific Utilities
- Automatic device type detection (phone, tablet, desktop)
- Platform-specific UI adaptations
- Dark mode detection
- Notch detection
- Safe area handling
- Platform-specific animations and styling

### 2. Advanced Layouts
- ResponsiveGrid for adaptive grid layouts
- ResponsiveMasonry for Pinterest-style layouts
- ResponsiveStaggeredGrid for dynamic grid layouts
- AdaptiveContainer for responsive containers

### 3. Advanced Typography
- Responsive text scaling
- Material 3 text theme support
- Custom font size constraints
- Adaptive text widget

### 4. Screen Utils
- Zero-dependency responsive measurements
- Adaptive sizing
- Screen size categories
- Orientation handling

### 5. Breakpoint Management
- Pre-defined breakpoints
- Custom breakpoint creation
- Device-specific layouts

## Getting Started

Add this to your package's pubspec.yaml file:

```yaml
dependencies:
  adaptive_design_utils: ^0.0.2
```

## Usage

### Initialization

```dart
import 'package:adaptive_design_utils/adaptive_design_utils.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) {
          // Initialize the package
          AdaptiveDesignUtils.initialize(context);
          return HomePage();
        },
      ),
    );
  }
}
```

### Responsive Grid Layout

```dart
ResponsiveGrid(
  children: [
    // Your grid items
  ],
  mobileCrossAxisCount: 1,
  tabletCrossAxisCount: 2,
  desktopCrossAxisCount: 4,
  spacing: 16.0,
  childAspectRatio: 1.0,
)
```

### Masonry Layout

```dart
ResponsiveMasonry(
  children: [
    // Your masonry items
  ],
  mobileColumns: 1,
  tabletColumns: 2,
  desktopColumns: 3,
  spacing: 16.0,
)
```

### Adaptive Container

```dart
AdaptiveContainer(
  child: YourWidget(),
  mobileWidth: double.infinity,
  tabletWidth: 680,
  desktopWidth: 1024,
  padding: EdgeInsets.all(16),
  backgroundColor: Colors.white,
  borderRadius: 8.0,
)
```

### Screen Utils

```dart
// Get adaptive measurements
double width = ScreenUtils.adaptiveWidth(100);
double height = ScreenUtils.adaptiveHeight(50);
double fontSize = ScreenUtils.adaptiveFontSize(16);

// Get screen information
double screenWidth = ScreenUtils.screenWidth;
double screenHeight = ScreenUtils.screenHeight;
bool isLandscape = ScreenUtils.isLandscape;
```

### Device Utils

```dart
// Check device type
final deviceType = await DeviceUtils.getDeviceType();

// Check dark mode
final isDark = DeviceUtils.isDarkMode(context);

// Get platform-specific styling
final cornerRadius = DeviceUtils.getPlatformRadius();
final animationDuration = DeviceUtils.getPlatformDuration();
```

### Advanced Typography

```dart
// Using predefined styles
Text(
  'Headline',
  style: AdaptiveTypography.headline1(context),
)

// Using adaptive text widget
AdaptiveText(
  'Responsive Text',
  style: TextStyle(fontSize: 20),
  minFontSize: 14,
  maxFontSize: 24,
)
```

## Example

Check out the [example](example) folder for a complete demo application showcasing all features.

## Additional Information

- [API Documentation](https://pub.dev/documentation/adaptive_design_utils/latest/)
- [GitHub Repository](https://github.com/thesheerazali/adaptive_design_utils)
- [Bug Reports](https://github.com/thesheerazali/adaptive_design_utils/issues)

## Features and bugs

Please file feature requests and bugs at the [issue tracker](https://github.com/thesheerazali/adaptive_design_utils/issues).

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
# adaptive_design_utils
