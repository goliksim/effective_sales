import 'package:effective_sales/main_features/flight_tickets/common/ui/route_search_elements/route_search_text_field.dart';
import 'package:flutter/material.dart';

class RouteSearchCityWidget extends StatelessWidget {
  const RouteSearchCityWidget({
    super.key,
    this.leftIcon,
    this.actionIcon,
    this.onActionIcon,
    required this.textController,
    this.onEditingComplete,
    required this.hintText,
    this.actionBeforeComplete = false,
  });
  //TODO Придумать получше наследование
  final bool actionBeforeComplete;
  final String hintText;
  final Icon? leftIcon;
  final Icon? actionIcon;
  final Function()? onActionIcon;
  final Function()? onEditingComplete;
  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      child: Row(
        children: [
          if (leftIcon != null)
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: leftIcon!,
            ),
          Expanded(
            child: actionBeforeComplete
                ? GestureDetector(
                    onTap: () => onEditingComplete?.call(),
                    child: RouteSearchTextField(
                      enabled: false,
                      cyrrilicInput: true,
                      textController: textController,
                      onEditingComplete: onEditingComplete,
                      hintText: hintText,
                    ),
                  )
                : RouteSearchTextField(
                    cyrrilicInput: true,
                    textController: textController,
                    onEditingComplete: onEditingComplete,
                    hintText: hintText,
                  ),
          ),
          if (actionIcon != null)
            IconButton(
              splashRadius: 16,
              padding: EdgeInsets.zero,
              onPressed: onActionIcon,
              icon: actionIcon!,
            )
        ],
      ),
    );
  }
}
