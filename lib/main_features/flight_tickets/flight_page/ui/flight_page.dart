import 'package:effective_sales/main_features/flight_tickets/common/ui/route_search_elements/route_search_inherited.dart';
import 'package:effective_sales/main_features/flight_tickets/common/ui/route_search_wrapper.dart';
import 'package:effective_sales/main_features/flight_tickets/flight_page/ui/flight_page_appbar.dart';
import 'package:effective_sales/main_features/flight_tickets/flight_page/ui/flight_page_body.dart';
import 'package:flutter/material.dart';

class FlightPage extends StatefulWidget {
  const FlightPage({super.key});

  @override
  State<FlightPage> createState() => _FlightPageState();
}

class _FlightPageState extends State<FlightPage> {
  @override
  Widget build(BuildContext context) {
    return const RouteSearchWrapper(
      child: Scaffold(
        extendBody: true,
        body: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            FlightPageAppBar(),
            FlightPageBody(),
          ],
        ),
      ),
    );
  }
}
