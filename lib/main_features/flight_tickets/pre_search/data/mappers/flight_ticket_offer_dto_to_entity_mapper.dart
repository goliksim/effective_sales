import 'package:effective_sales/common/domain/models/price_entity.dart';
import 'package:effective_sales/main_features/flight_tickets/pre_search/data/models/flight_ticket_offers_dto.dart';
import 'package:effective_sales/main_features/flight_tickets/pre_search/domain/models/flight_ticket_offers_entity.dart';
import 'package:injectable/injectable.dart';

@injectable
class FlightTicketOffersDtoToEntityMapper {
  FlightTicketOffersEntity map(FlightTicketOffersDto dto) {
    if (dto.id == null || dto.title == null || dto.timeRanges == null) {
      throw Exception('FlightTicketOffersMappper: dto has null params');
    }
    return FlightTicketOffersEntity(
      id: dto.id ?? -1,
      title: dto.title ?? 'Error title',
      timeRanges: dto.timeRanges ?? [],
      price: dto.price ?? const PriceEntity(value: 0),
    );
  }

  List<FlightTicketOffersEntity> mapList(List<FlightTicketOffersDto> flightTicketOffersDtos) {
    return flightTicketOffersDtos.map((e) => map(e)).toList();
  }
}
