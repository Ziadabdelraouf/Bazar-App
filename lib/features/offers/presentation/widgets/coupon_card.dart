import 'package:bazar_group_1/core/theme/app_colors.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';
import 'package:bazar_group_1/features/offers/domain/models/coupon.dart';
import 'package:flutter/material.dart';

class CouponCard extends StatelessWidget {
  final Coupon coupon;

  const CouponCard({super.key, required this.coupon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * (155 / 375),
      height: 161,
      decoration: BoxDecoration(
        color: coupon.backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${coupon.discountPercent}%',
              style: AppTextStyles.h2.copyWith(color: AppColors.white),
            ),
            const SizedBox(height: 4),
            Text(
              'OFF',
              style: AppTextStyles.h2.copyWith(color: AppColors.white),
            ),
            const SizedBox(height: 8),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(30),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  'Copy',
                  style: AppTextStyles.body14Bold.copyWith(
                    color: coupon.backgroundColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
