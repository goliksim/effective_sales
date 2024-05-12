import 'package:effective_sales/app/injectable_init.dart';
import 'package:effective_sales/app/logger.dart';
import 'package:effective_sales/main_features/flight_tickets/flight_page/domain/repositories/flight_departure_repository.dart';
import 'package:flutter/material.dart';

class RouteSearchInherited extends InheritedWidget {
  final TextEditingController departureController = TextEditingController();
  final TextEditingController arrivalController = TextEditingController();

  RouteSearchInherited({
    super.key,
    required super.child,
  });

  void check() {
    logger.warning('ckeck');
  }

  void firstSetDeparture() {
    getIt<FlightDepartureRepository>().getLastDeparture().then((value) {
      if (departureController.text == '' && value != null && value != '') {
        departureController.text = value;

        logger.fine('firstSetDeparture ${departureController.text}');
      }
    });
  }

  static RouteSearchInherited of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<RouteSearchInherited>()!;
  }

  @override
  bool updateShouldNotify(covariant RouteSearchInherited oldWidget) {
    // You can implement custom logic here to determine when to notify listeners
    return (oldWidget.departureController != departureController) || (oldWidget.arrivalController != arrivalController);
  }
}
