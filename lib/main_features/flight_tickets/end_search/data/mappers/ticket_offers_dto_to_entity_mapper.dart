import 'package:effective_sales/common/data/mappers/price_dto_to_entity_mapper.dart';
import 'package:effective_sales/common/data/models/price_dto.dart';
import 'package:effective_sales/main_features/flight_tickets/end_search/data/mappers/flight_dto_to_entity_mapper.dart';
import 'package:effective_sales/main_features/flight_tickets/end_search/data/models/flight_dto.dart';
import 'package:effective_sales/main_features/flight_tickets/end_search/data/models/ticket_offers_dto.dart';
import 'package:effective_sales/main_features/flight_tickets/end_search/domain/models/ticket_offers_entity.dart';
import 'package:injectable/injectable.dart';

@injectable
class TicketOffersDtoToEntityMapper {
  TicketOffersDtoToEntityMapper(this.priceMapper, this.flightMapper);
  final PriceDtoToEntityMapper priceMapper;
  final FlightDtoToEntityMapper flightMapper;

  TicketOffersEntity map(TicketOffersDto dto) {
    if (dto.id == null || dto.price == null || dto.departure == null || dto.arrival == null) {
      throw Exception('TicketOffersDtoToEntityMapper: dto has null params');
    }
    return TicketOffersEntity(
      badge: dto.badge,
      company: dto.company ?? 'Error company',
      hasTransfer: dto.hasTransfer ?? false,
      id: dto.id ?? -1,
      price: priceMapper.map(dto.price ?? const PriceDto(value: 0, currency: 'Error currency')),
      departure: flightMapper.map(
        dto.departure ??
            FlightDto(
              town: 'Error town',
              date: DateTime.now(),
              airport: 'Error airport',
            ),
      ),
      arrival: flightMapper.map(
        dto.arrival ??
            FlightDto(
              town: 'Error town',
              date: DateTime.now(),
              airport: 'Error airport',
            ),
      ),
    );
  }

  List<TicketOffersEntity> mapList(List<TicketOffersDto> ticketOffersDtos) {
    return ticketOffersDtos.map((e) => map(e)).toList();
  }
}
