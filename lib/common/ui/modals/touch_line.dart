import 'package:effective_sales/app/theme/app_theme_colors.dart';
import 'package:flutter/material.dart';

class TouchLine extends StatelessWidget {
  const TouchLine({super.key, this.width});

  final double? width;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        SizedBox(
          height: 5,
          width: width ?? 38,
          child: Card(
            color: context.myColors.grey5,
            margin: EdgeInsets.zero,
            elevation: 0,
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
