import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

/// Central responsive configuration and breakpoint definitions for the Bazar application.
class AppResponsiveBreakpoints {
  /// Name of the extra-large tier above [DESKTOP].
  ///
  /// Documentary only: it keeps [breakpoints] readable and gives the range a
  /// name in debug output. Nothing branches on it — [BuildContextResponsiveX]
  /// treats this range as desktop.
  static const String fourK = '4K';

  /// Device-class buckets, matched against viewport width.
  static const List<Breakpoint> breakpoints = [
    Breakpoint(start: 0, end: 450, name: MOBILE),
    Breakpoint(start: 451, end: 800, name: TABLET),
    Breakpoint(start: 801, end: 1920, name: DESKTOP),
    Breakpoint(start: 1921, end: double.infinity, name: fourK),
  ];

  /// Standard max content width for constraining desktop and tablet layouts.
  ///
  /// Past this the content column stops growing and centres, with
  /// `MaxWidthBox.backgroundColor` filling either side. This is what stops
  /// components from losing visual weight on very wide viewports: the zoom is
  /// capped at [maxUiScale], so without a cap on the column the content would
  /// keep shrinking as a share of the screen.
  static const double maxContentWidth = 1200.0;
  static const double maxAuthCardWidth = 500.0;

  /// The canvas width the UI is authored against.
  ///
  /// Viewports at or below this render at their natural size — no zoom.
  static const double designWidth = 420.0;

  /// Upper bound on how far the UI is zoomed on large viewports.
  static const double maxUiScale = 1.30;

  /// Canvas width to hand `ResponsiveScaledBox`, or `null` to disable zooming.
  ///
  /// Pass the width actually available to the content — i.e. read it *inside*
  /// any `MaxWidthBox`, which clamps `MediaQuery.size` to its own `maxWidth`.
  ///
  /// The canvas has to track the real width. `MaxWidthBox` aligns its child, so
  /// `ResponsiveScaledBox` receives *loose* constraints and its `FittedBox`
  /// sizes via `constraints.constrain(canvas)`. A hardcoded canvas therefore
  /// letterboxes when it is narrower than the viewport and shrinks the UI when
  /// it is wider — only a computed one lands on neither.
  ///
  /// Returns `null` for phone-sized viewports so the UI renders natively: a
  /// fixed canvas would *shrink* small handsets (a 360pt Android against a
  /// 420pt canvas renders at 0.86x), working against the user's font-size
  /// preference on the devices that can least afford it.
  ///
  /// Past [designWidth] the zoom ramps up to [maxUiScale] and then holds, so it
  /// is continuous across every width and never exceeds the cap.
  static double? scaledCanvasWidth(double viewportWidth) {
    if (viewportWidth <= designWidth) return null;
    final double scale = math.min(viewportWidth / designWidth, maxUiScale);
    return viewportWidth / scale;
  }
}

/// Helper extension to simplify responsive queries throughout the codebase.
///
/// Every query here resolves by *width*, never via the package's own
/// `isMobile`/`isTablet`/`isDesktop` flags. Those are exact name matches against
/// the single active breakpoint, so on a viewport in the
/// [AppResponsiveBreakpoints.fourK] range all three report `false` and any
/// sizing silently collapses to its mobile value.
extension BuildContextResponsiveX on BuildContext {
  ResponsiveBreakpointsData get _breakpoint => ResponsiveBreakpoints.of(this);

  /// Whether the current screen is in Mobile breakpoint range (0 - 450px).
  bool get isMobile => !_breakpoint.largerOrEqualTo(TABLET);

  /// Whether the current screen is in Tablet breakpoint range (451 - 800px).
  bool get isTablet =>
      _breakpoint.largerOrEqualTo(TABLET) &&
      !_breakpoint.largerOrEqualTo(DESKTOP);

  /// Whether the current screen is in Desktop or higher breakpoint range
  /// (801px+). The [AppResponsiveBreakpoints.fourK] range counts as desktop —
  /// there is deliberately no separate 4K tier to branch on.
  bool get isDesktop => _breakpoint.largerOrEqualTo(DESKTOP);

  /// Returns a responsive value based on the current active breakpoint.
  ///
  /// Falls back down the chain when a tier is omitted, so passing only [mobile]
  /// and [desktop] is valid. Viewports in the
  /// [AppResponsiveBreakpoints.fourK] range resolve to [desktop].
  T responsiveValue<T>({required T mobile, T? tablet, T? desktop}) {
    final data = _breakpoint;
    if (desktop != null && data.largerOrEqualTo(DESKTOP)) return desktop;
    if (tablet != null && data.largerOrEqualTo(TABLET)) return tablet;
    return mobile;
  }
}
