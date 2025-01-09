// This is a basic Flutter integration test.
//
// Since integration tests run in a full Flutter application, they can interact
// with the host side of a plugin implementation, unlike Dart unit tests.
//
// For more information about Flutter integration tests, please see
// https://flutter.dev/to/integration-testing


import 'package:flutter/material.dart';
import 'package:flutter_responsive_utils/flutter_responsive_utils.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';



void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Test Adaptive Design Utils Components',
      (WidgetTester tester) async {
    // Build test app
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) {
            AdaptiveDesignUtils.initialize(context);
            return Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    // Test ResponsiveGrid
                    ResponsiveGrid(
                      children: List.generate(
                        4,
                        (index) => Container(
                          color: Colors.blue,
                          height: 100,
                        ),
                      ),
                      mobileCrossAxisCount: 1,
                      tabletCrossAxisCount: 2,
                      desktopCrossAxisCount: 4,
                    ),

                    // Test AdaptiveContainer
                    AdaptiveContainer(
                      child: Text('Adaptive Container'),
                      mobileWidth: 300,
                      tabletWidth: 500,
                      desktopWidth: 800,
                    ),

                    // Test AdaptiveText
                    AdaptiveText(
                      'Adaptive Text',
                      style: AdaptiveTypography.headline1(context),
                    ),

                    // Test ResponsiveMasonry
                    ResponsiveMasonry(
                      children: List.generate(
                        4,
                        (index) => Container(
                          color: Colors.green,
                          height: 150,
                        ),
                      ),
                      mobileColumns: 1,
                      tabletColumns: 2,
                      desktopColumns: 3,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );

    // Verify initialization
    expect(ScreenUtils.screenWidth, isNotNull);
    expect(ScreenUtils.screenHeight, isNotNull);

    // Verify widgets are rendered
    expect(find.byType(ResponsiveGrid), findsOneWidget);
    expect(find.byType(AdaptiveContainer), findsOneWidget);
    expect(find.byType(AdaptiveText), findsOneWidget);
    expect(find.byType(ResponsiveMasonry), findsOneWidget);

    // Test screen utilities
    expect(ScreenUtils.adaptiveWidth(100), isNotNull);
    expect(ScreenUtils.adaptiveHeight(100), isNotNull);
    expect(ScreenUtils.adaptiveFontSize(16), isNotNull);

    // Test device utilities
    await tester.pumpAndSettle();
    final deviceType = await DeviceUtils.getDeviceType();
    expect(deviceType, isNotNull);

    // Verify text rendering
    expect(find.text('Adaptive Text'), findsOneWidget);
    expect(find.text('Adaptive Container'), findsOneWidget);
  });
}
