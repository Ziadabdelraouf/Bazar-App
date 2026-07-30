import 'package:bazar_group_1/core/localization/generated/l10n.dart';
import 'package:bazar_group_1/core/theme/app_colors.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';
import 'package:bazar_group_1/features/auth/presentation/providers/name_notifier_provider.dart';
import 'package:bazar_group_1/features/auth/presentation/providers/phone_number_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileHeader extends ConsumerWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(nameNotifierProvider);
    final phoneState = ref.watch(phoneNumberNotifierProvider);
    final countryCode = phoneState.selectedCountry.dialCode;
    final digits = phoneState.digits;
    final phoneText = digits.isNotEmpty
        ? "$countryCode $digits"
        : "$countryCode 000000000";

    return Column(
      children: [
        Divider(color: AppColors.grey200, thickness: 1),
        SizedBox(
          height: 80,
          child: ListTile(
            leading: CircleAvatar(
              radius: 40,
              child: Image.asset(
                "assets/images/profile_placeholder.png",
                width: 55,
                height: 55,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              name.isNotEmpty ? name : "John Doe",
              style: AppTextStyles.h6.copyWith(color: AppColors.grey900),
            ),
            subtitle: Text(
              phoneText,
              style: AppTextStyles.body14Regular.copyWith(
                color: AppColors.grey500,
              ),
            ),
            trailing: TextButton(
              onPressed: () {},
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
