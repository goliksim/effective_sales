import 'package:effective_sales/app/theme/app_theme_colors.dart';
import 'package:flutter/material.dart';

class PreSearchTagsElement extends StatelessWidget {
  const PreSearchTagsElement({
    super.key,
    this.icon,
    required this.lable,
    required this.onPressed,
    this.onLongPress,
  });
  final Icon? icon;
  final Widget lable;
  final Function() onPressed;
  final Function()? onLongPress;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      onLongPress: () => onLongPress?.call(),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        backgroundColor: context.myColors.grey3,
      ),
      child: Row(
        children: [
          if (icon != null)
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: icon!,
            ),
          lable,
        ],
      ),
    );
  }
}
