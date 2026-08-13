import 'package:bazar_group_1/core/components/buttons/small_primary_button.dart';
import 'package:bazar_group_1/core/localization/generated/l10n.dart';
import 'package:bazar_group_1/core/responsive/app_responsive_breakpoints.dart';
import 'package:bazar_group_1/core/theme/app_colors.dart';
import 'package:bazar_group_1/core/theme/app_icons.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';
import 'package:bazar_group_1/features/cart_checkout/domain/entities/cart_item.dart';
import 'package:bazar_group_1/features/cart_checkout/presentation/providers/cart_providers.dart';
import 'package:bazar_group_1/features/home/presentation/providers/bottom_nav_provider.dart';
import 'package:bazar_group_1/features/profile/domain/entities/favorite_item.dart';
import 'package:bazar_group_1/features/profile/presentation/notifiers/favorites_notifier.dart';
import 'package:bazar_group_1/features/profile/presentation/widgets/favorite_heart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class DetailMenuPage extends ConsumerStatefulWidget {
  final String bookId;
  final String title;
  final String price;
  final String imagePath;
  final String brandLogo;

  const DetailMenuPage({
    super.key,
    required this.bookId,
    required this.title,
    required this.price,
    required this.imagePath,
    required this.brandLogo,
  });

  @override
  ConsumerState<DetailMenuPage> createState() => _DetailMenuPageState();
}

class _DetailMenuPageState extends ConsumerState<DetailMenuPage> {
  double currentRating = 4.0;
  int quantity = 0;

  double _parsePrice(String priceStr) {
    final clean = priceStr.replaceAll(RegExp(r'[^\d.]'), '');
    return double.tryParse(clean) ?? 39.99;
  }

