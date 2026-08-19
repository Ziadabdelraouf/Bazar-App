import 'package:bazar_group_1/features/cart_checkout/presentation/pages/cart_view.dart';
import 'package:bazar_group_1/features/categories/presentation/pages/category_view.dart';
import 'package:bazar_group_1/features/categories/presentation/providers/category_providers.dart';
import 'package:bazar_group_1/features/home/presentation/pages/home_view.dart';
import 'package:bazar_group_1/features/home/presentation/providers/bottom_nav_provider.dart';
import 'package:bazar_group_1/features/home/presentation/widgets/navigation_bar.dart';
import 'package:bazar_group_1/features/home/presentation/widgets/notification_icon.dart';
import 'package:bazar_group_1/features/profile/presentation/pages/profile_view.dart';
import 'package:bazar_group_1/core/components/app_bars/app_back_bar.dart';
import 'package:bazar_group_1/core/theme/app_icons.dart';
import 'package:bazar_group_1/core/localization/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(bottomNavIndexProvider);
    final showSearch = ref.watch(bookSearchShowProvider);

    final List<Widget> pages = [
      const HomeView(),
      const CategoryView(),
      const CartView(),
      const ProfileView(),
    ];

    final canSearch = selectedIndex == 0 || selectedIndex == 1;

    final List<String> titles = [
      S.of(context).homeTitle,
      S.of(context).categoryTitle,
      S.of(context).cartTitle,
      S.of(context).profileTitle,
    ];

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      bottomNavigationBar: const BottomNavbar(),
      body: IndexedStack(index: selectedIndex, children: pages),
      appBar: AppBackBar(
        title: titles[selectedIndex],
        trailingWidget: NotificationIcon(),
        leadingWidget: canSearch
            ? (showSearch
                ? Icon(Icons.close, color: Theme.of(context).colorScheme.onSurface)
                : SvgPicture.asset(
                    AppIcons.search,
                    colorFilter: ColorFilter.mode(
                      Theme.of(context).colorScheme.onSurface,
                      BlendMode.srcIn,
                    ),
                  ))
            : null,
        onLeadingPressed: canSearch
            ? () {
                ref.read(bookSearchShowProvider.notifier).state = !showSearch;
                if (showSearch) {
                  ref.read(bookSearchQueryProvider.notifier).state = '';
                }
              }
            : null,
      ),
    );
  }
}