import 'package:bazar_group_1/core/localization/generated/l10n.dart';
import 'package:bazar_group_1/core/router/app_routes.dart';
import 'package:bazar_group_1/core/theme/app_icons.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';
import 'package:bazar_group_1/core/theme/theme_notifier.dart';
import 'package:bazar_group_1/features/profile/presentation/widgets/profile_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class _ProfileMenuItem {
  final String title;
  final String icon;
  final VoidCallback onTap;

  const _ProfileMenuItem({
    required this.title,
    required this.icon,
    required this.onTap,
  });
}

class ProfileMenuList extends ConsumerWidget {
  const ProfileMenuList({super.key});

  List<_ProfileMenuItem> _getMenuItems(BuildContext context) {
    final l10n = S.of(context);
    return [
      _ProfileMenuItem(
        title: l10n.myAccount,
        icon: AppIcons.profileFill,
        onTap: () {
          Navigator.pushNamed(context, AppRoutes.myAccount);
        },
      ),
      _ProfileMenuItem(
        title: l10n.address,
        icon: AppIcons.location,
        onTap: () {
          Navigator.pushNamed(context, AppRoutes.address);
        },
      ),
      _ProfileMenuItem(
        title: l10n.offersAndPromos,
        icon: AppIcons.fire,
        onTap: () {
          Navigator.pushNamed(context, AppRoutes.offersPage);
        },
      ),
      _ProfileMenuItem(
        title: l10n.yourFavourites,
        icon: AppIcons.loveFill,
        onTap: () {
          Navigator.pushNamed(context, AppRoutes.favoritesPage);
        },
      ),
      _ProfileMenuItem(
        title: l10n.orderHistory,
        icon: AppIcons.menuFill,
        onTap: () {
          Navigator.pushNamed(context, AppRoutes.orderHistoryPage);
        },
      ),
      _ProfileMenuItem(
        title: l10n.helpCenter,
        icon: AppIcons.chat,
        onTap: () {
          Navigator.pushNamed(context, AppRoutes.helpCenter);
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final menuItems = _getMenuItems(context);
    final themeMode = ref.watch(themeNotifierProvider);
    final isDark = themeMode == ThemeMode.dark;
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          leading: CircleAvatar(
            radius: 30,
            backgroundColor: colorScheme.primaryContainer,
            child: Icon(
              isDark ? Icons.dark_mode : Icons.light_mode,
              color: colorScheme.primary,
            ),
          ),
          title: Text(
            S.of(context).darkMode,
            style: AppTextStyles.body16Medium.copyWith(color: colorScheme.onSurface),
          ),
          trailing: Switch(
            value: isDark,
            activeThumbColor: colorScheme.primary,
            onChanged: (_) {
              ref.read(themeNotifierProvider.notifier).toggleTheme();
            },
          ),
        ),
        ...menuItems.map((item) {
          return ProfileTile(
            title: item.title,
            leading: SvgPicture.asset(
              item.icon,
              colorFilter: ColorFilter.mode(colorScheme.primary, BlendMode.srcIn),
            ),
            onTap: item.onTap,
          );
        }),
      ],
    );
  }
}