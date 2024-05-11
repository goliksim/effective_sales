import 'package:effective_sales/common/ui/modals/touch_line.dart';
import 'package:flutter/material.dart';

Widget modalInnerBuilder({
  required Color backgroundColor,
  required bool hasShadow,
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

  if (hasShadow) {
    widget = DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            blurRadius: 3.0,
            spreadRadius: 7.0,
            offset: const Offset(0.0, 5.0),
            color: Colors.black.withOpacity(0.1),
          )
        ],
      ),
      child: widget,
    );
  }

  return widget;
}
