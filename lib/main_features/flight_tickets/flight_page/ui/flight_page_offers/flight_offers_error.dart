import 'package:effective_sales/common/ui/error_widget.dart';
import 'package:effective_sales/main_features/flight_tickets/flight_page/bloc/flight_page_bloc.dart';
import 'package:flutter/material.dart';

class FlightOffersError extends StatelessWidget {
  const FlightOffersError({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: MyErrorWidget(
        onRetry: () {
          context.flightPageBloc?.load();
        },
      ),
    );
  }
}
