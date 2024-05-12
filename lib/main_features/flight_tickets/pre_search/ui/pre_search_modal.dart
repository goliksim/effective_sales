import 'package:effective_sales/app/theme/app_theme_colors.dart';
import 'package:effective_sales/app/theme/effective_sales_icons.dart';
import 'package:effective_sales/common/ui/modals/fixed_modal.dart';
import 'package:effective_sales/main_features/flight_tickets/common/bloc/route_search_bloc.dart';
import 'package:effective_sales/main_features/flight_tickets/common/ui/route_search_widget.dart';
import 'package:effective_sales/main_features/flight_tickets/common/ui/route_search_wrapper.dart';
import 'package:effective_sales/main_features/flight_tickets/pre_search/ui/pre_search_modal/pre_search_hints.dart';
import 'package:effective_sales/main_features/flight_tickets/pre_search/ui/pre_search_modal/pre_search_recommendation.dart';
import 'package:flutter/material.dart';

void showPreSearchModalWindow(BuildContext context) {
  showBottomSheet(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(16),
      ),
    ),
    //isScrollControlled: true,
    enableDrag: true,
    context: context,
    builder: (ctx) {
      return const PreSearchModalWindow();
    },
  );
}

class PreSearchModalWindow extends StatelessWidget {
  const PreSearchModalWindow({super.key});

  @override
  Widget build(BuildContext context) {
    print('PreSearchModalWindow' + (context.routeSearchState?.flightRoute ?? 'null').toString());
    return FixedModal(
      hasTouchLine: true,
      size: 0.85,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            RouteSearchWrapper(
              builder: (context, state) {
                print('builder');
                return RouteSearchWidget(
                  key: UniqueKey(),
                  elevation: 0,
                  color: context.myColors.grey3,
                  departureIcon: const Icon(EffectiveSalesIcons.plane2),
                  arrivalIcon: const Icon(EffectiveSalesIcons.search),
                  showClearArrivalButton: true,
                  departureAction: (value) {
                    context.routeSearchBloc?.confirmDepartureByString(value);
                  },
                  arrivalAction: (value) {
                    context.routeSearchBloc?.confirmArrivalByString(value);
                    //TODO CONTEXT ???
                  },
                );
              },
            ),
            const SizedBox(
              height: 24,
            ),
            const PreSearchHints(),
            const SizedBox(
              height: 30,
            ),
            const PreSearchRecommendation(),
          ],
        ),
      ), //MediaQuery.of(context).size.height * 0.9,
    );
  }
}
