import 'package:effective_sales/app/theme/app_theme_colors.dart';
import 'package:flutter/material.dart';

import 'modal_inner_builder.dart';

class FixedModal extends StatelessWidget {
  final Widget child;
  final double size;
  final Color? background;
  final bool hasFrame;
  final bool hasShadow;
  final bool hasTouchLine;

  const FixedModal({
    super.key,
    required this.child,
    required this.size,
    this.background,
    this.hasFrame = false,
    this.hasShadow = false,
    this.hasTouchLine = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size * MediaQuery.of(context).size.height,
      child: modalInnerBuilder(
        backgroundColor: background ?? context.myColors.grey2,
        hasTouchLine: hasTouchLine,
        child: child,
      ),
    );
  }
}
