import 'package:effective_sales/main_features/flight_tickets/end_search/data/models/flight_dto.dart';
import 'package:effective_sales/main_features/flight_tickets/end_search/domain/models/flight_entity.dart';
import 'package:injectable/injectable.dart';

@injectable
class FlightDtoToEntityMapper {
  FlightEntity map(FlightDto dto) {
    if (dto.town == null || dto.date == null || dto.airport == null) {
      throw Exception('FlightDtoToEntityMapper: dto has null params');
    }
    return FlightEntity(
      town: dto.town ?? 'Error town',
      date: dto.date ?? DateTime.now(),
      airport: dto.airport ?? 'Error airport',
    );
  }
}
