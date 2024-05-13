import 'package:effective_sales/main_features/flight_tickets/end_search/bloc/flight_search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FlightSearchWrapper extends StatelessWidget {
  const FlightSearchWrapper({
    super.key,
    required this.builder,
  });
  final Function(BuildContext, FlightSearchState) builder;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FlightSearchBloc, FlightSearchState>(
      builder: (context, state) => builder(context, state),
    );
  }
}
