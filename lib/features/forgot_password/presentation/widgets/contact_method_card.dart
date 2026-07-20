import 'package:bazar_group_1/core/theme/app_colors.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ContactMethodCard extends StatelessWidget {
  final String iconPath;
  final String title;
  final String subtitle;
  final bool isSelected;
  final VoidCallback onTap;

  const ContactMethodCard({
    super.key,
    required this.iconPath,
    required this.title,
    required this.subtitle,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: MediaQuery.of(context).size.height * (151 / 812),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.white : AppColors.grey50,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? AppColors.primary500 : Colors.transparent,
            width: 1,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(
            MediaQuery.of(context).size.width * (16 / 375),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * (48 / 375),
                height: MediaQuery.of(context).size.width * (48 / 375),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    iconPath,
                    width: MediaQuery.of(context).size.width * (24 / 375),
                    height: MediaQuery.of(context).size.width * (24 / 375),
                    colorFilter: ColorFilter.mode(
                      isSelected ? AppColors.primary500 : AppColors.grey400,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * (16 / 812)),
              Text(
                title,
                style: AppTextStyles.body14Medium.copyWith(
                  color: AppColors.grey900,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: AppTextStyles.body12Regular.copyWith(
                  color: AppColors.grey600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
