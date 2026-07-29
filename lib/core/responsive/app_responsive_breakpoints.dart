import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

/// Central responsive configuration and breakpoint definitions for the Bazar application.
class AppResponsiveBreakpoints {
  static const List<Breakpoint> breakpoints = [
    Breakpoint(start: 0, end: 450, name: MOBILE),
    Breakpoint(start: 451, end: 800, name: TABLET),
    Breakpoint(start: 801, end: 1920, name: DESKTOP),
    Breakpoint(start: 1921, end: double.infinity, name: '4K'),
  ];

  /// Standard max content width for constraining desktop and tablet layouts.
  static const double maxContentWidth = 1200.0;
  static const double maxAuthCardWidth = 500.0;
}

/// Helper extension to simplify responsive queries throughout the codebase.
extension BuildContextResponsiveX on BuildContext {
  /// Whether the current screen is in Mobile breakpoint range (0 - 450px).
  bool get isMobile => ResponsiveBreakpoints.of(this).isMobile;

  /// Whether the current screen is in Tablet breakpoint range (451 - 800px).
  bool get isTablet => ResponsiveBreakpoints.of(this).isTablet;

  /// Whether the current screen is in Desktop or higher breakpoint range (801px+).
  bool get isDesktop => ResponsiveBreakpoints.of(this).isDesktop;

  /// Returns a responsive value based on the current active breakpoint.
  T responsiveValue<T>({required T mobile, T? tablet, T? desktop}) {
    final data = ResponsiveBreakpoints.of(this);
    if (desktop != null && data.largerOrEqualTo(DESKTOP)) return desktop;
    if (tablet != null && data.largerOrEqualTo(TABLET)) return tablet;
    return mobile;
  }
}
