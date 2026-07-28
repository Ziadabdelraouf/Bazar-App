import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bazar_group_1/core/theme/app_colors.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';
import 'package:bazar_group_1/core/theme/app_icons.dart';
import 'package:bazar_group_1/core/localization/generated/l10n.dart';
import 'package:bazar_group_1/features/auth/presentation/providers/phone_number_notifier.dart';
import 'package:bazar_group_1/features/auth/presentation/widgets/country_picker_sheet.dart';

class PhoneNumberDisplay extends ConsumerWidget {
  const PhoneNumberDisplay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s = S.of(context);
    final state = ref.watch(phoneNumberNotifierProvider);
    final hasDigits = state.digits.isNotEmpty;
    final textColor = hasDigits
        ? AppColors.grey900
        : AppColors.grey400;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          s.phoneNumberFieldLabel,
          style: AppTextStyles.body14Medium.copyWith(
            color: AppColors.grey900,
          ),
        ),
        const SizedBox(height: 6),
        GestureDetector(
          onTap: () {
            ref
                .read(phoneNumberNotifierProvider.notifier)
                .setFocused(true);
          },
          child: Container(
            width: double.infinity,
            height: 48,
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
            ),
            decoration: BoxDecoration(
              color: AppColors.grey50,
              borderRadius: BorderRadius.circular(8),
              border: state.isFocused
                  ? Border.all(
                      color: AppColors.primary500,
                      width: 1,
                    )
                  : null,
            ),
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(2.5),
                    child: SvgPicture.asset(
                      AppIcons.phoneOutline,
                      width: 19,
                      height: 19,
                      colorFilter: ColorFilter.mode(
                        textColor,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text:
                              '(${state.selectedCountry.dialCode})',
                          style: AppTextStyles.body16Medium
                              .copyWith(color: textColor),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {
                              ref
                                  .read(
                                    phoneNumberNotifierProvider
                                        .notifier,
                                  )
                                  .setFocused(true);
                              final selected =
                                  await showCountryPicker(
                                    context,
                                  );
                              if (selected != null) {
                                ref
                                    .read(
                                      phoneNumberNotifierProvider
                                          .notifier,
                                    )
                                    .selectCountry(
                                      selected,
                                    );
                              }
                            },
                        ),
                        if (hasDigits)
                          TextSpan(
                            text: ' ${state.digits}',
                            style: AppTextStyles
                                .body16Regular
                                .copyWith(color: textColor),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
