import 'package:fixly/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class OnlineGreenDot extends StatefulWidget {
  const OnlineGreenDot({super.key});

  @override
  State<OnlineGreenDot> createState() => _OnlineGreenDotState();
}

class _OnlineGreenDotState extends State<OnlineGreenDot>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true); // loop back and forth

    _colorAnimation = ColorTween(
      begin: AppColors.darkColors.success,
      end: AppColors.darkColors.success.withAlpha(128), // 50% alpha
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _colorAnimation,
      builder: (context, child) {
        return Container(
          width: 13,
          height: 13,
          decoration: BoxDecoration(
            color: _colorAnimation.value,
            shape: BoxShape.circle,
          ),
        );
      },
    );
  }
}
