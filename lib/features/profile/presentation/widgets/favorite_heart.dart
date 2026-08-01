import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bazar_group_1/core/theme/app_colors.dart';
import 'package:bazar_group_1/core/theme/app_icons.dart';

class FavoriteHeart extends StatefulWidget {
  const FavoriteHeart({
    super.key,
    required this.onTap,
    this.isFavorited = true,
  });

  final VoidCallback onTap;
  final bool isFavorited;

  @override
  State<FavoriteHeart> createState() => _FavoriteHeartState();
}

class _FavoriteHeartState extends State<FavoriteHeart>
    with SingleTickerProviderStateMixin {
  late final _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 300),
  );

  late final _scale = Tween<double>(begin: 1.0, end: 1.3).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    ),
  );

  void _handleTap() {
    _controller.forward(from: 0);
    widget.onTap();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: SizedBox(
        width: 24,
        height: 24,
        child: Center(
          child: ScaleTransition(
            scale: _scale,
            child: SvgPicture.asset(
              AppIcons.loveFill,
              width: 20,
              height: 19,
              colorFilter: ColorFilter.mode(
                widget.isFavorited ? AppColors.primary500 : AppColors.grey400,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ),
    );
  }
}