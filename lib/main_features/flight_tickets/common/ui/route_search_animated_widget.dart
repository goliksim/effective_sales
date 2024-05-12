import 'package:effective_sales/app/localization/localization_extension.dart';
import 'package:effective_sales/app/theme/app_theme_colors.dart';
import 'package:effective_sales/app/theme/effective_sales_icons.dart';
import 'package:effective_sales/common/ui/fade_animation.dart';
import 'package:effective_sales/main_features/flight_tickets/common/ui/route_search_elements/route_search_city_widget.dart';
import 'package:effective_sales/main_features/flight_tickets/common/ui/route_search_elements/route_search_left_icon.dart';
import 'package:flutter/material.dart';

class RouteSearchAnimatedWidget extends StatelessWidget {
  const RouteSearchAnimatedWidget({
    super.key,
    this.elevation = 0,
    this.height = 96,
    this.leftIcon,
    this.departureIcon,
    this.arrivalIcon,
    this.showSwapButton = false,
    this.showClearArrivalButton = false,
    this.leftIconAction,
    this.onTap,
    required this.animation,
  });
  final Animation<double> animation;
  final double elevation;
  final double height;
  final Icon? leftIcon;
  final Function()? leftIconAction;
  final Function()? onTap;
  final Icon? departureIcon;
  final Icon? arrivalIcon;
  final bool showSwapButton;
  final bool showClearArrivalButton;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      width: double.infinity,
      child: Card(
        margin: EdgeInsets.zero,
        elevation: 3,
        color: context.myColors.grey4,
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
              child: animation.value > 0.3
                  ? FadeAnimation(
                      animation: animation,
                      isExpandedWidget: true,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RouteSearchCityWidget(
                              actionBeforeComplete: onTap,
                              isDeparture: true,
                              leftIcon: departureIcon,
                              actionIcon: showSwapButton ? const Icon(EffectiveSalesIcons.swap) : null,
                              onActionIcon: () {},
                              hintText: context.S.f_page_search_departure_hint,
                            ),
                            Divider(
                              color: context.myColors.grey6,
                              height: 1,
                            ),
                            RouteSearchCityWidget(
                              actionBeforeComplete: onTap,
                              isDeparture: false,
                              leftIcon: arrivalIcon,
                              actionIcon: showClearArrivalButton ? const Icon(EffectiveSalesIcons.swap) : null,
                              onActionIcon: () {},
                              hintText: context.S.f_page_search_arrival_hint,
                            ),
                          ],
                        ),
                      ),
                    )
                  : FadeAnimation(
                      animation: animation,
                      isExpandedWidget: false,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                        child: RouteSearchCityWidget(
                          actionBeforeComplete: onTap,
                          isDeparture: false,
                          leftIcon: arrivalIcon,
                          actionIcon: showClearArrivalButton ? const Icon(EffectiveSalesIcons.swap) : null,
                          onActionIcon: () {},
                          hintText: context.S.f_page_search_arrival_hint,
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
