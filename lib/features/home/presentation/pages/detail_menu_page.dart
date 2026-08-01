import 'package:bazar_group_1/core/localization/generated/l10n.dart';
import 'package:bazar_group_1/core/responsive/app_responsive_breakpoints.dart';
import 'package:bazar_group_1/core/theme/app_colors.dart';
import 'package:bazar_group_1/core/theme/app_icons.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';
import 'package:bazar_group_1/features/profile/domain/entities/favorite_item.dart';
import 'package:bazar_group_1/features/profile/presentation/notifiers/favorites_notifier.dart';
import 'package:bazar_group_1/features/profile/presentation/widgets/favorite_heart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class DetailMenuPage extends StatefulWidget {
  final String title;
  final String price;
  final String imagePath;
  final String brandLogo;

  const DetailMenuPage({
    super.key,
    required this.title,
    required this.price,
    required this.imagePath,
    required this.brandLogo,
  });

  @override
  State<DetailMenuPage> createState() => _DetailMenuPageState();
}

class _DetailMenuPageState extends State<DetailMenuPage> {
  double currentRating = 4.0;
  int quantity = 1;
  String price = '\$39.99';
  @override
  Widget build(BuildContext context) {
    final localization = S.of(context);
    final imageHeight = context.responsiveValue<double>(
      mobile: 240.0,
      tablet: 280.0,
      desktop: 320.0,
    );

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
                  color: AppColors.grey500,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(16),
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
                    style: AppTextStyles.h4.copyWith(color: AppColors.grey900),
                  ),
                ),
                Consumer(
                  builder: (context, ref, child) {
                    final isFavorited = ref.watch(favoritesNotifierProvider.select(
                      (favorites) => favorites.any((item) => item.title == widget.title),
                    ));

                    return FavoriteHeart(
                      isFavorited: isFavorited,
                      onTap: () {
                        final notifier = ref.read(favoritesNotifierProvider.notifier);

                        if (isFavorited) {
                          notifier.removeFavorite(widget.title);
                        } else {
                          notifier.addFavorite(
                            FavoriteItem.fromPriceText(
                              title: widget.title,
                              priceText: widget.price,
                              imageUrl: widget.imagePath,
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
                color: AppColors.grey900,
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
                  unratedColor: AppColors.grey900,
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
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (quantity > 1) quantity--;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: AppColors.grey200,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          AppIcons.minus,
                          width: 18,
                          colorFilter: ColorFilter.mode(
                            AppColors.grey500,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '$quantity',
                  style: AppTextStyles.body16Medium.copyWith(fontSize: 20),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      quantity++;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: AppColors.primary500,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          AppIcons.plus,
                          width: 17,
                          colorFilter: ColorFilter.mode(
                            AppColors.white,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  price,
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
                        backgroundColor: AppColors.primary500,
                        textStyle: const TextStyle(color: AppColors.white),
                        foregroundColor: AppColors.white,
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
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary50,
                        textStyle: const TextStyle(color: AppColors.primary500),
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
