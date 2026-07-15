import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bazar_group_1/core/theme/app_colors.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';
import 'package:bazar_group_1/core/theme/app_icons.dart';

class NumericKeypad extends StatelessWidget {
  final void Function(String digit) onDigitPressed;
  final VoidCallback onDeletePressed;
  final Color backgroundColor;
  final Color foregroundColor;

  const NumericKeypad({
    super.key,
    required this.onDigitPressed,
    required this.onDeletePressed,
    required this.backgroundColor,
    required this.foregroundColor,
  });

  static const List<String> _keys = [
    '1', '2', '3',
    '4', '5', '6',
    '7', '8', '9',
    '.', '0', 'delete',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 357,
      color: backgroundColor,
      child: GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 125 / 80,
        physics: const NeverScrollableScrollPhysics(),
        children: _keys.map((key) {
          return _KeypadButton(
            keyValue: key,
            foregroundColor: foregroundColor,
            onDigitPressed: onDigitPressed,
            onDeletePressed: onDeletePressed,
          );
        }).toList(),
      ),
    );
  }
}

class _KeypadButton extends StatelessWidget {
  final String keyValue;
  final Color foregroundColor;
  final void Function(String digit) onDigitPressed;
  final VoidCallback onDeletePressed;

  const _KeypadButton({
    required this.keyValue,
    required this.foregroundColor,
    required this.onDigitPressed,
    required this.onDeletePressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (keyValue == 'delete') {
          onDeletePressed();
        } else {
          onDigitPressed(keyValue);
        }
      },
      child: Center(
        child: keyValue == 'delete'
            ? SvgPicture.asset(
                AppIcons.deleteOutline,
                width: 28,
                height: 28,
                colorFilter: ColorFilter.mode(foregroundColor, BlendMode.srcIn),
              )
            : Text(
                keyValue,
                style: AppTextStyles.h3.copyWith(color: foregroundColor),
              ),
      ),
    );
  }
}