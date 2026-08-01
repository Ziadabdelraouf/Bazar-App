import 'package:bazar_group_1/features/home/presentation/pages/detail_menu_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bazar_group_1/core/theme/app_colors.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';
import 'package:bazar_group_1/core/localization/generated/l10n.dart';
import 'package:bazar_group_1/features/profile/domain/entities/favorite_item.dart';
import 'package:bazar_group_1/features/profile/presentation/notifiers/favorites_notifier.dart';
import 'package:bazar_group_1/features/profile/presentation/widgets/favorite_heart.dart';

class FavoriteItemCard extends ConsumerStatefulWidget {
  const FavoriteItemCard({super.key, required this.item});

  final FavoriteItem item;

  @override
  ConsumerState<FavoriteItemCard> createState() => _FavoriteItemCardState();
}

class _FavoriteItemCardState extends ConsumerState<FavoriteItemCard> {
  bool _isRemoving = false;

  Future<bool> _confirmRemoval() async {
    final localization = S.of(context);
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(localization.removeFromFavoritesTitle),
        content: Text(localization.removeFromFavoritesConfirmation),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(localization.cancelButton),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(localization.removeButton),
          ),
        ],
      ),
    );
    return result ?? false;
  }

  Future<void> _handleHeartTap() async {
    final confirmed = await _confirmRemoval();
    if (!confirmed) return;

    setState(() => _isRemoving = true);

    await Future.delayed(const Duration(milliseconds: 300));

    if (mounted) {
      ref.read(favoritesNotifierProvider.notifier).removeFavorite(widget.item.title);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: _isRemoving ? 0.0 : 1.0,
        child: _isRemoving
            ? const SizedBox(width: double.infinity)
            : GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    backgroundColor: Colors.white,
                    context: context,
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    builder: (context) => DetailMenuPage(
                      title: widget.item.title,
                      price: '\$${widget.item.price.toStringAsFixed(2)}',
                      imagePath: widget.item.imageUrl ?? '',
                      brandLogo: 'assets/icons/GoodDay_Vector.svg',
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  child: Row(
                    children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: AppColors.grey50,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: widget.item.imageUrl != null
                            ? Image.network(widget.item.imageUrl!, fit: BoxFit.cover)
                            : const Icon(Icons.menu_book),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.item.title,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: AppTextStyles.body16Medium.copyWith(color: AppColors.grey900),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '\$${widget.item.price.toStringAsFixed(2)}',
                            style: AppTextStyles.body14Bold
                                .copyWith(color: AppColors.primary500),
                          ),
                        ],
                      ),
                    ),
                    FavoriteHeart(onTap: _handleHeartTap),
                  ],
                ),
              ),
            ),
      ),
    );
  }
}