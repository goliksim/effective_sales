import 'package:effective_sales/common/ui/modals/touch_line.dart';
import 'package:flutter/material.dart';

Widget modalInnerBuilder({
  required Color backgroundColor,
  required bool hasTouchLine,
  required Widget child,
}) {
  Widget widget = ClipRRect(
    borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
    child: ColoredBox(
      color: backgroundColor,
      child: child,
    ),
  );

  if (hasTouchLine) {
    widget = ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      child: ColoredBox(
        color: backgroundColor,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 24),
              child: TouchLine(),
            ),
            Expanded(child: child),
          ],
        ),
      ),
    );
  }

  return widget;
}
