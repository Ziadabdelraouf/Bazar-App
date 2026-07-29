import 'package:bazar_group_1/features/home/presentation/widgets/best_vendors_widget.dart';
import 'package:bazar_group_1/features/home/presentation/widgets/top_of_week_section.dart';
import 'package:bazar_group_1/features/home/presentation/widgets/special_offer.dart';
import 'package:bazar_group_1/features/home/presentation/widgets/author_widget.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
    );
  }
}
