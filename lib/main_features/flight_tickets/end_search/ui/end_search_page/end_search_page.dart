import 'package:effective_sales/common/ui/error_widget.dart';
import 'package:effective_sales/main_features/flight_tickets/end_search/bloc/flight_search_bloc.dart';
import 'package:effective_sales/main_features/flight_tickets/end_search/ui/end_search_page/end_search_appbar.dart';
import 'package:effective_sales/main_features/flight_tickets/end_search/ui/end_search_page/end_search_body_shimmer.dart';
import 'package:effective_sales/main_features/flight_tickets/pre_search/ui/pre_search_wrapper.dart';
import 'package:flutter/material.dart';

import 'end_search_body.dart';

class FlightEndSearchPage extends StatefulWidget {
  const FlightEndSearchPage({
    super.key,
  });

  @override
  State<FlightEndSearchPage> createState() => _FlightEndSearchPageState();
}

class _FlightEndSearchPageState extends State<FlightEndSearchPage> {
  @override
  Widget build(BuildContext context) {
    context.flightSearchBloc?.search();
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const FlightSearchAppBar(),
            FlightSearchWrapper(
              builder: (context, state) {
                return state.maybeWhen(
                  orElse: () => const Expanded(child: FlightSearchBodyShimmer()),
                  ticketsLoaded: (_, tickets) => Expanded(
                    child: FlightSearchBody(
                      tickets: tickets,
                    ),
                  ),
                  error: (_) => Expanded(
                    child: Center(
                      child: MyErrorWidget(
                        onRetry: () {
                          context.flightSearchBloc?.search();
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
