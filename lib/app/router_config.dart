import 'package:effective_sales/common/ui/app_navigation_widget.dart';
import 'package:effective_sales/main_features/flight_tickets/end_search/ui/end_search_page/end_search_page.dart';
import 'package:effective_sales/main_features/flight_tickets/end_search/ui/search_hard.dart';
import 'package:effective_sales/main_features/flight_tickets/end_search/ui/search_hot_deals.dart';
import 'package:effective_sales/main_features/flight_tickets/end_search/ui/search_weekend.dart';
import 'package:effective_sales/main_features/flight_tickets/flight_page/ui/flight_page.dart';
import 'package:effective_sales/main_features/flight_tickets/pre_search/ui/pre_search_page.dart';
import 'package:effective_sales/main_features/hotels/ui/hotels_page.dart';
import 'package:effective_sales/main_features/profile/ui/profile_page.dart';
import 'package:effective_sales/main_features/short_review/ui/short_review_page.dart';
import 'package:effective_sales/main_features/subscriptions/ui/subscriptions_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

abstract class RouteName {
  static const String root = '/';

  static const String flightTickets = '/flightTickets';
  static const String flightPreSearch = '/flightTickets/flightPreSearch';
  static const String flightSearchHard = '/flightTickets/flightSearchHard';
  static const String flightSearchWeekend = '/flightTickets/flightSearchWeekend';
  static const String flightSearchHotDeal = '/flightTickets/flightSearchHotDeal';
  static const String flightEndSearch = '/flightTickets/flightEndSearch';

  static const String hotels = '/hotels';

  static const String shortReview = '/shortReview';

  static const String subscriptions = '/subscriptions';

  static const String profile = '/profile';
}

final routerConfig = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: RouteName.flightTickets,
  debugLogDiagnostics: true,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) => MainAppScaffold(
        navigationShell: navigationShell,
      ),
      branches: <StatefulShellBranch>[
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: RouteName.flightTickets,
              builder: (BuildContext context, GoRouterState state) {
                return const FlightPage();
              },
              routes: <RouteBase>[
                GoRoute(
                  path: 'flightSearchHard',
                  builder: (BuildContext context, GoRouterState state) {
                    return const FlightSearchHardWay();
                  },
                ),
                GoRoute(
                  path: 'flightSearchWeekend',
                  builder: (BuildContext context, GoRouterState state) {
                    return const FlightSearchWeekend();
                  },
                ),
                GoRoute(
                  path: 'flightSearchHotDeal',
                  builder: (BuildContext context, GoRouterState state) {
                    return const FlightSearchHotDeal();
                  },
                ),
                GoRoute(
                  path: 'flightPreSearch',
                  builder: (BuildContext context, GoRouterState state) {
                    return const FlightPreSearchPage();
                  },
                ),
                GoRoute(
                  path: 'flightEndSearch',
                  builder: (BuildContext context, GoRouterState state) {
                    return const FlightEndSearchPage();
                  },
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: RouteName.hotels,
              builder: (BuildContext context, GoRouterState state) {
                return const HotelsPage();
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: RouteName.shortReview,
              builder: (BuildContext context, GoRouterState state) {
                return const ShortReviewPage();
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: RouteName.subscriptions,
              builder: (BuildContext context, GoRouterState state) {
                return const SubscriptionsPage();
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: RouteName.profile,
              builder: (BuildContext context, GoRouterState state) {
                return const ProfilePage();
              },
            ),
          ],
        ),
      ],
    ),
  ],
);
