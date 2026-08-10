import 'package:bazar_group_1/core/components/app_bars/app_back_bar.dart';
import 'package:bazar_group_1/core/localization/generated/l10n.dart';
import 'package:bazar_group_1/core/theme/app_colors.dart';
import 'package:bazar_group_1/core/theme/app_icons.dart';
import 'package:bazar_group_1/features/home/presentation/widgets/notification_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBackBar(
        title: S.of(context).cartTitle,
        trailingWidget: NotificationIcon(),
      ),
      backgroundColor: Theme.of(context).colorScheme.onSecondary,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AppIcons.cartFill,
              width: 250,
              height: 250,
              colorFilter: ColorFilter.mode(AppColors.grey300, BlendMode.srcIn),
            ),
            Text(
              "There is no products",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        ),
      ),
    );
  }
}
