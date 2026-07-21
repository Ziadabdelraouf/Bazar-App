import 'package:bazar_group_1/core/localization/generated/l10n.dart';
import 'package:bazar_group_1/core/router/app_routes.dart';
import 'package:bazar_group_1/core/theme/app_colors.dart';
import 'package:bazar_group_1/features/auth/presentation/providers/sign_up_provider.dart';
import 'package:bazar_group_1/features/auth/presentation/widgets/sign_up_form_widget.dart';
import 'package:bazar_group_1/features/auth/presentation/widgets/sign_up_header_widget.dart';
import 'package:bazar_group_1/features/auth/presentation/widgets/sign_up_register_widget.dart';
import 'package:bazar_group_1/features/auth/presentation/widgets/term_and_condition_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});

  @override
  ConsumerState<SignUpPage> createState() =>
      _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final localization = S.of(context);
    final signUpNotifier = ref.watch(
      signUpProvider.notifier,
    );

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            autovalidateMode:
                AutovalidateMode.onUserInteractionIfError,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                    start: 16,
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.popAndPushNamed(
                        context,
                        AppRoutes.onboardingPage,
                      );
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 24,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                    start: 24,
                    top: 16,
                  ),
                  child: SignUpHeaderWidget(
                    title: localization.signUpTitle,
                    subtitle: localization.signUpSubtitle,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: SignUpFormWigdet(
                    nameController:
                        signUpNotifier.nameController,
                    emailController:
                        signUpNotifier.emailController,
                    passwordController:
                        signUpNotifier.passwordController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: SignUpRegisterWidget(
                    formKey: _formKey,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    top: 138,
                    bottom: 56,
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: TermAndConditionWidget(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
