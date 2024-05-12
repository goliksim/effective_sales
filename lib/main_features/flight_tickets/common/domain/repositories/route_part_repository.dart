import 'package:effective_sales/main_features/flight_tickets/common/domain/models/flight_route_part_entity.dart';

abstract interface class RoutePartRepository {
  //DEPARTURES
  Future<List<FlightRoutePartEntity>> getAllDepartures();
  Future<List<FlightRoutePartEntity>> getDeparturesLike(String input);

  //ARRIVALS
  Future<FlightRoutePartEntity?> getRandomAvailableArrival(FlightRoutePartEntity departure);
  Future<List<FlightRoutePartEntity>> getAvailableArrivals(FlightRoutePartEntity departure);

  Future<FlightRoutePartEntity?> getRandomArrival();
  Future<List<FlightRoutePartEntity>> getAllArrivals();
  Future<List<FlightRoutePartEntity>> getArrivalsLike(String input);
}
