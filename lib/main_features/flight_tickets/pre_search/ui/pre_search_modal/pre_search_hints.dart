import 'package:effective_sales/app/localization/localization_extension.dart';
import 'package:effective_sales/app/router_config.dart';
import 'package:effective_sales/app/theme/app_theme_colors.dart';
import 'package:effective_sales/app/theme/app_theme_data.dart';
import 'package:effective_sales/app/theme/effective_sales_icons.dart';
import 'package:effective_sales/main_features/flight_tickets/common/bloc/route_search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PreSearchHints extends StatelessWidget {
  const PreSearchHints({
    super.key,
  });

  void _hardWayAction(BuildContext context) {
    context.push(RouteName.flightSearchHard);
  }

  void _randomWayAction(BuildContext context) {
    context.routeSearchBloc?.pickRandomArrival(context);
  }

  void _weekendAction(BuildContext context) {
    context.push(RouteName.flightSearchWeekend);
  }

  void _hotTicketsAction(BuildContext context) {
    context.push(RouteName.flightSearchHotDeal);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        PreSearchHintsElement(
          key: const ValueKey(1),
          width: 70,
          color: context.myColors.green,
          icon: const Icon(EffectiveSalesIcons.hardWay),
          lable: context.S.f_pre_search_hints_hard_way,
          onTap: () => _hardWayAction(context),
        ),
        PreSearchHintsElement(
          key: const ValueKey(2),
          width: 79,
          color: context.myColors.blue,
          icon: const Icon(EffectiveSalesIcons.earth),
          lable: context.S.f_pre_search_hints_random,
          onTap: () => _randomWayAction(context),
        ),
        PreSearchHintsElement(
          key: const ValueKey(3),
          width: 64,
          color: context.myColors.darkBlue,
          icon: const Icon(EffectiveSalesIcons.calendar),
          lable: context.S.f_pre_search_hints_weekend,
          onTap: () => _weekendAction(context),
        ),
        PreSearchHintsElement(
          key: const ValueKey(4),
          width: 65,
          color: context.myColors.red,
          icon: const Icon(EffectiveSalesIcons.flame),
          lable: context.S.f_pre_search_hints_hot_tickets,
          onTap: () => _hotTicketsAction(context),
        ),
      ],
    );
  }
}

class PreSearchHintsElement extends StatelessWidget {
  const PreSearchHintsElement({
    super.key,
    this.color,
    this.icon,
    this.lable,
    this.onTap,
    this.width,
  });
  final Color? color;
  final Icon? icon;
  final String? lable;
  final Function()? onTap;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      width: width,
      child: Column(
        children: [
          SizedBox(
            height: 48,
            width: 48,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                backgroundColor: color ?? context.myColors.grey3,
                elevation: 0,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
              ),
              onPressed: () => onTap?.call(),
              child: icon,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            lable ?? '',
            textAlign: TextAlign.center,
            style: context.myStyles.text2,
          ),
        ],
      ),
    );
  }
}
