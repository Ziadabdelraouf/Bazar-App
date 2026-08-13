import 'package:bazar_group_1/core/components/app_bars/app_back_bar.dart';
import 'package:bazar_group_1/core/localization/generated/l10n.dart';
import 'package:bazar_group_1/core/theme/app_icons.dart';
import 'package:bazar_group_1/features/home/presentation/widgets/best_vendors_widget.dart';
import 'package:bazar_group_1/features/home/presentation/widgets/notification_icon.dart';
import 'package:bazar_group_1/features/home/presentation/widgets/top_of_week_section.dart';
import 'package:bazar_group_1/features/home/presentation/widgets/special_offer.dart';
import 'package:bazar_group_1/features/home/presentation/widgets/author_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBackBar(
        title: S.of(context).homeTitle,
        trailingWidget: NotificationIcon(),
        leadingWidget: SvgPicture.asset(AppIcons.search),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SpecialOffer(),
            const SizedBox(height: 12),
            const TopOfWeekSection(),
            const SizedBox(height: 12),
            const BestVendorsWidget(),
            const SizedBox(height: 12),
            const AuthorWidget(),
          ],
        ),
      ),
    );
  }
}
