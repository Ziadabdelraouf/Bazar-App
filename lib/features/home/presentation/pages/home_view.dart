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
    const double baseHeight = 820.0;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: (185 / baseHeight) * screenHeight,
            child: const SpecialOffer(),
          ),
          const SizedBox(height: 16),
          const TopOfWeekSection(),
          const SizedBox(height: 16),
          BestVendorsWidget(),
          const SizedBox(height: 16),
          const AuthorWidget(),
        ],
      ),
    );
  }
}
