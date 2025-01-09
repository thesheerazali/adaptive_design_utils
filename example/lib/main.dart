import 'package:flutter/material.dart';
import 'package:flutter_responsive_utils/flutter_responsive_utils.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adaptive Design Utils Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // Initialize the package
    AdaptiveDesignUtils.initialize(context);

    return Scaffold(
      appBar: AppBar(
        title: AdaptiveText(
          'Adaptive Design Utils Demo',
          style: AdaptiveTypography.headline2(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Device Info Section
            _buildDeviceInfoSection(),

            // Responsive Grid Demo
            _buildResponsiveGridSection(),

            // Masonry Layout Demo
            _buildMasonryLayoutSection(),

            // Typography Demo
            _buildTypographySection(),

            // Adaptive Container Demo
            _buildAdaptiveContainerSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildDeviceInfoSection() {
    return AdaptiveContainer(
      padding: EdgeInsets.all(16),
      backgroundColor: Colors.blue.withOpacity(0.1),
      borderRadius: 8.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AdaptiveText(
            'Device Information',
            style: AdaptiveTypography.headline3(context),
          ),
          SizedBox(height: 16),
          FutureBuilder<DeviceType>(
            future: DeviceUtils.getDeviceType(),
            builder: (context, snapshot) {
              return Text('Device Type: ${snapshot.data?.toString() ?? "Loading..."}');
            },
          ),
          Text('Dark Mode: ${DeviceUtils.isDarkMode(context)}'),
          Text('Has Notch: ${DeviceUtils.hasNotch(context)}'),
          Text('Screen Size: ${DeviceUtils.getScreenSize(context)}'),
          Text('Platform Radius: ${DeviceUtils.getPlatformRadius()}'),
        ],
      ),
    );
  }

  Widget _buildResponsiveGridSection() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AdaptiveText(
            'Responsive Grid',
            style: AdaptiveTypography.headline3(context),
          ),
          SizedBox(height: 16),
          ResponsiveGrid(
            children: List.generate(
              6,
              (index) => Container(
                color: Colors.blue[(index + 1) * 100],
                child: Center(
                  child: AdaptiveText(
                    'Item ${index + 1}',
                    style: AdaptiveTypography.bodyLarge(context, color: Colors.white),
                  ),
                ),
              ),
            ),
            spacing: 8.0,
            childAspectRatio: 1.5,
          ),
        ],
      ),
    );
  }

  Widget _buildMasonryLayoutSection() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AdaptiveText(
            'Masonry Layout',
            style: AdaptiveTypography.headline3(context),
          ),
          SizedBox(height: 16),
          ResponsiveMasonry(
            children: List.generate(
              6,
              (index) => Container(
                height: [150.0, 180.0, 200.0, 160.0, 140.0, 190.0][index],
                color: Colors.green[(index + 1) * 100],
                child: Center(
                  child: AdaptiveText(
                    'Masonry ${index + 1}',
                    style: AdaptiveTypography.bodyLarge(context, color: Colors.white),
                  ),
                ),
              ),
            ),
            spacing: 8.0,
          ),
        ],
      ),
    );
  }

  Widget _buildTypographySection() {
    return AdaptiveContainer(
      padding: EdgeInsets.all(16),
      backgroundColor: Colors.grey.withOpacity(0.1),
      borderRadius: 8.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AdaptiveText(
            'Typography Showcase',
            style: AdaptiveTypography.headline1(context),
          ),
          AdaptiveText(
            'Headline 2',
            style: AdaptiveTypography.headline2(context),
          ),
          AdaptiveText(
            'Headline 3',
            style: AdaptiveTypography.headline3(context),
          ),
          AdaptiveText(
            'Body Large',
            style: AdaptiveTypography.bodyLarge(context),
          ),
          AdaptiveText(
            'Body Medium',
            style: AdaptiveTypography.bodyMedium(context),
          ),
          AdaptiveText(
            'Body Small',
            style: AdaptiveTypography.bodySmall(context),
          ),
        ],
      ),
    );
  }

  Widget _buildAdaptiveContainerSection() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: AdaptiveContainer(
        backgroundColor: Colors.purple.withOpacity(0.1),
        borderRadius: 8.0,
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            AdaptiveText(
              'Adaptive Container',
              style: AdaptiveTypography.headline3(context),
            ),
            SizedBox(height: 16),
            Text(
              'This container adapts its width based on the screen size. '
              'Try resizing the window or rotating the device!',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
