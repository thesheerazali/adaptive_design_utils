import 'package:flutter/material.dart';
import 'breakpoints.dart';
import 'screen_utils.dart';

/// A widget that adapts its child based on screen size
class ResponsiveBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, String breakpoint) builder;

  const ResponsiveBuilder({
    Key? key,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => builder(context, Breakpoints.getBreakpointName(context)),
    );
  }
}

/// A widget that shows different content for mobile, tablet, and desktop
class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;

  const ResponsiveLayout({
    Key? key,
    required this.mobile,
    this.tablet,
    this.desktop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Breakpoints.isDesktop(context)) {
      return desktop ?? tablet ?? mobile;
    }
    if (Breakpoints.isTablet(context)) {
      return tablet ?? mobile;
    }
    return mobile;
  }
}

/// A widget that adapts its padding based on screen size
class ResponsivePadding extends StatelessWidget {
  final Widget child;
  final EdgeInsets mobilePadding;
  final EdgeInsets? tabletPadding;
  final EdgeInsets? desktopPadding;

  const ResponsivePadding({
    Key? key,
    required this.child,
    required this.mobilePadding,
    this.tabletPadding,
    this.desktopPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EdgeInsets padding = mobilePadding;
    
    if (Breakpoints.isDesktop(context)) {
      padding = desktopPadding ?? tabletPadding ?? mobilePadding;
    } else if (Breakpoints.isTablet(context)) {
      padding = tabletPadding ?? mobilePadding;
    }

    return Padding(padding: padding, child: child);
  }
}

/// A widget that adapts its constraints based on screen size
class ResponsiveConstraints extends StatelessWidget {
  final Widget child;
  final BoxConstraints mobileConstraints;
  final BoxConstraints? tabletConstraints;
  final BoxConstraints? desktopConstraints;

  const ResponsiveConstraints({
    Key? key,
    required this.child,
    required this.mobileConstraints,
    this.tabletConstraints,
    this.desktopConstraints,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BoxConstraints constraints = mobileConstraints;
    
    if (Breakpoints.isDesktop(context)) {
      constraints = desktopConstraints ?? tabletConstraints ?? mobileConstraints;
    } else if (Breakpoints.isTablet(context)) {
      constraints = tabletConstraints ?? mobileConstraints;
    }

    return ConstrainedBox(constraints: constraints, child: child);
  }
}

/// A widget that creates a responsive grid layout
class ResponsiveGridView extends StatelessWidget {
  final List<Widget> children;
  final double spacing;
  final double runSpacing;
  final int mobileColumns;
  final int? tabletColumns;
  final int? desktopColumns;
  final bool shrinkWrap;
  final ScrollPhysics? physics;
  final EdgeInsets? padding;

  const ResponsiveGridView({
    Key? key,
    required this.children,
    this.spacing = 8.0,
    this.runSpacing = 8.0,
    this.mobileColumns = 2,
    this.tabletColumns,
    this.desktopColumns,
    this.shrinkWrap = false,
    this.physics,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int crossAxisCount = mobileColumns;
    
    if (Breakpoints.isDesktop(context)) {
      crossAxisCount = desktopColumns ?? tabletColumns ?? mobileColumns;
    } else if (Breakpoints.isTablet(context)) {
      crossAxisCount = tabletColumns ?? mobileColumns;
    }

    return GridView.builder(
      padding: padding,
      shrinkWrap: shrinkWrap,
      physics: physics,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: spacing,
        mainAxisSpacing: runSpacing,
      ),
      itemCount: children.length,
      itemBuilder: (context, index) => children[index],
    );
  }
}

/// A widget that creates a responsive wrap layout
class ResponsiveWrap extends StatelessWidget {
  final List<Widget> children;
  final double spacing;
  final double runSpacing;
  final WrapAlignment alignment;
  final WrapAlignment runAlignment;
  final EdgeInsets? padding;

  const ResponsiveWrap({
    Key? key,
    required this.children,
    this.spacing = 8.0,
    this.runSpacing = 8.0,
    this.alignment = WrapAlignment.start,
    this.runAlignment = WrapAlignment.start,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Wrap(
        spacing: ScreenUtils.adaptiveWidth(spacing),
        runSpacing: ScreenUtils.adaptiveHeight(runSpacing),
        alignment: alignment,
        runAlignment: runAlignment,
        children: children,
      ),
    );
  }
}

/// A widget that creates a responsive container with max width constraints
class ResponsiveContainer extends StatelessWidget {
  final Widget child;
  final double? mobileMaxWidth;
  final double? tabletMaxWidth;
  final double? desktopMaxWidth;
  final EdgeInsets? padding;
  final Color? backgroundColor;
  final double? borderRadius;

  const ResponsiveContainer({
    Key? key,
    required this.child,
    this.mobileMaxWidth,
    this.tabletMaxWidth,
    this.desktopMaxWidth,
    this.padding,
    this.backgroundColor,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double? maxWidth = mobileMaxWidth;
    
    if (Breakpoints.isDesktop(context)) {
      maxWidth = desktopMaxWidth ?? tabletMaxWidth ?? mobileMaxWidth;
    } else if (Breakpoints.isTablet(context)) {
      maxWidth = tabletMaxWidth ?? mobileMaxWidth;
    }

    return Container(
      constraints: maxWidth != null ? BoxConstraints(maxWidth: maxWidth) : null,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius != null ? BorderRadius.circular(borderRadius!) : null,
      ),
      child: child,
    );
  }
}

/// A widget that creates a responsive list view with different layouts for different screen sizes
class ResponsiveListView extends StatelessWidget {
  final List<Widget> children;
  final double spacing;
  final bool shrinkWrap;
  final ScrollPhysics? physics;
  final EdgeInsets? padding;
  final Axis mobileDirection;
  final Axis? tabletDirection;
  final Axis? desktopDirection;

  const ResponsiveListView({
    Key? key,
    required this.children,
    this.spacing = 8.0,
    this.shrinkWrap = false,
    this.physics,
    this.padding,
    this.mobileDirection = Axis.vertical,
    this.tabletDirection,
    this.desktopDirection,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Axis direction = mobileDirection;
    
    if (Breakpoints.isDesktop(context)) {
      direction = desktopDirection ?? tabletDirection ?? mobileDirection;
    } else if (Breakpoints.isTablet(context)) {
      direction = tabletDirection ?? mobileDirection;
    }

    return ListView.separated(
      scrollDirection: direction,
      padding: padding,
      shrinkWrap: shrinkWrap,
      physics: physics,
      itemCount: children.length,
      separatorBuilder: (context, index) => direction == Axis.horizontal
          ? SizedBox(width: spacing)
          : SizedBox(height: spacing),
      itemBuilder: (context, index) => children[index],
    );
  }
}
