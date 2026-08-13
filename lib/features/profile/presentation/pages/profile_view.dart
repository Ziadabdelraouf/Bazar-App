import 'package:bazar_group_1/core/components/app_bars/app_back_bar.dart';
import 'package:bazar_group_1/core/localization/generated/l10n.dart';
import 'package:bazar_group_1/features/profile/presentation/widgets/language_toggle_tile.dart';
import 'package:bazar_group_1/features/profile/presentation/widgets/profile_header.dart';
import 'package:bazar_group_1/features/profile/presentation/widgets/profile_menu_list.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onSecondary,
      appBar: AppBackBar(title: S.of(context).profileTitle),
      body: const SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ProfileHeader(),
            SizedBox(height: 12),
            LanguageToggleTile(),
            ProfileMenuList(),
          ],
        ),
      ),
    );
  }
}
