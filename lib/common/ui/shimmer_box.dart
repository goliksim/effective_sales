import 'package:effective_sales/app/theme/app_theme_colors.dart';
import 'package:flutter/material.dart';

class ShimerBox extends StatelessWidget {
  const ShimerBox(
    this.height,
    this.width,
    this.margin, {
    this.color,
    super.key,
    this.child,
  });
  final EdgeInsets? margin;
  final double? height;
  final double? width;
  final Color? color;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Card(
        margin: margin,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        color: color ?? context.myColors.grey2,
        child: child,
      ),
    );
  }
}
