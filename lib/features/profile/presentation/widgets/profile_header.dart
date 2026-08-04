import 'package:bazar_group_1/core/localization/generated/l10n.dart';
import 'package:bazar_group_1/core/theme/app_images.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';
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
    final countryCode = phoneState.selectedCountry.dialCode;
    final digits = phoneState.digits;
    final phoneText = digits.isNotEmpty
        ? "$countryCode $digits"
        : "$countryCode 000000000";

    final isRtl = Directionality.of(context) == TextDirection.rtl;
    final colorScheme = Theme.of(context).colorScheme;
    final titleColor = colorScheme.onSurface;
    final subtitleColor = colorScheme.onSurfaceVariant;
    final actionColor = colorScheme.primary;

    return Column(
      children: [
        Divider(
          color: Theme.of(context).colorScheme.outlineVariant,
          thickness: 1,
        ),
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
              name.isNotEmpty ? name : "John Doe",
              style: AppTextStyles.h6.copyWith(color: titleColor),
            ),
            subtitle: Text(
              phoneText,
              style: AppTextStyles.body14Regular.copyWith(color: subtitleColor),
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
                style: AppTextStyles.body14Bold.copyWith(color: actionColor),
              ),
            ),
          ),
        ),
        Divider(
          color: Theme.of(context).colorScheme.outlineVariant,
          thickness: 1,
        ),
      ],
    );
  }
}
