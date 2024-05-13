import 'package:effective_sales/main_features/flight_tickets/common/bloc/route_search_bloc.dart';
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
    print('routeSearchBlock');
    context.routeSearchBloc?.load();
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          FlightPageAppBar(),
          FlightPageBody(),
        ],
      ),
    );
  }
}
