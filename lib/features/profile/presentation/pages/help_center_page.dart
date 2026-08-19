import 'package:bazar_group_1/core/localization/generated/l10n.dart';
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
      backgroundColor: Colors.white,
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
              color: Theme.of(context).colorScheme.primary,
             ),
             child: Column(
               children: [
                 Stack(
                   alignment: Alignment.center,
                   children :[
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: Icon(Icons.arrow_back, size: 24, color: Theme.of(context).colorScheme.onPrimary),
                        ),
                      ),
                 Text(localization.helpCenterTitle,style:AppTextStyles.h4.copyWith(color: Theme.of(context).colorScheme.onPrimary)) ]),
                 Padding(
                   padding: const EdgeInsets.symmetric(vertical: 45),
                   child: Column(
                     children: [
                       Text(localization.helpCenterTitle,style: AppTextStyles.h3.copyWith(color: Theme.of(context).colorScheme.onPrimary),),
                       Text(localization.helpCenterSubtitle,style: AppTextStyles.body16Regular.copyWith(color: Theme.of(context).colorScheme.primaryContainer),textAlign: TextAlign.center,),
                   
                     ],
                   ),
                 )
               ],
                         
                          ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: HelpOptionCard(
                        icon: Icons.email_rounded,
                        title: localization.helpCenterEmailTitle,
                        subtitle: localization.helpCenterEmailSubtitle,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: HelpOptionCard(
                        icon: Icons.phone,
                        title: localization.helpCenterPhoneTitle,
                        subtitle: localization.helpCenterPhoneSubtitle,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );

     
  }
}