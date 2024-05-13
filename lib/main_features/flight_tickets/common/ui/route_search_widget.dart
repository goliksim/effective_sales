import 'package:effective_sales/app/localization/localization_extension.dart';
import 'package:effective_sales/app/theme/app_theme_colors.dart';
import 'package:effective_sales/app/theme/effective_sales_icons.dart';
import 'package:effective_sales/main_features/flight_tickets/common/bloc/route_search_bloc.dart';
import 'package:effective_sales/main_features/flight_tickets/common/ui/route_search_elements/route_search_city_widget.dart';
import 'package:effective_sales/main_features/flight_tickets/common/ui/route_search_elements/route_search_left_icon.dart';
import 'package:flutter/material.dart';

class RouteSearchWidget extends StatelessWidget {
  const RouteSearchWidget({
    super.key,
    this.elevation = 0,
    this.height = 96,
    this.leftIcon,
    this.departureIcon,
    this.arrivalIcon,
    this.showSwapButton = false,
    this.showClearArrivalButton = false,
    this.leftIconAction,
    this.departureAction,
    this.arrivalAction,
    this.color,
  });
  final Color? color;
  final double elevation;
  final double height;
  final Icon? leftIcon;
  final Function()? leftIconAction;
  final Function(String)? departureAction;
  final Function(String)? arrivalAction;
  final Icon? departureIcon;
  final Icon? arrivalIcon;
  final bool showSwapButton;
  final bool showClearArrivalButton;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: Card(
        margin: EdgeInsets.zero,
        elevation: elevation,
        color: color ?? context.myColors.grey4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            if (leftIcon != null)
              RouteSearchLeftIcon(
                leftIcon: leftIcon!,
                leftIconAction: leftIconAction,
              ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RouteSearchCityWidget(
                      isDeparture: true,
                      leftIcon: departureIcon,
                      actionIcon: showSwapButton ? const Icon(EffectiveSalesIcons.swap) : null,
                      onActionIcon: () {
                        context.routeSearchBloc?.swap();
                      },
                      hintText: context.S.f_page_search_departure_hint,
                      onEditingComplete: departureAction,
                    ),
                    Divider(
                      color: context.myColors.grey6,
                      height: 1,
                    ),
                    RouteSearchCityWidget(
                      isDeparture: false,
                      leftIcon: arrivalIcon,
                      actionIcon: showClearArrivalButton ? const Icon(EffectiveSalesIcons.close) : null,
                      onActionIcon: () {
                        context.routeSearchBloc?.clearArrival();
                      },
                      hintText: context.S.f_page_search_arrival_hint,
                      onEditingComplete: arrivalAction,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
