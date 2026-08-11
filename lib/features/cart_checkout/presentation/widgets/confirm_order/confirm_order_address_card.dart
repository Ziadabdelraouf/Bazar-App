import 'package:bazar_group_1/core/localization/generated/l10n.dart';
import 'package:bazar_group_1/core/router/app_routes.dart';
import 'package:bazar_group_1/core/theme/app_colors.dart';
import 'package:bazar_group_1/core/theme/app_icons.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';
import 'package:bazar_group_1/features/profile/presentation/providers/location_address_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ConfirmOrderAddressCard extends ConsumerWidget {
  final String? addressTitle;
  final String? addressSubtitle;
  final VoidCallback? onChangePressed;
  final VoidCallback? onTap;

  const ConfirmOrderAddressCard({
    super.key,
    this.addressTitle,
    this.addressSubtitle,
    this.onChangePressed,
    this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final addressState = ref.watch(locationAddressProvider);

    final displayTitle = (addressTitle != null && addressTitle!.isNotEmpty)
        ? addressTitle!
        : (addressState.addressTitle.isNotEmpty
              ? addressState.addressTitle
              : 'Select an Address');

    final displaySubtitle =
        (addressSubtitle != null && addressSubtitle!.isNotEmpty)
        ? addressSubtitle!
        : (addressState.fullAddress.isNotEmpty
              ? addressState.fullAddress
              : 'Choose your address to complete the order');

    void handleAddressTap() {
      if (onTap != null) {
        onTap!();
      } else {
        Navigator.of(context).pushNamed(AppRoutes.address);
      }
    }

    void handleChangeTap() {
      if (onChangePressed != null) {
        onChangePressed!();
      } else {
        Navigator.of(context).pushNamed(AppRoutes.address);
      }
    }

    return Container(
      decoration: BoxDecoration(
        color: isDark
            ? theme.colorScheme.surfaceContainerHighest
            : AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark ? AppColors.grey700 : AppColors.grey200,
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).confirmOrderAddressHeader,
            style: AppTextStyles.h5.copyWith(
              color: theme.colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 12),
          InkWell(
            onTap: handleAddressTap,
            borderRadius: BorderRadius.circular(8),
            child: Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: isDark ? AppColors.primary900 : AppColors.primary50,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      AppIcons.location,
                      width: 22,
                      height: 22,
                      colorFilter: ColorFilter.mode(
                        theme.colorScheme.primary,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        displayTitle,
                        style: AppTextStyles.body16SemiBold.copyWith(
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        displaySubtitle,
                        style: AppTextStyles.body14Regular.copyWith(
                          color: isDark ? AppColors.grey400 : AppColors.grey600,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                SvgPicture.asset(
                  AppIcons.chevronRight,
                  width: 20,
                  height: 20,
                  colorFilter: ColorFilter.mode(
                    isDark ? AppColors.grey400 : AppColors.grey600,
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Center(
            child: InkWell(
              onTap: handleChangeTap,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: isDark ? AppColors.primary900 : AppColors.primary50,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  S.of(context).confirmOrderChangeButton,
                  style: AppTextStyles.body14SemiBold.copyWith(
                    color: theme.colorScheme.primary,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
