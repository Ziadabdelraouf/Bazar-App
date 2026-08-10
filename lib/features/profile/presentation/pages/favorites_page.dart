import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bazar_group_1/core/theme/app_icons.dart';
import 'package:bazar_group_1/core/localization/generated/l10n.dart';
import 'package:bazar_group_1/core/components/app_bars/app_back_bar.dart';
import 'package:bazar_group_1/features/profile/presentation/notifiers/favorites_notifier.dart';
import 'package:bazar_group_1/features/profile/presentation/widgets/favorite_item_card.dart';

class FavoritesPage extends ConsumerWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(favoritesNotifierProvider);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBackBar(
        title: S.of(context).yourFavoritesTitle,
        leadingWidget: Transform.flip(
          flipX: Directionality.of(context) == TextDirection.rtl,
          child: SvgPicture.asset(AppIcons.arrowLeftOutline),
        ),
        onLeadingPressed: () => Navigator.pop(context),
      ),
      body: SafeArea(
        child: favorites.isEmpty
            ? Center(child: Text(S.of(context).noFavoritesYet))
            : LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth < 500) {
                    return ListView.separated(
                      itemCount: favorites.length,
                      separatorBuilder: (context, index) => Divider(
                        color: Theme.of(context).colorScheme.outlineVariant,
                        thickness: 1,
                        height: 1,
                        indent: 16,
                        endIndent: 16,
                      ),
                      itemBuilder: (context, index) {
                        final item = favorites[index];
                        return FavoriteItemCard(
                          key: ValueKey(item.title),
                          item: item,
                        );
                      },
                    );
                  }
                  return GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 3,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 8,
                    ),
                    itemCount: favorites.length,
                    itemBuilder: (context, index) {
                      final item = favorites[index];
                      return FavoriteItemCard(
                        key: ValueKey(item.title),
                        item: item,
                      );
                    },
                  );
                },
              ),
      ),
    );
  }
}