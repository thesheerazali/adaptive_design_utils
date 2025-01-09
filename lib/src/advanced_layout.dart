import 'package:flutter/material.dart';
import 'breakpoints.dart';
import 'screen_utils.dart';

/// A widget that creates a responsive grid layout
class ResponsiveGrid extends StatelessWidget {
  final List<Widget> children;
  final int mobileCrossAxisCount;
  final int tabletCrossAxisCount;
  final int desktopCrossAxisCount;
  final double spacing;
  final double runSpacing;
  final double childAspectRatio;

  const ResponsiveGrid({
    Key? key,
    required this.children,
    this.mobileCrossAxisCount = 1,
    this.tabletCrossAxisCount = 2,
    this.desktopCrossAxisCount = 4,
    this.spacing = 16.0,
    this.runSpacing = 16.0,
    this.childAspectRatio = 1.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        int crossAxisCount;
        if (Breakpoints.isDesktop(context)) {
          crossAxisCount = desktopCrossAxisCount;
        } else if (Breakpoints.isTablet(context)) {
          crossAxisCount = tabletCrossAxisCount;
        } else {
          crossAxisCount = mobileCrossAxisCount;
        }

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: ScreenUtils.adaptiveWidth(spacing),
            mainAxisSpacing: ScreenUtils.adaptiveHeight(runSpacing),
            childAspectRatio: childAspectRatio,
          ),
          itemCount: children.length,
          itemBuilder: (context, index) => children[index],
        );
      },
    );
  }
}

/// A widget that creates a masonry-style layout
class ResponsiveMasonry extends StatelessWidget {
  final List<Widget> children;
  final int mobileColumns;
  final int tabletColumns;
  final int desktopColumns;
  final double spacing;

  const ResponsiveMasonry({
    Key? key,
    required this.children,
    this.mobileColumns = 1,
    this.tabletColumns = 2,
    this.desktopColumns = 3,
    this.spacing = 16.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int columnCount;
    if (Breakpoints.isDesktop(context)) {
      columnCount = desktopColumns;
    } else if (Breakpoints.isTablet(context)) {
      columnCount = tabletColumns;
    } else {
      columnCount = mobileColumns;
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final itemWidth = (width - (spacing * (columnCount - 1))) / columnCount;

        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: children.map((child) {
            return SizedBox(
              width: itemWidth,
              child: child,
            );
          }).toList(),
        );
      },
    );
  }
}

/// A widget that adapts its layout based on available space
class AdaptiveContainer extends StatelessWidget {
  final Widget child;
  final double mobileWidth;
  final double tabletWidth;
  final double desktopWidth;
  final EdgeInsets? padding;
  final Color? backgroundColor;
  final double? borderRadius;
  final BoxShadow? shadow;

  const AdaptiveContainer({
    Key? key,
    required this.child,
    this.mobileWidth = double.infinity,
    this.tabletWidth = 680,
    this.desktopWidth = 1024,
    this.padding,
    this.backgroundColor,
    this.borderRadius,
    this.shadow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double maxWidth;
    if (Breakpoints.isDesktop(context)) {
      maxWidth = desktopWidth;
    } else if (Breakpoints.isTablet(context)) {
      maxWidth = tabletWidth;
    } else {
      maxWidth = mobileWidth;
    }

    return Center(
      child: Container(
        constraints: BoxConstraints(
          maxWidth: maxWidth,
        ),
        padding: padding,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: borderRadius != null
              ? BorderRadius.circular(borderRadius!)
              : null,
          boxShadow: shadow != null ? [shadow!] : null,
        ),
        child: child,
      ),
    );
  }
}

/// A widget that creates a responsive staggered grid
class ResponsiveStaggeredGrid extends StatelessWidget {
  final List<Widget> children;
  final int mobileCrossAxisCount;
  final int tabletCrossAxisCount;
  final int desktopCrossAxisCount;
  final double spacing;
  final List<double> heightFactors;

  const ResponsiveStaggeredGrid({
    Key? key,
    required this.children,
    required this.heightFactors,
    this.mobileCrossAxisCount = 1,
    this.tabletCrossAxisCount = 2,
    this.desktopCrossAxisCount = 3,
    this.spacing = 16.0,
  })  : assert(children.length == heightFactors.length,
            'Children and heightFactors must have the same length'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    int crossAxisCount;
    if (Breakpoints.isDesktop(context)) {
      crossAxisCount = desktopCrossAxisCount;
    } else if (Breakpoints.isTablet(context)) {
      crossAxisCount = tabletCrossAxisCount;
    } else {
      crossAxisCount = mobileCrossAxisCount;
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final itemWidth = (width - (spacing * (crossAxisCount - 1))) / crossAxisCount;

        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: List.generate(children.length, (index) {
            return SizedBox(
              width: itemWidth,
              height: itemWidth * heightFactors[index],
              child: children[index],
            );
          }),
        );
      },
    );
  }
}
