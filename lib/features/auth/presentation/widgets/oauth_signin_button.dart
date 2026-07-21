import 'package:bazar_group_1/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OAuthSignInButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final String icon;

  const OAuthSignInButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.white,
          foregroundColor: AppColors.grey900,

          elevation: 0,
          shape: StadiumBorder(
            side: BorderSide(
              color: AppColors.grey200,
              width: 1.0,
            ),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 8,
          children: [
            SvgPicture.asset(icon, height: 16, width: 16),
            Text(
              text,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.grey900,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
