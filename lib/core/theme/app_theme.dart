import 'package:bazar_group_1/core/theme/app_colors.dart';
import 'package:bazar_group_1/core/theme/app_text_styles_extension.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get light {
    final base = ColorScheme.fromSeed(
      seedColor: AppColors.primary500,
      brightness: Brightness.light,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: base.surface,
      colorScheme: base,
      appBarTheme: AppBarTheme(
        backgroundColor: base.surface,
        foregroundColor: base.onSurface,
        elevation: 0,
      ),
      extensions: [AppTextStylesExtension.light()],
    );
  }

  static ThemeData get dark {
    final base = ColorScheme.fromSeed(
      seedColor: AppColors.primary500,
      brightness: Brightness.dark,
    );
    const darkSurface = Color(0xFF1F1F1F);

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: darkSurface,
      colorScheme: base.copyWith(
        surface: darkSurface,
        background: darkSurface,
        onSurface: Colors.white,
        onSurfaceVariant: const Color(0xFFBDBDBD),
        primaryContainer: const Color(0xFF2A2A2A),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: darkSurface,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      extensions: [AppTextStylesExtension.dark()],
    );
  }
}
