import 'package:effective_sales/main_features/flight_tickets/end_search/bloc/flight_search_bloc.dart';
import 'package:effective_sales/main_features/flight_tickets/pre_search/ui/pre_search_elements/pre_search_offers/pre_search_offers.dart';
import 'package:effective_sales/main_features/flight_tickets/pre_search/ui/pre_search_elements/pre_search_show_all.dart';
import 'package:effective_sales/main_features/flight_tickets/pre_search/ui/pre_search_elements/pre_search_subscription.dart';
import 'package:flutter/material.dart';

class FlightPreSearchBody extends StatelessWidget {
  const FlightPreSearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          FlightPreSearchOffers(
            offers: context.flightSearchState?.maybeWhen(orElse: () => [], preSearch: (_, offers) => offers) ?? [],
          ),
          const SizedBox(
            height: 23,
          ),
          FlightPreSearchShowAll(
            onPressed: () {
              //TODO ACTION
            },
          ),
          const SizedBox(
            height: 24,
          ),
          const FlightPreSearchSubcription(),
        ],
      ),
    );
  }
}
