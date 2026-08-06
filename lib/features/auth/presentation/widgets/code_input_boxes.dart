import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bazar_group_1/core/theme/app_colors.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';
import 'package:bazar_group_1/features/auth/presentation/providers/verification_code_notifier.dart';

class CodeInputBoxes extends ConsumerWidget {
  const CodeInputBoxes({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(
      verificationCodeNotifierProvider,
    );
    final code = state.code;
    final activeIndex = state.activeIndex;

    return GestureDetector(
      onTap: () {
        ref
            .read(verificationCodeNotifierProvider.notifier)
            .setFocused(true);
      },
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(6, (index) {
            final isActive =
                index == activeIndex && state.isFocused;
            final digit = index < code.length
                ? code[index]
                : '';

            return Padding(
              padding: EdgeInsets.only(
                right: index < 5 ? 8 : 0,
              ),
              child: Container(
                width: 44,
                height: 52,
                decoration: BoxDecoration(
                  color: AppColors.grey100,
                  borderRadius: BorderRadius.circular(8),
                  border: isActive
                      ? Border.all(
                          color: AppColors.primary500,
                          width: 1,
                        )
                      : null,
                ),
                child: Center(
                  child: digit.isNotEmpty
                      ? Text(
                          digit,
                          style: AppTextStyles.h3.copyWith(
                            color: AppColors.grey900,
                          ),
                        )
                      : (isActive
                            ? const _BlinkingCursor()
                            : null),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class _BlinkingCursor extends StatefulWidget {
  const _BlinkingCursor();

  @override
  State<_BlinkingCursor> createState() =>
      _BlinkingCursorState();
}

class _BlinkingCursorState extends State<_BlinkingCursor>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _controller,
      child: Container(
        width: 2,
        height: 28,
        color: AppColors.primary500,
      ),
    );
  }
}
