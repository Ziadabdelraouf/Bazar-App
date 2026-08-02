import 'package:bazar_group_1/core/theme/app_colors.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';
import 'package:bazar_group_1/features/profile/presentation/widgets/help_option_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';

class HelpCenterPage extends StatelessWidget {
  const HelpCenterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
           width: double.infinity,
           height: 252,
           //padding: const EdgeInsets.fromLTRB(24, 12, 24, 32),
           decoration: BoxDecoration(
            color: AppColors.primary500,
           ),
           child: SafeArea(
            bottom: false,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children :[
                       Align(
                        alignment: Alignment.centerLeft,
                        child: Icon(Icons.arrow_back,size: 24,color: Colors.white,)),
                  Text("Order History",style:AppTextStyles.h4.copyWith(color: Colors.white)) ]),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 45),
                    child: Column(
                      children: [
                        Text("Help Center",style: AppTextStyles.h3.copyWith(color:Colors.white),),
                        Text(" Tell us how we can help 👋\nChapter are standing by for service & support!",style: AppTextStyles.body16Regular.copyWith(color:AppColors.primary200),textAlign: TextAlign.center,),
                    
                      ],
                    ),
                  )
                ],
          
           ),)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 16,
            children: [
              HelpOptionCard(icon: Icons.email_rounded, title: 'Email', subtitle: 'Send to your email'),
              HelpOptionCard(icon: Icons.phone, title: 'Phone', subtitle: 'Send to your phone'),

            ],
          )
        ],
      ),
    );

     
  }
}