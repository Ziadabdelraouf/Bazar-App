import 'package:bazar_group_1/core/theme/app_colors.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class ProfileAvatarEdit extends StatelessWidget {
  const ProfileAvatarEdit({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/Ellipse.png'),
              radius: 50,
            ),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text('Change Picture', style: AppTextStyles.body16SemiBold),
        ),
      ],
    );
  }
}
