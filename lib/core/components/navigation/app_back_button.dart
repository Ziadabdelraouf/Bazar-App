import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bazar_group_1/core/theme/app_colors.dart';
import 'package:bazar_group_1/core/theme/app_icons.dart';

/// Reusable back arrow button, used at the top of most screens.
/// Defaults to popping the current screen off the navigation stack,
/// but `onPressed` can be overridden for custom behavior if needed.
class AppBackButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const AppBackButton({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
      icon: SvgPicture.asset(
        AppIcons.arrowLeftOutline,
        width: 24,
        height: 24,
        colorFilter: const ColorFilter.mode(AppColors.grey900, BlendMode.srcIn),
      ),
      onPressed: onPressed ?? () => Navigator.pop(context),
    );
  }
}