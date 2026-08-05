import 'package:bazar_group_1/core/localization/generated/l10n.dart';
import 'package:bazar_group_1/core/theme/app_images.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class ProfileAvatarEdit extends StatelessWidget {
  const ProfileAvatarEdit({super.key});
  @override
  Widget build(BuildContext context) {
    final localization = S.of(context);

    return Column(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: CircleAvatar(
              backgroundImage: ExactAssetImage(AppImages.profilePlaceholder),
              radius: 50,
            ),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            localization.changePictureButton,
            style: AppTextStyles.body16SemiBold,
          ),
        ),
      ],
    );
  }
}
