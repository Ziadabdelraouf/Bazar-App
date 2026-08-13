import 'package:bazar_group_1/core/theme/app_icons.dart';
import 'package:bazar_group_1/features/notifications/presentation/pages/notifications_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NotificationIcon extends StatelessWidget {
  const NotificationIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const NotificationsPage()),
        );
      },
      child: Badge(child: SvgPicture.asset(AppIcons.bellOutline, height: 28)),
    );
  }
}
