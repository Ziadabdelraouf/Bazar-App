import 'package:bazar_group_1/core/theme/app_colors.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';
import 'package:bazar_group_1/features/home/domain/entities/author.dart';
import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';

class AuthorCard extends StatelessWidget {
  const AuthorCard({
    super.key,
    required this.author,});
    final Author author;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        author.image.isEmpty
          ?Container(
                    width: 115,
                    height: 115,
                    color: Colors.grey.shade300,
                    child: const Icon(
                      Icons.person,
                      size: 50,
                    ),
                  )
          :Image.network(author.image,width: 115,
                    height: 115,
                    fit: BoxFit.cover,),
        
        Text(author.name,style: AppTextStyles.body16Medium.copyWith(color: AppColors.grey900),),
        Text(author.role,style: AppTextStyles.body14Regular.copyWith(color: AppColors.grey500),),



      ],
    );
  }
}