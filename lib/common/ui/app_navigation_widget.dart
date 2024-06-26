import 'package:effective_sales/app/injectable_init.dart';
import 'package:effective_sales/app/router_config.dart';
import 'package:effective_sales/app/theme/effective_sales_icons.dart';
import 'package:effective_sales/main_features/flight_tickets/common/bloc/route_search_bloc.dart';
import 'package:effective_sales/main_features/flight_tickets/end_search/bloc/flight_search_bloc.dart';
import 'package:effective_sales/main_features/flight_tickets/flight_page/bloc/flight_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:effective_sales/app/localization/localization_extension.dart';

class AppState {
  static Map<int, String> mapScreen = {
    0: RouteName.flightTickets,
    1: RouteName.hotels,
    2: RouteName.shortReview,
    3: RouteName.subscriptions,
    4: RouteName.profile,
  };
  static ValueNotifier<bool> showNavBar = ValueNotifier(true);
}

class AppNavigationWrapper extends StatelessWidget {
  const AppNavigationWrapper({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: getIt<FlightPageBloc>(),
        ),
        BlocProvider.value(
          value: getIt<RouteSearchBloc>(),
        ),
        BlocProvider.value(
          value: getIt<FlightSearchBloc>(),
        ),
        //Another features bloc
      ],
      child: child,
    );
  }
}

class MainAppScaffold extends StatelessWidget {
  const MainAppScaffold({
    super.key,
    required this.navigationShell,
  });
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return AppNavigationWrapper(
      child: ValueListenableBuilder<bool>(
        valueListenable: AppState.showNavBar,
        builder: (context, showBar, child) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: navigationShell,
            bottomNavigationBar: !showBar
                ? null
                : SizedBox(
                    height: 54,
                    child: BottomNavigationBar(
                      currentIndex: navigationShell.currentIndex,
                      items: _createNavigationBarItems(context),
                      onTap: (int index) {
                        if (navigationShell.currentIndex != index) {
                          navigationShell.goBranch(
                            index,
                            initialLocation: index == navigationShell.currentIndex,
                          );
                        }
                      },
                    ),
                  ),
          );
        },
      ),
    );
  }

  List<BottomNavigationBarItem> _createNavigationBarItems(
    BuildContext context,
  ) =>
      [
        BottomNavigationBarItem(
          label: context.S.nav_title_flight_tickets,
          icon: const Icon(
            EffectiveSalesIcons.plane,
          ),
        ),
        BottomNavigationBarItem(
          label: context.S.nav_title_hotels,
          icon: const Icon(
            EffectiveSalesIcons.hotels,
          ),
        ),
        BottomNavigationBarItem(
          label: context.S.nav_title_short_review,
          icon: const Icon(
            EffectiveSalesIcons.shortReview,
          ),
        ),
        BottomNavigationBarItem(
          label: context.S.nav_title_subscriptions,
          icon: const Icon(
            EffectiveSalesIcons.notification1,
          ),
        ),
        BottomNavigationBarItem(
          label: context.S.nav_title_profile,
          icon: const Icon(
            EffectiveSalesIcons.profile,
          ),
        ),
      ];
}
