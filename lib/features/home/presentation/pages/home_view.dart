import 'package:bazar_group_1/core/responsive/app_responsive_breakpoints.dart';
import 'package:bazar_group_1/features/home/presentation/widgets/best_vendors_widget.dart';
import 'package:bazar_group_1/features/home/presentation/widgets/top_of_week_section.dart';
import 'package:bazar_group_1/features/home/presentation/widgets/special_offer.dart';
import 'package:bazar_group_1/features/home/presentation/widgets/author_widget.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    final bannerHeight = context.responsiveValue<double>(
      mobile: (0.2 * screenHeight).clamp(160.0, 220.0),
      tablet: 220.0,
      desktop: 260.0,
    );
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: bannerHeight, child: const SpecialOffer()),
          const SizedBox(height: 12),
          const TopOfWeekSection(),
          const SizedBox(height: 12),
          const BestVendorsWidget(),
          const SizedBox(height: 12),
          const AuthorWidget(),
        ],
      ),
    );
  }
}
