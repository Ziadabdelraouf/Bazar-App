import 'package:bazar_group_1/core/components/app_bars/app_back_bar.dart';
import 'package:bazar_group_1/core/localization/generated/l10n.dart';
import 'package:flutter/material.dart';

class AddressBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AddressBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = S.of(context);
    return AppBackBar(title: localization.locationTitle);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}