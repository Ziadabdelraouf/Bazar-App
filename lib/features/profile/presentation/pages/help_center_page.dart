import 'package:bazar_group_1/core/localization/generated/l10n.dart';
import 'package:bazar_group_1/core/theme/app_colors.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';
import 'package:bazar_group_1/features/profile/presentation/widgets/help_option_card.dart';
import 'package:flutter/material.dart';

class HelpCenterPage extends StatelessWidget {
  const HelpCenterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final localization=S.of(context);
    final topInset = MediaQuery.paddingOf(context).top;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
             width: double.infinity,
             constraints:  BoxConstraints(
              minHeight: 252 + topInset,
             ),
             
             padding:  EdgeInsets.fromLTRB(24,  topInset + 12, 24, 32),
             decoration: BoxDecoration(
              color: AppColors.primary500,
             ),
             child: Column(
               children: [
                 Stack(
                   alignment: Alignment.center,
                   children :[
                      Align(
                       alignment: AlignmentDirectional.centerStart,
                       child: Icon(Icons.arrow_back,size: 24,color: Colors.white,)),
                 Text(localization.orderHistory,style:AppTextStyles.h4.copyWith(color: Colors.white)) ]),
                 Padding(
                   padding: const EdgeInsets.symmetric(vertical: 45),
                   child: Column(
                     children: [
                       Text(localization.helpCenterTitle,style: AppTextStyles.h3.copyWith(color:Colors.white),),
                       Text(localization.helpCenterSubtitle,style: AppTextStyles.body16Regular.copyWith(color:AppColors.primary200),textAlign: TextAlign.center,),
                   
                     ],
                   ),
                 )
               ],
                         
                          ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              
              spacing: 16,
              children: [
                HelpOptionCard(icon: Icons.email_rounded, title: localization.helpCenterEmailTitle, subtitle: localization.helpCenterEmailSubtitle),
                HelpOptionCard(icon: Icons.phone, title: localization.helpCenterPhoneTitle, subtitle: localization.helpCenterPhoneSubtitle),
        
              ],
            )
          ],
        ),
      ),
    );

     
  }
}