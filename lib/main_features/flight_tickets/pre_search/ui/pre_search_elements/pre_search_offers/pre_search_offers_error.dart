import 'package:effective_sales/common/ui/error_widget.dart';
import 'package:effective_sales/main_features/flight_tickets/end_search/bloc/flight_search_bloc.dart';
import 'package:flutter/material.dart';

class FlightPreSearchError extends StatelessWidget {
  const FlightPreSearchError({super.key});

  @override
  Widget build(BuildContext context) {
    return MyErrorWidget(
      onRetry: () {
        context.flightSearchBloc?.preSearch();
      },
    );
  }
}
