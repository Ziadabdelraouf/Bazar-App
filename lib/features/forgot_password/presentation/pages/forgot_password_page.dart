import 'package:bazar_group_1/core/theme/app_colors.dart';
import 'package:bazar_group_1/core/theme/app_icons.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';
import 'package:bazar_group_1/features/forgot_password/presentation/widgets/contact_method_card.dart';
import 'package:bazar_group_1/features/forgot_password/presentation/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum ContactMethod { email, phone }

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  ContactMethod selectedMethod = ContactMethod.email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(AppIcons.arrowLeftOutline),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * (24 / 375),
          right: MediaQuery.of(context).size.width * (24 / 375),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Forgot password',
              style: AppTextStyles.h3.copyWith(color: AppColors.grey900),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * (8 / 812)),
            Text(
              'Select which contact details should we use to reset your password',
              style: AppTextStyles.body16Regular.copyWith(
                color: AppColors.grey600,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * (16 / 812)),
            Row(
              children: [
                Expanded(
                  child: ContactMethodCard(
                    iconPath: AppIcons.emailBulk,
                    title: 'Email',
                    subtitle: 'Send to your email',
                    isSelected: selectedMethod == ContactMethod.email,
                    onTap: () {
                      setState(() {
                        selectedMethod = ContactMethod.email;
                      });
                    },
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * (16 / 375)),
                Expanded(
                  child: ContactMethodCard(
                    iconPath: AppIcons.phoneFill,
                    title: 'Phone Number',
                    subtitle: 'Send to your phone',
                    isSelected: selectedMethod == ContactMethod.phone,
                    onTap: () {
                      setState(() {
                        selectedMethod = ContactMethod.phone;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 64),
            PrimaryButton(text: 'Continue', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
