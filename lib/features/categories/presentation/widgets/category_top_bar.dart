import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bazar_group_1/core/theme/app_icons.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';

class CategoryTopBar extends StatelessWidget {
  final String title;
  final VoidCallback onSearchTap;
  final bool hasUnreadNotifications;

  const CategoryTopBar({
    super.key,
    required this.title,
    required this.onSearchTap,
    this.hasUnreadNotifications = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      height: 100,
      child: Stack(
        children: [
          Positioned(
            top: 60,
            left: 16,
            child: SizedBox(
              width: 40,
              height: 40,
              child: IconButton(
                onPressed: onSearchTap,
                icon: SvgPicture.asset(
                  AppIcons.search,
                  colorFilter: ColorFilter.mode(
                    colorScheme.onSurface,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 66,
            left: 0,
            right: 0,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: AppTextStyles.h4.copyWith(color: colorScheme.onSurface),
            ),
          ),
          Positioned(
            top: 68,
            right: 24,
            child: Badge(
              isLabelVisible: hasUnreadNotifications,
              child: SvgPicture.asset(
                AppIcons.bellOutline,
                width: 24,
                height: 24,
                colorFilter: ColorFilter.mode(
                  colorScheme.onSurface,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}