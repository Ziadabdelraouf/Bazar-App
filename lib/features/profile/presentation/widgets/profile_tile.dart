import 'package:bazar_group_1/core/theme/app_icons.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileTile extends StatelessWidget {
  final Widget? leading;
  final String title;
  final VoidCallback onTap;

  const ProfileTile({
    super.key,
    required this.title,
    required this.onTap,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    final isRtl = Directionality.of(context) == TextDirection.rtl;
    final colorScheme = Theme.of(context).colorScheme;

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      onTap: onTap,
      leading: CircleAvatar(
        radius: 30,
        backgroundColor: colorScheme.primaryContainer,
        child: leading,
      ),
      trailing: IconButton(
        iconSize: 24,
        onPressed: onTap,
        icon: Transform.flip(
          flipX: isRtl,
          child: SvgPicture.asset(
            AppIcons.arrowRight2,
            colorFilter: ColorFilter.mode(
              colorScheme.onSurfaceVariant,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
      title: Text(
        title,
        style: AppTextStyles.body16Medium.copyWith(
          color: colorScheme.onSurface,
        ),
      ),
    );
  }
}
