import 'package:effective_sales/app/theme/app_theme_colors.dart';
import 'package:effective_sales/app/theme/effective_sales_icons.dart';
import 'package:effective_sales/main_features/flight_tickets/common/bloc/route_search_bloc.dart';
import 'package:effective_sales/main_features/flight_tickets/common/ui/route_search_widget.dart';
import 'package:effective_sales/main_features/flight_tickets/pre_search/ui/pre_search_elements/pre_search_tags.dart';
import 'package:effective_sales/main_features/flight_tickets/pre_search/ui/pre_search_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FlightPreSearchAppBar extends StatelessWidget {
  const FlightPreSearchAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RouteSearchWidget(
          color: context.myColors.grey3,
          leftIcon: const Icon(EffectiveSalesIcons.back),
          leftIconAction: () {
            context.pop();
          },
          showSwapButton: true,
          showClearArrivalButton: true,
          departureAction: (value) {
            context.routeSearchBloc?.confirmDepartureByString(value, null);
          },
          arrivalAction: (value) {
            context.routeSearchBloc?.confirmArrivalByString(value, null);
          },
          height: 96,
        ),
        const SizedBox(
          height: 13,
        ),
        SizedBox(
          height: 33,
          // ignore: prefer_const_constructors
          child: FlightSearchWrapper(builder: (context, state) => FlightPreSearchTags()),
        ),
        const SizedBox(
          height: 13,
        ),
      ],
    );
  }
}
