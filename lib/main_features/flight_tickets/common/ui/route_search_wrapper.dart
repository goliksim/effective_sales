import 'package:effective_sales/main_features/flight_tickets/common/bloc/route_search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RouteSearchWrapper extends StatelessWidget {
  const RouteSearchWrapper({
    super.key,
    required this.builder,
  });
  final Function(BuildContext, RouteSearchState) builder;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RouteSearchBloc, RouteSearchState>(
      buildWhen: (previous, current) {
        final condition = (previous.flightRoute.arrival != current.flightRoute.arrival ||
            previous.flightRoute.departure != current.flightRoute.departure);
        print(condition);
        return condition;
      },
      builder: (context, state) => builder(context, state),
    );
  }
}
