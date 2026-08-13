import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bazar_group_1/core/theme/app_icons.dart';
import 'package:bazar_group_1/features/search/presentation/providers/search_providers.dart';

class InlineSearchField extends ConsumerStatefulWidget {
  final String hintText;
  final ValueChanged<String> onChanged;

  const InlineSearchField({
    super.key,
    required this.hintText,
    required this.onChanged,
  });

  @override
  ConsumerState<InlineSearchField> createState() => _InlineSearchFieldState();
}

class _InlineSearchFieldState extends ConsumerState<InlineSearchField> {
  final FocusNode _focusNode = FocusNode();
  String _currentText = '';

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_handleFocusChange);
  }

  void _handleFocusChange() {
    if (!_focusNode.hasFocus && _currentText.trim().isNotEmpty) {
      ref.read(searchRepositoryProvider).addRecentSearch(_currentText.trim());
      ref.invalidate(recentSearchesProvider);
    }
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return TextField(
      focusNode: _focusNode,
      autofocus: true,
      onChanged: (value) {
        _currentText = value;
        widget.onChanged(value);
      },
      onSubmitted: (value) {
        if (value.trim().isNotEmpty) {
          ref.read(searchRepositoryProvider).addRecentSearch(value.trim());
          ref.invalidate(recentSearchesProvider);
        }
      },
      style: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
        fontSize: 16,
        height: 1.5,
        color: colorScheme.onSurface,
      ),
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
          fontSize: 16,
          height: 1.5,
          color: colorScheme.onSurfaceVariant,
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(12),
          child: SvgPicture.asset(
            AppIcons.search,
            colorFilter: ColorFilter.mode(
              colorScheme.onSurfaceVariant,
              BlendMode.srcIn,
            ),
          ),
        ),
        filled: true,
        fillColor: colorScheme.surfaceContainerHighest,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colorScheme.outlineVariant),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colorScheme.primary),
        ),
      ),
    );
  }
}