import 'dart:convert';

import 'package:effective_sales/main_features/flight_tickets/common/data/mappers/flight_route_part_entity_to_model_mapper.dart';
import 'package:effective_sales/main_features/flight_tickets/common/data/mappers/flight_route_part_model_to_entity_mapper.dart';
import 'package:effective_sales/main_features/flight_tickets/common/data/models/flight_route_part_model.dart';
import 'package:effective_sales/main_features/flight_tickets/common/domain/models/flight_route_part_entity.dart';
import 'package:effective_sales/main_features/flight_tickets/flight_page/data/datasources/flight_departure_datasource_prefs_impl.dart';
import 'package:effective_sales/main_features/flight_tickets/flight_page/domain/repositories/flight_departure_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class FlightDepartureRepositoryImpl implements FlightDepartureRepository {
  FlightDepartureRepositoryImpl(this.datasource, this.entToModMapper, this.modToEntMapper);

  final FlightDepartureLocalStorageDatasourcePref datasource;
  final FlightRoutePartEntityToModelMapper entToModMapper;
  final FlightRoutePartModelToEntityMapper modToEntMapper;

  @override
  Future<FlightRoutePartEntity?> getLastDeparture() async {
    final responce = await datasource.getLastDeparture();
    if (responce == null) throw Exception('FlightDepartureRepositoryImpl: responce is null');
    final result = modToEntMapper.map(
      FlightRoutePartModel.fromJson(
        jsonDecode(responce),
      ),
    );
    return result;
  }

  @override
  Future<bool> writeLastDeparture(FlightRoutePartEntity newDeparture) {
    try {
      final model = entToModMapper.map(newDeparture);
      return datasource.writeLastDeparture(
        jsonEncode(
          model.toJson(),
        ),
      );
    } catch (e) {
      return Future.value(false);
    }
  }
}
