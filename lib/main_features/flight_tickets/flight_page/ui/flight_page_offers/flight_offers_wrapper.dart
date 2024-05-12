import 'package:effective_sales/app/logger.dart';
import 'package:effective_sales/main_features/flight_tickets/flight_page/bloc/flight_page_bloc.dart';
import 'package:effective_sales/main_features/flight_tickets/flight_page/ui/flight_page_offers/flight_offers_error.dart';
import 'package:effective_sales/main_features/flight_tickets/flight_page/ui/flight_page_offers/flight_offers_shimmer.dart';
import 'package:effective_sales/main_features/flight_tickets/flight_page/ui/flight_page_offers/flight_offers_widget/flight_offers_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FlightOffersWrapper extends StatelessWidget {
  const FlightOffersWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    logger.log('wrapper');
    return BlocBuilder<FlightPageBloc, FlightPageState>(
      builder: (context, state) {
        return state.map(
          init: (value) {
            context.flightPageBloc?.load();
            return const FlightOffersShimmer();
          },
          loaded: (value) => FlightOffersWidget(
            flightOffers: value.flightOffers,
          ),
          empty: (value) => const SizedBox(),
          error: (value) => const FlightOffersError(),
        );
      },
    );
  }
}
