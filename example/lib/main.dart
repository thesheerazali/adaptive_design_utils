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
      title: 'Responsive Utils Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the package
    AdaptiveDesignUtils.initialize(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Responsive Utils Demo'),
        actions: [
          IconButton(
            icon: const Icon(Icons.info),
            onPressed: () {
              Alert.showErrorDialog(
                context,
                title: 'About',
                message: 'This is a demo of Responsive Utils package.',
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: ResponsiveContainer(
          mobileMaxWidth: double.infinity,
          tabletMaxWidth: 680,
          desktopMaxWidth: 1200,
          padding: EdgeInsets.all(16.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Responsive Grid View',
                style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
              ),
              20.height,
              ResponsiveGridView(
                mobileColumns: 2,
                tabletColumns: 3,
                desktopColumns: 4,
                spacing: 16,
                runSpacing: 16,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: List.generate(
                  8,
                  (index) => Container(
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        'Item ${index + 1}',
                        style: TextStyle(fontSize: 16.sp),
                      ),
                    ),
                  ),
                ),
              ),
              30.height,
              Text(
                'Responsive Wrap',
                style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
              ),
              20.height,
              ResponsiveWrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  'Flutter',
                  'Dart',
                  'Responsive',
                  'Adaptive',
                  'Design',
                  'Utils',
                ].map((text) => Chip(label: Text(text))).toList(),
              ),
              30.height,
              Text(
                'Responsive List View',
                style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
              ),
              20.height,
              SizedBox(
                height: 120,
                child: ResponsiveListView(
                  mobileDirection: Axis.horizontal,
                  spacing: 16,
                  children: List.generate(
                    6,
                    (index) => Container(
                      width: 160,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          'Card ${index + 1}',
                          style: TextStyle(fontSize: 16.sp),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              30.height,
              Text(
                'Responsive Layout',
                style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
              ),
              20.height,
              ResponsiveBuilder(
                builder: (context, breakpoint) {
                  if (Breakpoints.isDesktop(context)) {
                    return _buildDesktopContent();
                  }
                  if (Breakpoints.isTablet(context)) {
                    return _buildTabletContent();
                  }
                  return _buildMobileContent();
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Alert.showSuccessDialog(
            context,
            message: 'This is a success dialog!',
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildMobileContent() {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colors.deepPurple.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          'Mobile Content',
          style: TextStyle(fontSize: 16.sp),
        ),
      ),
    );
  }

  Widget _buildTabletContent() {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colors.deepPurple.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          'Tablet Content',
          style: TextStyle(fontSize: 16.sp),
        ),
      ),
    );
  }

  Widget _buildDesktopContent() {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colors.deepPurple.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          'Desktop Content',
          style: TextStyle(fontSize: 16.sp),
        ),
      ),
    );
  }
}
