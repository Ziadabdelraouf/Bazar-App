import 'package:bazar_group_1/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('app exposes theme-aware surface colors for light mode', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: const Scaffold(),
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: ThemeMode.system,
      ),
    );

    final context = tester.element(find.byType(Scaffold).first);

    expect(Theme.of(context).brightness, Brightness.light);
    expect(
      Theme.of(context).scaffoldBackgroundColor,
      Theme.of(context).colorScheme.surface,
    );
    expect(Theme.of(context).colorScheme.onSurface, isA<Color>());
  });
}