  @override
  Widget build(BuildContext context) {
    final localization = S.of(context);
    final imageHeight = context.responsiveValue<double>(
      mobile: 240.0,
      tablet: 280.0,
      desktop: 320.0,
    );

    final cartItems = ref.watch(cartNotifierProvider).value ?? [];
    final existingCartItem = cartItems.cast<CartItem?>().firstWhere(
      (item) => item?.title == widget.title,
      orElse: () => null,
    );

    final displayQuantity = existingCartItem != null
        ? existingCartItem.quantity
        : quantity;
    final itemPrice = _parsePrice(widget.price);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Center(
              child: Container(
                width: 56,
                height: 5,
                decoration: BoxDecoration(
                  color: AppColors.grey200,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: Container(
                width: context.responsiveValue<double>(
                  mobile: 220.0,
                  tablet: 260.0,
                  desktop: 300.0,
                ),
                height: imageHeight,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                  border: Border.all(color: Theme.of(context).colorScheme.outline),
                  borderRadius: BorderRadius.circular(16),
                ),
                clipBehavior: Clip.antiAlias,
                child: widget.imagePath.isNotEmpty
                        ? widget.imagePath.startsWith('http')
                        ? Image.network(
                            widget.imagePath,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => Icon(
                              Icons.broken_image,
                              color: Theme.of(context).colorScheme.onSurfaceVariant,
                              size: 48,
                            ),
                          )
                        : Image.asset(
                            widget.imagePath,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => Icon(
                              Icons.broken_image,
                              color: Theme.of(context).colorScheme.onSurfaceVariant,
                              size: 48,
                            ),
                          )
                    : Icon(
                        Icons.book,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                        size: 48,
                      ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    widget.title,
                    style: AppTextStyles.h4.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ),
                Consumer(
                  builder: (context, ref, child) {
                    final favorites = ref.watch(favoritesNotifierProvider);
                    final isFavorite = favorites.any(
                      (item) => item.bookId == widget.bookId,
                    );

                    return FavoriteHeart(
                      isFavorited: isFavorite,
                      onTap: () async {
                        final notifier = ref.read(
                          favoritesNotifierProvider.notifier,
                        );

                        if (isFavorite) {
                          await notifier.removeFavorite(widget.bookId);
                        } else {
                          await notifier.addFavorite(
                            FavoriteItem(
                              bookId: widget.bookId,
                              title: widget.title,
                              imageUrl: widget.imagePath,
                              price: itemPrice,
                            ),
                          );
                        }
                      },
                    );
                  },
                ),
              ],
            ),
            SvgPicture.asset(widget.brandLogo),
            const SizedBox(height: 8),
            Text(
              localization.productDescriptionPlaceholder,
              style: AppTextStyles.body14Regular.copyWith(
                color: AppColors.grey500,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              localization.reviewLabel,
              style: AppTextStyles.h5.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                RatingBar.builder(
                  initialRating: 4,
                  minRating: 1,
                  allowHalfRating: true,
                  unratedColor: Theme.of(context).colorScheme.onSurfaceVariant,
                  itemCount: 5,
                  itemSize: 24.0,
                  itemPadding: const EdgeInsets.only(right: 2),
                  itemBuilder: (context, _) => SvgPicture.asset(
                    AppIcons.star,
                    colorFilter: ColorFilter.mode(
                      AppColors.yellow,
                      BlendMode.srcIn,
                    ),
                  ),
                  onRatingUpdate: (rating) {
                    setState(() {
                      currentRating = rating;
                    });
                  },
                ),
                const SizedBox(width: 8),
                Text(
                  '(${currentRating.toStringAsFixed(1)})',
                  style: AppTextStyles.body14SemiBold.copyWith(fontSize: 18),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                if (displayQuantity == 0)
                  SmallPrimaryButton(
                    label: localization.addToCartButton,
                    onPressed: () {
                      setState(() {
                        quantity = 1;
                      });
                      ref
                          .read(cartNotifierProvider.notifier)
                          .addToCart(
                            CartItem(
                              id: widget.title,
                              title: widget.title,
                              price: itemPrice,
                              imagePath: widget.imagePath,
                              quantity: 1,
                            ),
                          );
                    },
                  )
                else ...[
                  GestureDetector(
                    onTap: () {
                      if (displayQuantity > 1) {
                        setState(() {
                          quantity = displayQuantity - 1;
                        });
                        ref
                            .read(cartNotifierProvider.notifier)
                            .decrementQuantity(widget.title);
                      } else if (displayQuantity == 1) {
                        if (existingCartItem != null) {
                          ref
                              .read(cartNotifierProvider.notifier)
                              .removeItem(widget.title);
                        }
                        setState(() {
                          quantity = 0;
                        });
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          color: Theme.of(
                            context,
                          ).colorScheme.surfaceContainerHighest,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            AppIcons.minus,
                            width: 18,
                            colorFilter: ColorFilter.mode(
                              Theme.of(context).colorScheme.onSurfaceVariant,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '$displayQuantity',
                    style: AppTextStyles.body16Medium.copyWith(fontSize: 20),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        quantity = displayQuantity + 1;
                      });
                      ref
                          .read(cartNotifierProvider.notifier)
                          .addToCart(
                            CartItem(
                              id: widget.title,
                              title: widget.title,
                              price: itemPrice,
                              imagePath: widget.imagePath,
                              quantity: 1,
                            ),
                          );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            AppIcons.plus,
                            width: 17,
                            colorFilter: ColorFilter.mode(
                              Theme.of(context).colorScheme.onPrimary,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
                const SizedBox(width: 12),
                Text(
                  '\$${itemPrice.toStringAsFixed(2)}',
                  style: AppTextStyles.body16Medium.copyWith(
                    color: AppColors.primary500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(48),
                        ),
                        elevation: 0,
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        textStyle: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                        foregroundColor: Theme.of(
                          context,
                        ).colorScheme.onPrimary,
                      ),
                      child: Text(
                        localization.continueShoppingButton,
                        style: AppTextStyles.h6,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        ref.read(bottomNavIndexProvider.notifier).state = 2;
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(
                          context,
                        ).colorScheme.primaryContainer,
                        textStyle: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        padding: EdgeInsets.zero,
                      ),
                      child: Text(
                        localization.viewCartButton,
                        style: AppTextStyles.h6,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}