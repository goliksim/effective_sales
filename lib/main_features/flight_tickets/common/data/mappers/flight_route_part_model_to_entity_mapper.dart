import 'package:effective_sales/main_features/flight_tickets/common/data/models/flight_route_part_model.dart';
import 'package:effective_sales/main_features/flight_tickets/common/domain/models/flight_route_part_entity.dart';
import 'package:injectable/injectable.dart';

@injectable
class FlightRoutePartModelToEntityMapper {
  FlightRoutePartEntity map(FlightRoutePartModel model) {
    if (model.localContry == null || model.localTown == null || model.townId == null) {
      throw Exception('FlightRouteMapper: model has null params');
    }
    return FlightRoutePartEntity(
      localContry: model.localContry ?? '',
      localTown: model.localTown ?? '',
      townId: model.townId ?? -1,
    );
  }

  List<FlightRoutePartEntity> mapList(List<FlightRoutePartModel> flightRoutePartModels) {
    return flightRoutePartModels.map((e) => map(e)).toList();
  }
}
