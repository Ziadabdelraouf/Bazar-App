import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bazar_group_1/core/theme/app_colors.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';
import 'package:bazar_group_1/core/localization/generated/l10n.dart';
import 'package:bazar_group_1/core/components/navigation/app_back_button.dart';
import 'package:bazar_group_1/features/profile/presentation/notifiers/favorites_notifier.dart';
import 'package:bazar_group_1/features/profile/presentation/widgets/favorite_item_card.dart';

class FavoritesPage extends ConsumerWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(favoritesNotifierProvider);

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 100,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const AppBackButton(),
                    Text(
                      S.of(context).yourFavoritesTitle,
                      style: AppTextStyles.h4.copyWith(color: AppColors.grey900),
                    ),
                    const SizedBox(width: 40),
                  ],
                ),
              ),
            ),
            Expanded(
              child: favorites.isEmpty
                  ? Center(child: Text(S.of(context).noFavoritesYet))
                  : ListView.builder(
                      itemCount: favorites.length,
                      itemBuilder: (context, index) {
                        final item = favorites[index];
                        return FavoriteItemCard(
                          key: ValueKey(item.title),
                          item: item,
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}