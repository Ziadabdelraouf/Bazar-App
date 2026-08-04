import 'package:bazar_group_1/core/theme/app_colors.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class AppTextStylesExtension extends ThemeExtension<AppTextStylesExtension> {
  final TextStyle h1;
  final TextStyle h2;
  final TextStyle h3;
  final TextStyle h4;
  final TextStyle h5;
  final TextStyle h6;

  final TextStyle body18Medium;
  final TextStyle body16SemiBold;
  final TextStyle body16Medium;
  final TextStyle body16Regular;
  final TextStyle body14Bold;
  final TextStyle body14SemiBold;
  final TextStyle body14Medium;
  final TextStyle body14Regular;
  final TextStyle body12Bold;
  final TextStyle body12SemiBold;
  final TextStyle body12Medium;
  final TextStyle body12Regular;

  const AppTextStylesExtension({
    required this.h1,
    required this.h2,
    required this.h3,
    required this.h4,
    required this.h5,
    required this.h6,
    required this.body18Medium,
    required this.body16SemiBold,
    required this.body16Medium,
    required this.body16Regular,
    required this.body14Bold,
    required this.body14SemiBold,
    required this.body14Medium,
    required this.body14Regular,
    required this.body12Bold,
    required this.body12SemiBold,
    required this.body12Medium,
    required this.body12Regular,
  });

  static AppTextStylesExtension light() {
    const color = AppColors.grey900;
    return AppTextStylesExtension(
      h1: AppTextStyles.h1.copyWith(color: color),
      h2: AppTextStyles.h2.copyWith(color: color),
      h3: AppTextStyles.h3.copyWith(color: color),
      h4: AppTextStyles.h4.copyWith(color: color),
      h5: AppTextStyles.h5.copyWith(color: color),
      h6: AppTextStyles.h6.copyWith(color: color),
      body18Medium: AppTextStyles.body18Medium.copyWith(color: color),
      body16SemiBold: AppTextStyles.body16SemiBold.copyWith(color: color),
      body16Medium: AppTextStyles.body16Medium.copyWith(color: color),
      body16Regular: AppTextStyles.body16Regular.copyWith(color: color),
      body14Bold: AppTextStyles.body14Bold.copyWith(color: color),
      body14SemiBold: AppTextStyles.body14SemiBold.copyWith(color: color),
      body14Medium: AppTextStyles.body14Medium.copyWith(color: color),
      body14Regular: AppTextStyles.body14Regular.copyWith(color: color),
      body12Bold: AppTextStyles.body12Bold.copyWith(color: color),
      body12SemiBold: AppTextStyles.body12SemiBold.copyWith(color: color),
      body12Medium: AppTextStyles.body12Medium.copyWith(color: color),
      body12Regular: AppTextStyles.body12Regular.copyWith(color: color),
    );
  }

  static AppTextStylesExtension dark() {
    const color = AppColors.white;
    return AppTextStylesExtension(
      h1: AppTextStyles.h1.copyWith(color: color),
      h2: AppTextStyles.h2.copyWith(color: color),
      h3: AppTextStyles.h3.copyWith(color: color),
      h4: AppTextStyles.h4.copyWith(color: color),
      h5: AppTextStyles.h5.copyWith(color: color),
      h6: AppTextStyles.h6.copyWith(color: color),
      body18Medium: AppTextStyles.body18Medium.copyWith(color: color),
      body16SemiBold: AppTextStyles.body16SemiBold.copyWith(color: color),
      body16Medium: AppTextStyles.body16Medium.copyWith(color: color),
      body16Regular: AppTextStyles.body16Regular.copyWith(color: color),
      body14Bold: AppTextStyles.body14Bold.copyWith(color: color),
      body14SemiBold: AppTextStyles.body14SemiBold.copyWith(color: color),
      body14Medium: AppTextStyles.body14Medium.copyWith(color: color),
      body14Regular: AppTextStyles.body14Regular.copyWith(color: color),
      body12Bold: AppTextStyles.body12Bold.copyWith(color: color),
      body12SemiBold: AppTextStyles.body12SemiBold.copyWith(color: color),
      body12Medium: AppTextStyles.body12Medium.copyWith(color: color),
      body12Regular: AppTextStyles.body12Regular.copyWith(color: color),
    );
  }

  @override
  AppTextStylesExtension copyWith({
    TextStyle? h1,
    TextStyle? h2,
    TextStyle? h3,
    TextStyle? h4,
    TextStyle? h5,
    TextStyle? h6,
    TextStyle? body18Medium,
    TextStyle? body16SemiBold,
    TextStyle? body16Medium,
    TextStyle? body16Regular,
    TextStyle? body14Bold,
    TextStyle? body14SemiBold,
    TextStyle? body14Medium,
    TextStyle? body14Regular,
    TextStyle? body12Bold,
    TextStyle? body12SemiBold,
    TextStyle? body12Medium,
    TextStyle? body12Regular,
  }) {
    return AppTextStylesExtension(
      h1: h1 ?? this.h1,
      h2: h2 ?? this.h2,
      h3: h3 ?? this.h3,
      h4: h4 ?? this.h4,
      h5: h5 ?? this.h5,
      h6: h6 ?? this.h6,
      body18Medium: body18Medium ?? this.body18Medium,
      body16SemiBold: body16SemiBold ?? this.body16SemiBold,
      body16Medium: body16Medium ?? this.body16Medium,
      body16Regular: body16Regular ?? this.body16Regular,
      body14Bold: body14Bold ?? this.body14Bold,
      body14SemiBold: body14SemiBold ?? this.body14SemiBold,
      body14Medium: body14Medium ?? this.body14Medium,
      body14Regular: body14Regular ?? this.body14Regular,
      body12Bold: body12Bold ?? this.body12Bold,
      body12SemiBold: body12SemiBold ?? this.body12SemiBold,
      body12Medium: body12Medium ?? this.body12Medium,
      body12Regular: body12Regular ?? this.body12Regular,
    );
  }

  @override
  AppTextStylesExtension lerp(
    ThemeExtension<AppTextStylesExtension>? other,
    double t,
  ) {
    if (other is! AppTextStylesExtension) return this;
    return AppTextStylesExtension(
      h1: TextStyle.lerp(h1, other.h1, t)!,
      h2: TextStyle.lerp(h2, other.h2, t)!,
      h3: TextStyle.lerp(h3, other.h3, t)!,
      h4: TextStyle.lerp(h4, other.h4, t)!,
      h5: TextStyle.lerp(h5, other.h5, t)!,
      h6: TextStyle.lerp(h6, other.h6, t)!,
      body18Medium: TextStyle.lerp(body18Medium, other.body18Medium, t)!,
      body16SemiBold: TextStyle.lerp(body16SemiBold, other.body16SemiBold, t)!,
      body16Medium: TextStyle.lerp(body16Medium, other.body16Medium, t)!,
      body16Regular: TextStyle.lerp(body16Regular, other.body16Regular, t)!,
      body14Bold: TextStyle.lerp(body14Bold, other.body14Bold, t)!,
      body14SemiBold: TextStyle.lerp(body14SemiBold, other.body14SemiBold, t)!,
      body14Medium: TextStyle.lerp(body14Medium, other.body14Medium, t)!,
      body14Regular: TextStyle.lerp(body14Regular, other.body14Regular, t)!,
      body12Bold: TextStyle.lerp(body12Bold, other.body12Bold, t)!,
      body12SemiBold: TextStyle.lerp(body12SemiBold, other.body12SemiBold, t)!,
      body12Medium: TextStyle.lerp(body12Medium, other.body12Medium, t)!,
      body12Regular: TextStyle.lerp(body12Regular, other.body12Regular, t)!,
    );
  }
}
