import 'package:bazar_group_1/core/localization/generated/l10n.dart';
import 'package:bazar_group_1/core/theme/app_colors.dart';
import 'package:bazar_group_1/core/theme/app_images.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';
import 'package:bazar_group_1/features/auth/data/services/auth_service.dart';
import 'package:bazar_group_1/features/auth/presentation/providers/auth_service_provider.dart';
import 'package:bazar_group_1/features/auth/presentation/providers/name_notifier_provider.dart';
import 'package:bazar_group_1/features/auth/presentation/providers/phone_number_notifier.dart';
import 'package:bazar_group_1/features/profile/presentation/widgets/logout_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileHeader extends ConsumerWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(nameNotifierProvider);
    final phoneState = ref.watch(phoneNumberNotifierProvider);
    final profileAsync = ref.watch(userProfileProvider);

    final storedProfile = profileAsync.asData?.value;
    final displayName = name.isNotEmpty
        ? name
        : (storedProfile?['name'] ?? AuthService.fallbackName);

    final countryCode = phoneState.selectedCountry.dialCode;
    final digits = phoneState.digits;
    final phoneText = digits.isNotEmpty
        ? "$countryCode $digits"
        : (storedProfile?['mobile'] ?? AuthService.fallbackMobile);

    final isRtl = Directionality.of(context) == TextDirection.rtl;

    return Column(
      children: [
        Divider(color: AppColors.grey200, thickness: 1),
        SizedBox(
          height: 80,
          child: ListTile(
            leading: CircleAvatar(
              radius: 40,
              child: Image.asset(
                AppImages.profilePlaceholder,
                width: 55,
                height: 55,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              displayName.isNotEmpty ? displayName : AuthService.fallbackName,
              style: AppTextStyles.h6.copyWith(color: AppColors.grey900),
            ),
            subtitle: Text(
              phoneText.isNotEmpty ? phoneText : AuthService.fallbackMobile,
              style: AppTextStyles.body14Regular.copyWith(
                color: AppColors.grey500,
              ),
              textDirection: TextDirection.ltr,
              textAlign: isRtl ? TextAlign.right : TextAlign.left,
            ),
            trailing: TextButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => LogoutBottomSheet(),
                );
              },
              child: Text(
                S.of(context).logOut,
                style: AppTextStyles.body14Bold.copyWith(color: AppColors.red),
              ),
            ),
          ),
        ),
        Divider(color: AppColors.grey200, thickness: 1),
      ],
    );
  }
}
