import 'package:bazar_group_1/core/components/app_bars/app_back_bar.dart';
import 'package:bazar_group_1/core/localization/generated/l10n.dart';
import 'package:bazar_group_1/core/theme/app_colors.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';
import 'package:bazar_group_1/features/offers/domain/models/coupon.dart';
import 'package:bazar_group_1/features/offers/presentation/widgets/coupon_card.dart';
import 'package:flutter/material.dart';

class OffersPage extends StatelessWidget {
  const OffersPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Coupon> couponsCard = [
      Coupon(
        discountPercent: 50,
        backgroundColor: AppColors.yellow,
        code: 'SAVE50',
      ),
      Coupon(
        discountPercent: 23,
        backgroundColor: AppColors.blue,
        code: 'SAVE23',
      ),
      Coupon(
        discountPercent: 50,
        backgroundColor: AppColors.orange,
        code: 'SAVE50',
      ),
      Coupon(
        discountPercent: 23,
        backgroundColor: AppColors.primary500,
        code: 'SAVE23',
      ),
      Coupon(
        discountPercent: 50,
        backgroundColor: AppColors.grey900,
        code: 'SAVE50',
      ),
      Coupon(
        discountPercent: 23,
        backgroundColor: AppColors.red,
        code: 'SAVE23',
      ),
    ];
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBackBar(title: S.of(context).offersAndPromos),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).availableCoupons(couponsCard.length),
              style: AppTextStyles.h5.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 32),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                  childAspectRatio: 155 / 161,
                ),
                itemCount: couponsCard.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: CouponCard(coupon: couponsCard[index]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
