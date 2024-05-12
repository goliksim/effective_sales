import 'package:effective_sales/app/localization/localization_extension.dart';
import 'package:effective_sales/app/logger.dart';
import 'package:effective_sales/app/theme/app_theme_colors.dart';
import 'package:effective_sales/app/theme/app_theme_data.dart';
import 'package:effective_sales/app/theme/effective_sales_icons.dart';
import 'package:effective_sales/common/ui/fade_animation.dart';
import 'package:effective_sales/main_features/flight_tickets/common/bloc/route_search_bloc.dart';
import 'package:effective_sales/main_features/flight_tickets/common/ui/route_search_animated_widget.dart';
import 'package:effective_sales/main_features/flight_tickets/common/ui/route_search_wrapper.dart';
import 'package:effective_sales/main_features/flight_tickets/pre_search/ui/pre_search_modal.dart';
import 'package:flutter/material.dart';

class FlightPageAppBar extends StatefulWidget {
  const FlightPageAppBar({super.key});
  final double _expandedHeight = 238.0;
  final double _toolbarHeight = 100;

  double calculateExpandRatio(BoxConstraints constraints) {
    double expandRation = (constraints.maxHeight - _toolbarHeight) / (_expandedHeight - _toolbarHeight);
    if (expandRation > 1) expandRation = 1.0;
    if (expandRation < 0) expandRation = 0.0;
    return expandRation;
  }

  @override
  State<FlightPageAppBar> createState() => _FlightPageAppBarState();
}

class _FlightPageAppBarState extends State<FlightPageAppBar> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      pinned: true,
      snap: false,
      floating: true,
      expandedHeight: 238,
      collapsedHeight: 82,
      backgroundColor: context.myColors.black,
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          final expandRation = widget.calculateExpandRatio(constraints);
          final animation = AlwaysStoppedAnimation(expandRation);
          return Stack(
            alignment: Alignment.center,
            children: [
              // Page title
              Positioned(
                bottom: 122,
                child: FadeAnimation(
                  animation: animation,
                  isExpandedWidget: true,
                  child: SizedBox(
                    width: 172,
                    height: 116,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 28, 0, 36),
                      child: Center(
                        child: Text(
                          context.S.f_page_title,
                          textAlign: TextAlign.center,
                          style: context.myStyles.title1,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              Align(
                alignment: Alignment.bottomCenter,
                child: Card(
                  elevation: 0,
                  margin: EdgeInsets.symmetric(horizontal: animation.value * 16),
                  color: context.myColors.grey3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(animation.value * 16),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(16, 40 - animation.value * 16, 16, 16),
                    child: RouteSearchWrapper(
                      builder: (context, state) => RouteSearchAnimatedWidget(
                        leftIcon: const Icon(
                          EffectiveSalesIcons.search,
                        ),
                        elevation: 3,
                        height: 90,
                        onTap: () {
                          logger.log('RouteSearchAnimatedWidget onTap');
                          showPreSearchModalWindow(context);
                          //getIt<FlightDepartureRepository>().writeLastDeparture(
                          //  RouteSearchInherited.of(context).departureController.text,
                          // );
                        },
                        animation: animation,
                      ),
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
