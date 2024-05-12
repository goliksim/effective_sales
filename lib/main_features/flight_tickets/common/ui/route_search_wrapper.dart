import 'package:effective_sales/main_features/flight_tickets/common/ui/route_search_elements/route_search_inherited.dart';
import 'package:flutter/material.dart';

class RouteSearchWrapper extends StatefulWidget {
  const RouteSearchWrapper({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  State<RouteSearchWrapper> createState() => _RouteSearchWrapperState();
}

class _RouteSearchWrapperState extends State<RouteSearchWrapper> {
  @override
  Widget build(BuildContext context) {
    return RouteSearchInherited(
      child: Builder(
        builder: (context) {
          return widget.child;
        },
      ),
    )..firstSetDeparture();
  }
}
