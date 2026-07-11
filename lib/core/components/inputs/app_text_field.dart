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
/// Set `keyboardType`/`textInputAction` to control the on-screen keyboard
/// (e.g. `TextInputType.emailAddress`, `TextInputAction.next`).
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
  late bool _obscureText; // current show/hide state, toggled by the eye icon

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
    widget.controller.addListener(_onTextChanged); // rebuild on every keystroke
  }

  void _onTextChanged() => setState(() {});

  @override
  void dispose() {
    widget.controller.removeListener(_onTextChanged); // avoid memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hasText = widget.controller.text.isNotEmpty; // controls prefix icon color

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label
        Text(
          widget.label,
          style: AppTextStyles.body14Medium.copyWith(color: AppColors.grey900),
        ),

        const SizedBox(height: 6),

        // Input box
        TextField(
          controller: widget.controller,
          obscureText: widget.obscureText ? _obscureText : false,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          style: AppTextStyles.body16Medium.copyWith(color: AppColors.grey900),
          decoration: InputDecoration(
            hintText: widget.placeholder,
            hintStyle: AppTextStyles.body16Regular.copyWith(color: AppColors.grey400),
            filled: true,
            fillColor: AppColors.grey50,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),

            // Leading icon (only if provided)
            prefixIcon: widget.prefixIcon != null
                ? _FieldPrefixIcon(
                    assetPath: widget.prefixIcon!,
                    isActive: hasText,
                  )
                : null,

            // Show/hide password toggle (only if obscureText is true)
            suffixIcon: widget.obscureText
                ? _PasswordToggleIcon(
                    obscureText: _obscureText,
                    onPressed: () => setState(() => _obscureText = !_obscureText),
                  )
                : null,

            // Default border: no visible line
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),

            // Focused border: purple outline, applied automatically by Flutter
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColors.primary500, width: 1),
            ),
          ),
        ),
      ],
    );
  }
}

/// The leading icon shown inside fields like Phone Number.
/// Color switches automatically based on whether the field has content.
class _FieldPrefixIcon extends StatelessWidget {
  final String assetPath;
  final bool isActive;

  const _FieldPrefixIcon({
    required this.assetPath,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: SvgPicture.asset(
        assetPath,
        colorFilter: ColorFilter.mode(
          isActive ? AppColors.primary500 : AppColors.grey400,
          BlendMode.srcIn,
        ),
      ),
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