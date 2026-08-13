import 'package:bazar_group_1/features/profile/presentation/widgets/dark_mode_toggle_tile.dart';
import 'package:bazar_group_1/features/profile/presentation/widgets/language_toggle_tile.dart';
import 'package:bazar_group_1/features/profile/presentation/widgets/profile_header.dart';
import 'package:bazar_group_1/features/profile/presentation/widgets/profile_menu_list.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const ProfileHeader(),
          const SizedBox(height: 12),
          const LanguageToggleTile(),
          const DarkModeToggleTile(),
          Divider(
            height: 32,
            thickness: 1,
            color: Theme.of(context).dividerColor,
          ),
          const ProfileMenuList(),
        ],
      ),
    );
  }
}
