import 'package:fixly/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SurfaceDark extends StatelessWidget {
  final Widget child;
  final double? height;
  final double? width;
  final double allRadius;
  final Color? surfaceColor;

  final bool borderRadiusAll;
  final double? topLeftRadius;
  final double? topRightRadius;
  final double? bottomLeftRadius;
  final double? bottomRightRadius;
  final double? topRadius;
  final double? bottomRadius;

  final double? borderWidth;
  final Color? borderColor;
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

    this.borderColor,
    this.borderColorAll = false,
    this.borderColorTop = false,
    this.borderColorBottom = false,
    this.borderColorLeft = false,
    this.borderColorRight = false,
    this.padding,
    this.margin,
    this.alignment,
    this.boxShadow,
    this.borderWidth,
    this.surfaceColor,
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
        color: surfaceColor ?? context.colors.surface,
        borderRadius: borderRadiusAll
            ? BorderRadius.circular(allRadius)
            : BorderRadius.only(
                topLeft: Radius.circular(topLeftRadius?.r ?? topRadius?.r ?? 0),
                topRight: Radius.circular(
                  topRightRadius?.r ?? topRadius?.r ?? 0,
                ),
                bottomLeft: Radius.circular(
                  bottomLeftRadius?.r ?? bottomRadius?.r ?? 0,
                ),
                bottomRight: Radius.circular(
                  bottomRightRadius?.r ?? bottomRadius?.r ?? 0,
                ),
              ),
        border: borderColorAll
            ? Border.all(
                width: borderWidth?.w ?? 1.0.w,
                color: borderColor ?? context.colors.border,
              )
            : Border(
                top: borderColorTop
                    ? BorderSide(
                        color: borderColor ?? context.colors.border,
                        width: borderWidth?.w ?? 1.0.w,
                      )
                    : BorderSide.none,
                bottom: borderColorBottom
                    ? BorderSide(
                        color: borderColor ?? context.colors.border,
                        width: borderWidth?.w ?? 1.0.w,
                      )
                    : BorderSide.none,
                left: borderColorLeft
                    ? BorderSide(
                        color: borderColor ?? context.colors.border,
                        width: borderWidth?.w ?? 1.0.w,
                      )
                    : BorderSide.none,
                right: borderColorRight
                    ? BorderSide(
                        color: borderColor ?? context.colors.border,
                        width: borderWidth?.w ?? 1.0.w,
                      )
                    : BorderSide.none,
              ),

        boxShadow: boxShadow,
      ),
      child: child,
    );
  }
}
