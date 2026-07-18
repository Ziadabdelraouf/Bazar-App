import 'package:bazar_group_1/core/theme/app_colors.dart';
import 'package:bazar_group_1/core/theme/app_icons.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';
import 'package:bazar_group_1/features/forgot_password/domain/contact_method.dart';
import 'package:bazar_group_1/features/forgot_password/presentation/providers/contact_method_provider.dart';
import 'package:bazar_group_1/features/forgot_password/presentation/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class ResetPasswordPage extends ConsumerStatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  ConsumerState<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends ConsumerState<ResetPasswordPage> {
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final selectedMethod = ref.watch(selectedContactMethodProvider);
    return Directionality(
      textDirection: TextDirection.ltr,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: SvgPicture.asset(AppIcons.arrowLeftOutline),
            ),
          ),
          backgroundColor: Colors.white,
          body: Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * (24 / 375),
              right: MediaQuery.of(context).size.width * (24 / 375),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Reset password',
                  style: AppTextStyles.h3.copyWith(color: AppColors.grey900),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * (8 / 812),
                ),
                Text(
                  selectedMethod == ContactMethod.email
                      ? 'Please enter your email, we will send verification code to your email.'
                      : 'Please enter your phone number, we will send a verification code to your phone number.',
                  style: AppTextStyles.body16Regular.copyWith(
                    color: AppColors.grey600,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * (18 / 812),
                ),
                Text(
                  selectedMethod == ContactMethod.email
                      ? 'Email'
                      : 'Phone Number',
                  style: AppTextStyles.body14Medium.copyWith(
                    color: AppColors.grey900,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  height: MediaQuery.of(context).size.height * (48 / 812),
                  decoration: BoxDecoration(
                    color: AppColors.grey50,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextField(
                    focusNode: _focusNode,
                    keyboardType: selectedMethod == ContactMethod.email
                        ? TextInputType.emailAddress
                        : TextInputType.phone,
                    style: AppTextStyles.body16Medium.copyWith(
                      color: AppColors.grey900,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal:
                            MediaQuery.of(context).size.width * (16 / 375),
                      ),
                      hintText: _focusNode.hasFocus
                          ? null
                          : (selectedMethod == ContactMethod.email
                                ? 'example@email.com'
                                : '(+965) 123 435 7565'),
                      hintStyle: AppTextStyles.body16Medium.copyWith(
                        color: AppColors.grey900,
                      ),
                      prefixIcon: selectedMethod == ContactMethod.phone
                          ? Padding(
                              padding: EdgeInsets.only(
                                left:
                                    MediaQuery.of(context).size.width *
                                    (16 / 375),
                                right:
                                    MediaQuery.of(context).size.width *
                                    (8 / 375),
                              ),
                              child: SvgPicture.asset(
                                AppIcons.phoneFill,
                                colorFilter: const ColorFilter.mode(
                                  AppColors.primary500,
                                  BlendMode.srcIn,
                                ),
                              ),
                            )
                          : null,
                      prefixIconConstraints: const BoxConstraints(),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * (327 / 375),
                  height: 48,
                ),
                PrimaryButton(text: 'Send', onPressed: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
