import 'package:effective_sales/main_features/flight_tickets/common/data/repository/route_part_repository_impl_mock.dart';
import 'package:effective_sales/main_features/flight_tickets/common/domain/repositories/route_part_repository.dart';
import 'package:effective_sales/main_features/flight_tickets/flight_page/data/repositories/flight_departure_repository_impl.dart';
import 'package:effective_sales/main_features/flight_tickets/flight_page/data/repositories/flight_offers_repository_impl.dart';
import 'package:effective_sales/main_features/flight_tickets/flight_page/data/repositories/network_flight_offers_repository_impl.dart';
import 'package:effective_sales/main_features/flight_tickets/flight_page/domain/repositories/flight_departure_repository.dart';
import 'package:effective_sales/main_features/flight_tickets/flight_page/domain/repositories/flight_offers_repository.dart';
import 'package:effective_sales/main_features/flight_tickets/flight_page/domain/repositories/network_flight_offers_repository.dart';
import 'package:effective_sales/main_features/flight_tickets/pre_search/data/repositories/arrival_recommendation_repository_impl_mock.dart';
import 'package:effective_sales/main_features/flight_tickets/pre_search/data/repositories/flight_pre_search_repository.dart';
import 'package:effective_sales/main_features/flight_tickets/pre_search/domain/repositories/arrival_recommendation_repository.dart';
import 'package:effective_sales/main_features/flight_tickets/pre_search/domain/repositories/flight_pre_search_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'injectable_init.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
Future<void> configureDependencies() async {
  await getIt.init();
}

@module
abstract class NetworkModule {
  @singleton
  Dio get dio => Dio()
    ..interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );
  //@singleton
  //RestClient get getService => RestClient(dio);
}

@module
abstract class FlightPageModule {
  @injectable
  FlightDepartureRepository flightDepartureRepository(
    FlightDepartureRepositoryImpl impl,
  ) =>
      impl;

  @injectable
  FlightOffersRepository flightOffersRepository(
    FlightOffersRepositoryImpl impl,
  ) =>
      impl;

  @injectable
  NetworkFlightOffersRepository networkFlightOffersRepository(
    NetworkFlightOffersRepositoryImpl impl,
  ) =>
      impl;

  @injectable
  RoutePartRepository routePartRepository(
    RoutePartRepositoryImplMock impl,
  ) =>
      impl;
}

@module
abstract class PreSearchModule {
  @injectable
  ArrivalRecommendationRepository arrivalRecommendationRepository(
    ArrivalRecommendationRepositoryImplMock impl,
  ) =>
      impl;

  @injectable
  FlightPreSearchRepository flightPreSearchRepository(
    FlightPreSearchRepositoryImpl impl,
  ) =>
      impl;
}

@module
abstract class PrefModule {
  // We presolve future so we should have Isar, not Future<Isar> in our dependency graph
  @preResolve
  @singleton
  Future<SharedPreferences> get prefs async => await SharedPreferences.getInstance();
}
