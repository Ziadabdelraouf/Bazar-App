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
  late final AnimationController _controller;
  late final Animation<double> _scale;

  void _handleTap() {
    _controller.forward(from: 0);
    widget.onTap();
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 450),
    );
    _scale = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween(begin: 1.0, end: 1.4).chain(CurveTween(curve: Curves.easeOut)),
        weight: 40,
      ),
      TweenSequenceItem(
        tween: Tween(begin: 1.3, end: 1.0).chain(CurveTween(curve: Curves.elasticOut)),
        weight: 60,
      ),
    ]).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: _handleTap,
      constraints: const BoxConstraints.tightFor(width: 48, height: 48),
      icon: ScaleTransition(
        scale: _scale,
        child: SvgPicture.asset(
          AppIcons.loveFill,
          width: 24,
          height: 24,
          colorFilter: ColorFilter.mode(
            widget.isFavorited ? AppColors.primary500 : AppColors.grey400,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}