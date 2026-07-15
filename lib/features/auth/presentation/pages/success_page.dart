import 'package:bazar_group_1/features/auth/presentation/widgets/password_change.dart';
import 'package:bazar_group_1/features/auth/presentation/widgets/successful_login.dart';
import 'package:flutter/material.dart';
import 'package:bazar_group_1/core/constants/enums.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key, required this.flow});
  final SuccessPageFlow flow;
  @override
  Widget build(BuildContext context) {
    final screensize = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: screensize.height * 0.039,
          right: screensize.width * 0.07,
          left: screensize.width * 0.07,
        ),
        child: flow == SuccessPageFlow.successfulLogin
            ? SuccessfulLogin()
            : PasswordChange(),
      ),
    );
  }
}
