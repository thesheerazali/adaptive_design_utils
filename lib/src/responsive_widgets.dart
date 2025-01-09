import 'package:flutter/material.dart';
import 'breakpoints.dart';

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
