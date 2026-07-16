import 'package:bazar_group_1/core/localization/generated/l10n.dart';
import 'package:bazar_group_1/core/router/app_routes.dart';
import 'package:bazar_group_1/features/auth/presentation/widgets/sign_up_form_widget.dart';
import 'package:bazar_group_1/features/auth/presentation/widgets/sign_up_header_widget.dart';
import 'package:bazar_group_1/features/auth/presentation/widgets/sign_up_register_widget.dart';
import 'package:bazar_group_1/features/auth/presentation/widgets/term_and_condition_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});

  @override
  ConsumerState<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void register() {
    final isFormValid = formKey.currentState?.validate() ?? false;

    if (!isFormValid) {
      return;
    }

    Navigator.pushReplacementNamed(
      context,
      AppRoutes.verificationPage,
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localization = S.of(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
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
                    nameController: nameController,
                    emailController: emailController,
                    passwordController: passwordController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: SignUpRegisterWidget(
                    registerButton: register,
                    onSignInPressed: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.verificationPage,
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
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