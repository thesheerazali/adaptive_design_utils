import 'package:adaptive_design_utils/flutter_responsive_utils.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter/material.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('AdaptiveDesignUtils Tests', () {
    testWidgets('initialize sets up screen utils correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              AdaptiveDesignUtils.initialize(context);
              return const Scaffold();
            },
          ),
        ),
      );

      expect(ScreenUtils.screenWidth, isNotNull);
      expect(ScreenUtils.screenHeight, isNotNull);
    });

    testWidgets('Breakpoints work correctly', (WidgetTester tester) async {
      late String breakpointName;

      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              breakpointName = Breakpoints.getBreakpointName(context);
              return const Scaffold();
            },
          ),
        ),
      );

      expect(breakpointName, isNotEmpty);
    });
  });
}
