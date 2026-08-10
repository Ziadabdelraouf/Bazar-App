import 'package:bazar_group_1/core/localization/generated/l10n.dart';
import 'package:bazar_group_1/core/theme/app_icons.dart';
import 'package:bazar_group_1/features/home/presentation/providers/bottom_nav_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavbar extends ConsumerWidget {
  const BottomNavbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(bottomNavIndexProvider);
    return NavigationBar(
      selectedIndex: selectedIndex,
      backgroundColor: Theme.of(context).colorScheme.surface,
      indicatorColor: Colors.transparent,
      elevation: 0,
      onDestinationSelected: (index) {
        ref.read(bottomNavIndexProvider.notifier).state = index;
      },
      destinations: [
        NavigationDestination(
          icon: SvgPicture.asset(
            AppIcons.homeFill,
            height: 28,
            colorFilter: ColorFilter.mode(
              Theme.of(context).colorScheme.onSurface,
              BlendMode.srcIn,
            ),
          ),
          selectedIcon: SvgPicture.asset(
            AppIcons.homeFill,
            height: 28,
            colorFilter: ColorFilter.mode(
              Theme.of(context).colorScheme.primary,
              BlendMode.srcIn,
            ),
          ),
          label: S.of(context).homeTitle,
        ),
        NavigationDestination(
          icon: SvgPicture.asset(
            AppIcons.document,
            height: 28,
            colorFilter: ColorFilter.mode(
              Theme.of(context).colorScheme.onSurface,
              BlendMode.srcIn,
            ),
          ),
          selectedIcon: SvgPicture.asset(
            AppIcons.document,
            height: 28,
            colorFilter: ColorFilter.mode(
              Theme.of(context).colorScheme.primary,
              BlendMode.srcIn,
            ),
          ),
          label: S.of(context).categoryTitle,
        ),
        NavigationDestination(
          icon: SvgPicture.asset(
            AppIcons.cartFill,
            height: 28,
            colorFilter: ColorFilter.mode(
              Theme.of(context).colorScheme.onSurface,
              BlendMode.srcIn,
            ),
          ),
          selectedIcon: SvgPicture.asset(
            AppIcons.cartFill,
            height: 28,
            colorFilter: ColorFilter.mode(
              Theme.of(context).colorScheme.primary,
              BlendMode.srcIn,
            ),
          ),
          label: S.of(context).cartTitle,
        ),
        NavigationDestination(
          icon: SvgPicture.asset(
            AppIcons.profileFill,
            height: 28,
            colorFilter: ColorFilter.mode(
              Theme.of(context).colorScheme.onSurface,
              BlendMode.srcIn,
            ),
          ),
          selectedIcon: SvgPicture.asset(
            AppIcons.profileFill,
            height: 28,
            colorFilter: ColorFilter.mode(
              Theme.of(context).colorScheme.primary,
              BlendMode.srcIn,
            ),
          ),
          label: S.of(context).profileTitle,
        ),
      ],
    );
  }
}
