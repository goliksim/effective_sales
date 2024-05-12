import 'package:effective_sales/main_features/flight_tickets/common/data/models/flight_route_part_model.dart';
import 'package:effective_sales/main_features/flight_tickets/common/domain/models/flight_route_part_entity.dart';
import 'package:injectable/injectable.dart';

@injectable
class FlightRoutePartEntityToModelMapper {
  FlightRoutePartModel map(FlightRoutePartEntity entity) {
    return FlightRoutePartModel(
      localContry: entity.localContry,
      localTown: entity.localTown,
      townId: entity.townId,
    );
  }

  List<FlightRoutePartModel> mapList(List<FlightRoutePartEntity> flightRoutePartEntities) {
    return flightRoutePartEntities.map((e) => map(e)).toList();
  }
}
