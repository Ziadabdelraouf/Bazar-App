import 'package:bazar_group_1/features/profile/presentation/widgets/profile_header.dart';
import 'package:bazar_group_1/features/profile/presentation/widgets/profile_menu_list.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [ProfileHeader(), SizedBox(height: 12), ProfileMenuList()],
      ),
    );
  }
}
