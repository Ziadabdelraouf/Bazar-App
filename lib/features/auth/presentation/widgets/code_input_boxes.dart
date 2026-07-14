import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bazar_group_1/core/theme/app_colors.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';
import 'package:bazar_group_1/features/auth/presentation/providers/verification_code_notifier.dart';

class CodeInputBoxes extends ConsumerStatefulWidget {
  const CodeInputBoxes({super.key});

  @override
  ConsumerState<CodeInputBoxes> createState() => _CodeInputBoxesState();
}

class _CodeInputBoxesState extends ConsumerState<CodeInputBoxes> {
  final List<TextEditingController> _controllers =
      List.generate(4, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    for (final node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _onChanged(int index, String value) {
    ref.read(verificationCodeNotifierProvider.notifier).updateDigit(index, value);

    if (value.isNotEmpty && index < 3) {
      FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(4, (index) {
        return Padding(
          padding: EdgeInsets.only(right: index < 3 ? 16 : 0),
          child: SizedBox(
            width: 52,
            height: 52,
            child: Focus(
              onKeyEvent: (node, event) {
                if (event is KeyDownEvent &&
                    event.logicalKey == LogicalKeyboardKey.backspace &&
                    _controllers[index].text.isEmpty &&
                    index > 0) {
                  FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
                  return KeyEventResult.handled;
                }
                return KeyEventResult.ignored;
              },
              child: TextField(
                controller: _controllers[index],
                focusNode: _focusNodes[index],
                onChanged: (value) => _onChanged(index, value),
                textAlign: TextAlign.center,
                textAlignVertical: TextAlignVertical.center,
                keyboardType: TextInputType.number,
                maxLength: 1,
                style: AppTextStyles.h3.copyWith(color: AppColors.grey900),
                decoration: InputDecoration(
                  counterText: '',
                  filled: true,
                  fillColor: AppColors.grey50,
                  contentPadding: EdgeInsets.zero,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: AppColors.primary500, width: 1),
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}