import 'package:effective_sales/common/domain/models/price_entity.dart';
import 'package:effective_sales/main_features/flight_tickets/flight_page/data/models/flight_offer_dto.dart';
import 'package:effective_sales/main_features/flight_tickets/flight_page/domain/models/flight_offer_entity.dart';
import 'package:injectable/injectable.dart';

@injectable
class FlightOfferDtoToEntityMapper {
  FlightOfferEntity map(FlightOfferDto dto) {
    if (dto.id == null || dto.title == null || dto.town == null || dto.price == null) {
      throw Exception('FlightOfferMappper: dto has null params');
    }
    return FlightOfferEntity(
      id: dto.id ?? -1,
      title: dto.title ?? 'Error title',
      town: dto.town ?? 'Error town',
      price: dto.price ?? const PriceEntity(value: 0),
    );
  }
}
