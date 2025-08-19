import 'package:fixly/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class OnSurface extends StatelessWidget {
  final double? height;
  final double? width;
  final Widget child;
  final EdgeInsets padding;
  const OnSurface({
    super.key,
    this.height,
    this.width,
    required this.child,
    required this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: context.colors.lighterRed,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: context.colors.lightRed),
      ),
      child: child,
    );
  }
}
