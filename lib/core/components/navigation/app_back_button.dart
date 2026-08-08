import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bazar_group_1/core/theme/app_icons.dart';

class AppBackButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const AppBackButton({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final isRtl = Directionality.of(context) == TextDirection.rtl;

    return IconButton(
      icon: Transform.flip(
        flipX: isRtl,
        child: SvgPicture.asset(
          AppIcons.arrowLeftOutline,
          width: 24,
          height: 24,
          colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.onSurface, BlendMode.srcIn),
        ),
      ),
      onPressed: onPressed ?? () {
        if (Navigator.canPop(context)) {
          Navigator.pop(context);
        }
      },
    );
  }
}