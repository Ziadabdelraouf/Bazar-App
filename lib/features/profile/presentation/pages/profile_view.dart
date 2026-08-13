import 'package:bazar_group_1/core/localization/generated/l10n.dart';
import 'package:bazar_group_1/features/profile/presentation/widgets/profile_menu_list.dart';
import 'package:bazar_group_1/features/profile/presentation/widgets/profile_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileView extends ConsumerWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          ProfileHeader(),
          SizedBox(height: 24),
          ProfileMenuList(),
        ],
      ),
    );
  }
}