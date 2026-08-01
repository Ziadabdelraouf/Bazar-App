import 'package:bazar_group_1/core/theme/app_colors.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class AppBackBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? leadingWidget;
  final Widget? trailingWidget;
  final VoidCallback? onLeadingPressed;
  final VoidCallback? onTrailingPressed;

  const AppBackBar({
    super.key,
    this.title,
    this.leadingWidget,
    this.trailingWidget,
    this.onLeadingPressed,
    this.onTrailingPressed,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: false,
      actionsPadding: const EdgeInsets.only(right: 20),
      backgroundColor: AppColors.white,
      leading: leadingWidget != null
          ? IconButton(
              icon: SizedBox(
                height: 24,
                width: 24,
                child: FittedBox(fit: BoxFit.scaleDown, child: leadingWidget),
              ),
              onPressed: onLeadingPressed ?? () {},
            )
          : null,
      centerTitle: true,
      title: Text(
        title ?? '',
        style: AppTextStyles.h4.copyWith(color: AppColors.grey900),
      ),
      actions: trailingWidget != null
          ? [
              IconButton(
                icon: SizedBox(
                  height: 24,
                  width: 24,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: trailingWidget,
                  ),
                ),
                onPressed: onTrailingPressed ?? () {},
              ),
            ]
          : null,
    );
  }
}
