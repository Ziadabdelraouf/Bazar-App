import 'package:bazar_group_1/core/components/buttons/small_primary_button.dart';
import 'package:bazar_group_1/core/localization/generated/l10n.dart';
import 'package:bazar_group_1/core/theme/app_icons.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';
import 'package:bazar_group_1/features/home/domain/entities/offer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SpecialOfferCard extends StatelessWidget {
  final Offer offer;
  final VoidCallback? onOrderPressed;

  const SpecialOfferCard({super.key, required this.offer, this.onOrderPressed});

  @override
  Widget build(BuildContext context) {
    final String subtitle = S.of(context).discountPercent(offer.discount);

    return Card(
      color: Theme.of(context).colorScheme.primaryContainer,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide.none,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 12,
                top: 20,
                bottom: 20,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    offer.title,
                    style: AppTextStyles.h4,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: AppTextStyles.body14Regular,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 12),
                  SmallPrimaryButton(
                    label: S.of(context).orderNowButton,
                    onPressed: onOrderPressed ?? () {},
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 2.0),
            child: offer.image.isNotEmpty
                ? Image.network(
                    offer.image,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return SvgPicture.asset(
                        AppIcons.reloadIcon,
                        width: 80,
                        height: 100,
                      );
                    },
                  )
                : SvgPicture.asset(AppIcons.reloadIcon, width: 80, height: 100),
          ),
        ],
      ),
    );
  }
}
