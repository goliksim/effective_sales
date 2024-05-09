import 'package:effective_sales/common/ui/app_navigation_widget.dart';
import 'package:effective_sales/main_features/air_tickets/end_search/ui/end_search_page.dart';
import 'package:effective_sales/main_features/air_tickets/flight_page/ui/flight_page.dart';
import 'package:effective_sales/main_features/air_tickets/pre_search/ui/pre_search_page.dart';
import 'package:effective_sales/main_features/hotels/ui/hotels_page.dart';
import 'package:effective_sales/main_features/profile/ui/profile_page.dart';
import 'package:effective_sales/main_features/short_review/ui/short_review_page.dart';
import 'package:effective_sales/main_features/subscriptions/ui/subscriptions_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>();

abstract class RouteName {
  static const String root = '/';

  static const String flightTickets = '/flightTickets';
  static const String flightPreSearch = '/flightPreSearch';
  static const String flightEndSearch = '/flightEndSearch';

  static const String hotels = '/hotels';

  static const String shortReview = '/shortReview';

  static const String subscriptions = '/subscriptions';

  static const String profile = '/profile';
}

final routerConfig = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: RouteName.flightTickets,
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return AppNavigationWrapper(child: child);
      },
      routes: <RouteBase>[
        GoRoute(
          path: RouteName.flightTickets,
          builder: (BuildContext context, GoRouterState state) {
            return const FlightPage();
          },
        ),
        GoRoute(
          path: RouteName.hotels,
          builder: (BuildContext context, GoRouterState state) {
            return const HotelsPage();
          },
        ),
        GoRoute(
          path: RouteName.shortReview,
          builder: (BuildContext context, GoRouterState state) {
            return const ShortReviewPage();
          },
        ),
        GoRoute(
          path: RouteName.subscriptions,
          builder: (BuildContext context, GoRouterState state) {
            return const SubscriptionsPage();
          },
        ),
        GoRoute(
          path: RouteName.profile,
          builder: (BuildContext context, GoRouterState state) {
            return const ProfilePage();
          },
        ),
      ],
    ),
    GoRoute(
      path: RouteName.flightPreSearch,
      builder: (BuildContext context, GoRouterState state) {
        return const FlightPreSearchPage();
      },
    ),
    GoRoute(
      path: RouteName.flightEndSearch,
      builder: (BuildContext context, GoRouterState state) {
        return const FlightEndSearchPage();
      },
    ),
  ],
);
