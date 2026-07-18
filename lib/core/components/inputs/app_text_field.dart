import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bazar_group_1/core/theme/app_colors.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';

/// Reusable styled text field for the app's design system.
///
/// Usage:
/// ```dart
/// AppTextField(label: 'Email', placeholder: 'Your email', controller: _controller)
/// ```
///
/// Password field: set `obscureText: true` — adds a show/hide icon automatically.
/// Field with leading icon (e.g. Phone Number): pass `prefixIcon`.
/// Set `keyboardType`/`textInputAction` to control the on-screen keyboard.
class AppTextField extends StatefulWidget {
  final String label;
  final String placeholder;
  final TextEditingController controller;
  final bool obscureText;
  final String? prefixIcon;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;

  const AppTextField({
    super.key,
    required this.label,
    required this.placeholder,
    required this.controller,
    this.obscureText = false,
    this.prefixIcon,
    this.keyboardType,
    this.textInputAction,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late bool _obscureText;
  late FocusNode _focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
    widget.controller.addListener(_onTextChanged);

    _focusNode = FocusNode();
    _focusNode.addListener(_onFocusChanged);
  }

  void _onTextChanged() => setState(() {});

  void _onFocusChanged() {
    setState(() => _isFocused = _focusNode.hasFocus);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onTextChanged);
    _focusNode.removeListener(_onFocusChanged);
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hasText = widget.controller.text.isNotEmpty;
    final hasPrefixIcon = widget.prefixIcon != null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label
        Text(
          widget.label,
          style: AppTextStyles.body14Medium.copyWith(color: AppColors.grey900),
        ),

        const SizedBox(height: 6),

        // Manually built input box
        Container(
          height: 48,
          decoration: BoxDecoration(
            color: AppColors.grey50,
            borderRadius: BorderRadius.circular(8),
            border: _isFocused
                ? Border.all(color: AppColors.primary500, width: 1)
                : null,
          ),
          child: Row(
            children: [
              SizedBox(width: hasPrefixIcon ? 12 : 16),

              if (hasPrefixIcon) ...[
                Padding(
                  padding: const EdgeInsets.all(2.5),
                  child: SvgPicture.asset(
                    widget.prefixIcon!,
                    width: 19,
                    height: 19,
                    colorFilter: ColorFilter.mode(
                      hasText ? AppColors.primary500 : AppColors.grey400,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
              ],

              // The actual editable text
              Expanded(
                child: TextField(
                  controller: widget.controller,
                  focusNode: _focusNode,
                  obscureText: widget.obscureText ? _obscureText : false,
                  keyboardType: widget.keyboardType,
                  textInputAction: widget.textInputAction,
                  style: AppTextStyles.body16Medium.copyWith(
                    color: AppColors.grey900,
                  ),
                  decoration: InputDecoration(
                    hintText: _isFocused ? null : widget.placeholder,
                    hintStyle: AppTextStyles.body16Regular.copyWith(
                      color: AppColors.grey400,
                    ),
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),

              if (widget.obscureText)
                _PasswordToggleIcon(
                  obscureText: _obscureText,
                  onPressed: () => setState(() => _obscureText = !_obscureText),
                ),

              const SizedBox(width: 16),
            ],
          ),
        ),
      ],
    );
  }
}

/// The tappable show/hide icon used in Password fields.
class _PasswordToggleIcon extends StatelessWidget {
  final bool obscureText;
  final VoidCallback onPressed;

  const _PasswordToggleIcon({
    required this.obscureText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: SvgPicture.asset(
        obscureText
            ? 'assets/icons/password_outline.svg'
            : 'assets/icons/eye_open.svg',
        colorFilter: const ColorFilter.mode(AppColors.grey400, BlendMode.srcIn),
      ),
      onPressed: onPressed,
    );
  }
}
