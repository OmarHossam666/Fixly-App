import 'package:fixly/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class SurfaceDark extends StatelessWidget {
  final Widget child;
  final double? height;
  final double? width;
  final double allRadius;

  final bool borderRadiusAll;
  final double? topLeftRadius;
  final double? topRightRadius;
  final double? bottomLeftRadius;
  final double? bottomRightRadius;
  final double? topRadius;
  final double? bottomRadius;

  final bool borderColorAll;
  final bool borderColorTop;
  final bool borderColorBottom;
  final bool borderColorLeft;
  final bool borderColorRight;

  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Alignment? alignment;
  final List<BoxShadow>? boxShadow;

  const SurfaceDark({
    super.key,
    required this.child,
    this.height,
    this.width,
    this.allRadius = 0,

    this.borderRadiusAll = false,
    this.topLeftRadius,
    this.topRightRadius,
    this.bottomLeftRadius,
    this.bottomRightRadius,
    this.topRadius,
    this.bottomRadius,

    this.borderColorAll = false,
    this.borderColorTop = false,
    this.borderColorBottom = false,
    this.borderColorLeft = false,
    this.borderColorRight = false,
    this.padding,
    this.margin,
    this.alignment, this.boxShadow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      height: height,
      width: width,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: AppColors.darkColors.surface,
        borderRadius: borderRadiusAll
            ? BorderRadius.circular(allRadius)
            : BorderRadius.only(
                topLeft: Radius.circular(topLeftRadius ?? topRadius ?? 0),
                topRight: Radius.circular(topRightRadius ?? topRadius ?? 0),
                bottomLeft: Radius.circular(
                  bottomLeftRadius ?? bottomRadius ?? 0,
                ),
                bottomRight: Radius.circular(
                  bottomRightRadius ?? bottomRadius ?? 0,
                ),
              ),
        border: borderColorAll
            ? Border.all(color: AppColors.darkColors.border)
            : Border(
                top: borderColorTop
                    ? BorderSide(color: AppColors.darkColors.border)
                    : BorderSide.none,
                bottom: borderColorBottom
                    ? BorderSide(color: AppColors.darkColors.border)
                    : BorderSide.none,
                left: borderColorLeft
                    ? BorderSide(color: AppColors.darkColors.border)
                    : BorderSide.none,
                right: borderColorRight
                    ? BorderSide(color: AppColors.darkColors.border)
                    : BorderSide.none,
              ),
              boxShadow: boxShadow,
      ),
      child: child,
    );
  }
}
