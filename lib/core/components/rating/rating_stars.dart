import 'package:bazar_group_1/core/theme/app_colors.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class RatingStars extends StatelessWidget {
  const RatingStars({
    super.key,
    required this.rating,
    required this.size,
    this.showRatingNumbers = false,
  });

  final double rating;
  final double size;
  final bool showRatingNumbers;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(5, (index) {
          if (index < rating) {
            return Icon(Icons.star, color: AppColors.yellow, size: size);
          } else {
            return Icon(Icons.star, color: AppColors.grey900, size: size);
          }
        }),
        if (showRatingNumbers) ...[
          SizedBox(width: 4),
          Text(
            "(${rating.toDouble()})",
            style: AppTextStyles.body16Medium.copyWith(
              color: AppColors.grey900,
            ),
          ),
        ],
      ],
    );
  }
}
