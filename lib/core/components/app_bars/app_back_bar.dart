import 'package:bazar_group_1/core/theme/app_colors.dart';
import 'package:bazar_group_1/core/theme/app_icons.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppBackBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? trailingWidget;
  final Widget? leadingWidget;
  const AppBackBar({
    super.key,
    this.title,
    this.trailingWidget,
    this.leadingWidget,
  });
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      actionsPadding: EdgeInsets.only(right: 20),
      backgroundColor: AppColors.white,
      leading: leadingWidget != null
          ? IconButton(
              icon: SizedBox(
                height: 24,
                width: 24,
                child: FittedBox(fit: BoxFit.scaleDown, child: leadingWidget),
              ),
              onPressed: () {},
            )
          : IconButton(
              onPressed: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              },
              icon: SvgPicture.asset(AppIcons.arrowLeftOutline),
            ),
      centerTitle: true,
      title: Text(
        title ?? '',
        style: AppTextStyles.h4.copyWith(color: AppColors.grey900),
      ),
      actions: [
        trailingWidget != null
            ? IconButton(
                icon: SizedBox(
                  height: 24,
                  width: 24,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: trailingWidget,
                  ),
                ),
                onPressed: () {},
              )
            : SizedBox.shrink(),
      ],
    );
  }
}
