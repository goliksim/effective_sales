import 'package:effective_sales/main_features/flight_tickets/common/domain/models/flight_route_part_entity.dart';

abstract interface class FlightDepartureRepository {
  Future<FlightRoutePartEntity?> getLastDeparture();
  Future<bool> writeLastDeparture(FlightRoutePartEntity newDeparture);
}
