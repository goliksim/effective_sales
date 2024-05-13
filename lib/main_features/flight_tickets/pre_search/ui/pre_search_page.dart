import 'package:effective_sales/main_features/flight_tickets/common/ui/route_search_wrapper.dart';
import 'package:effective_sales/main_features/flight_tickets/end_search/bloc/flight_search_bloc.dart';
import 'package:effective_sales/main_features/flight_tickets/pre_search/ui/pre_search_appbar.dart';
import 'package:effective_sales/main_features/flight_tickets/pre_search/ui/pre_search_body.dart';
import 'package:effective_sales/main_features/flight_tickets/pre_search/ui/pre_search_body_shimmer.dart';
import 'package:effective_sales/main_features/flight_tickets/pre_search/ui/pre_search_elements/pre_search_offers/pre_search_offers_error.dart';
import 'package:effective_sales/main_features/flight_tickets/pre_search/ui/pre_search_wrapper.dart';
import 'package:flutter/material.dart';

class FlightPreSearchPage extends StatelessWidget {
  const FlightPreSearchPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(16, 47, 16, 0),
          child: RouteSearchWrapper(
            builder: (context, state) {
              context.flightSearchBloc?.loadRoute(state.flightRoute);
              return Column(
                children: [
                  // ignore: prefer_const_constructors
                  FlightPreSearchAppBar(),
                  FlightSearchWrapper(
                    builder: (context, state) {
                      return state.maybeWhen(
                        orElse: () => const FlightPreSearchBodyShimmer(),
                        preSearch: (_, offers) => SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: FlightPreSearchBody(
                            offers: offers,
                          ),
                        ),
                        ticketsLoaded: (_, __) {
                          return const FlightPreSearchBodyShimmer();
                        },
                        error: (_) => const Expanded(
                          child: Center(
                            child: FlightPreSearchError(),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
