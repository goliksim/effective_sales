import 'dart:math';

import 'package:effective_sales/main_features/flight_tickets/common/domain/models/flight_route_part_entity.dart';
import 'package:effective_sales/main_features/flight_tickets/common/domain/repositories/route_part_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class RoutePartRepositoryImplMock implements RoutePartRepository {
  //final NetworkRoutePartRepository datasource;

  RoutePartRepositoryImplMock(
      //this.datasource
      );

  //TODO MOCK REPOSITORY IMPL -> CREATE REAL
  static const List<FlightRoutePartEntity> _arrivals = [
    FlightRoutePartEntity(townId: 0, localContry: 'Russia', localTown: 'Москва'),
    FlightRoutePartEntity(townId: 0, localContry: 'Russia', localTown: 'Санкт-Петербург'),
    FlightRoutePartEntity(townId: 0, localContry: 'Russia', localTown: 'Новосибирск'),
    FlightRoutePartEntity(townId: 0, localContry: 'Russia', localTown: 'Казань'),
    FlightRoutePartEntity(townId: 0, localContry: 'Russia', localTown: 'Сочи'),
  ];

  static const List<FlightRoutePartEntity> _departures = [
    FlightRoutePartEntity(townId: 0, localContry: 'Russia', localTown: 'Москва'),
    FlightRoutePartEntity(townId: 0, localContry: 'Russia', localTown: 'Санкт-Петербург'),
    FlightRoutePartEntity(townId: 0, localContry: 'Russia', localTown: 'Новосибирск'),
    FlightRoutePartEntity(townId: 0, localContry: 'Russia', localTown: 'Казань'),
    FlightRoutePartEntity(townId: 0, localContry: 'Russia', localTown: 'Сочи'),
  ];

  @override
  Future<List<FlightRoutePartEntity>> getAllArrivals() {
    return Future.value(_arrivals);
  }

  @override
  Future<List<FlightRoutePartEntity>> getAllDepartures() {
    return Future.value(_departures);
  }

  @override
  Future<List<FlightRoutePartEntity>> getArrivalsLike(String input) {
    return Future.value(_arrivals.where((e) => e.localTown.startsWith(input)).toList());
  }

  @override
  Future<List<FlightRoutePartEntity>> getAvailableArrivals(FlightRoutePartEntity departure) {
    return Future.value(_arrivals.where((e) => e.localTown != departure.localTown).toList());
  }

  @override
  Future<List<FlightRoutePartEntity>> getDeparturesLike(String input) {
    return Future.value(_departures.where((e) => e.localTown.startsWith(input)).toList());
  }

  @override
  Future<FlightRoutePartEntity?> getRandomArrival() {
    return Future.value(_arrivals[Random().nextInt(_arrivals.length)]);
  }

  @override
  Future<FlightRoutePartEntity?> getRandomAvailableArrival(FlightRoutePartEntity departure) {
    final list = _arrivals.where((e) => e.localTown != departure.localTown).toList();
    return Future.value(list[Random().nextInt(list.length)]);
  }
}
