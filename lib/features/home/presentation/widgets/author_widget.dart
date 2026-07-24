import 'package:bazar_group_1/core/theme/app_colors.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class AuthorWidget extends StatelessWidget {
  const AuthorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [
          Expanded(child: Text("Authors",style:AppTextStyles.h5.copyWith(color: AppColors.grey900),)),
          Text("See all",style: AppTextStyles.body14Bold.copyWith(color: AppColors.primary500),)
        ],
        ),
        
        
      ],
    );
  }
}