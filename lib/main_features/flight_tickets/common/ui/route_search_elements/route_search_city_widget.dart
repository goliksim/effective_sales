import 'package:effective_sales/main_features/flight_tickets/common/bloc/route_search_bloc.dart';
import 'package:effective_sales/main_features/flight_tickets/common/ui/route_search_elements/route_search_text_field.dart';
import 'package:flutter/material.dart';

class RouteSearchCityWidget extends StatelessWidget {
  const RouteSearchCityWidget({
    super.key,
    this.leftIcon,
    this.actionIcon,
    this.onActionIcon,
    this.onEditingComplete,
    required this.hintText,
    this.actionBeforeComplete,
    required this.isDeparture,
  });
  //TODO Придумать получше наследование
  final Function()? actionBeforeComplete;
  final String hintText;
  final Icon? leftIcon;
  final Icon? actionIcon;
  final Function()? onActionIcon;
  final Function(String)? onEditingComplete;
  final bool isDeparture;

  @override
  Widget build(BuildContext context) {
    final initialValue = isDeparture
        ? context.routeSearchState?.flightRoute.departure?.localTown
        : context.routeSearchState?.flightRoute.arrival?.localTown;
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
            child: (actionBeforeComplete != null)
                ? GestureDetector(
                    onTap: () => actionBeforeComplete?.call(),
                    child: RouteSearchTextField(
                      enabled: false,
                      cyrrilicInput: true,
                      initialValue: initialValue,
                      onEditingComplete: onEditingComplete,
                      hintText: hintText,
                    ),
                  )
                : RouteSearchTextField(
                    cyrrilicInput: true,
                    initialValue: initialValue,
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
