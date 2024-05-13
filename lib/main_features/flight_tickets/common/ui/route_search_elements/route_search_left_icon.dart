import 'package:flutter/material.dart';

class RouteSearchLeftIcon extends StatelessWidget {
  const RouteSearchLeftIcon({
    super.key,
    this.leftIconAction,
    required this.leftIcon,
  });
  final Function()? leftIconAction;
  final Icon leftIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: SizedBox(
        width: 24,
        height: 24,
        child: IconButton(
          splashRadius: 18,
          padding: EdgeInsets.zero,
          onPressed: () => leftIconAction?.call(),
          icon: leftIcon,
        ),
      ),
    );
  }
}
