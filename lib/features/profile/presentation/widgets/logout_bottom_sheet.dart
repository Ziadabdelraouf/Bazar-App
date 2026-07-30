import 'package:bazar_group_1/core/components/buttons/large_primary_button.dart';
import 'package:bazar_group_1/core/router/app_routes.dart';
import 'package:bazar_group_1/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class LogoutBottomSheet extends StatelessWidget {
  const LogoutBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.all(20.0),

        child: Column(
          spacing: 12,
          mainAxisSize: MainAxisSize.min,
          children: [
            const ListTile(title: Text('Logout')),
            Text("Are You Sure you want to log out ?"),
            LargePrimaryButton(
              label: "Logout",
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoutes.onboardingPage,
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
