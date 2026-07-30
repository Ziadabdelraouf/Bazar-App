import 'package:bazar_group_1/features/profile/presentation/widgets/profile_header.dart';
import 'package:bazar_group_1/features/profile/presentation/widgets/profile_menu_list.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [ProfileHeader(), SizedBox(height: 12), ProfileMenuList()],
      ),
    );
  }
}
