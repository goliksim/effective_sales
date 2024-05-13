import 'package:effective_sales/common/data/api_service.dart';
import 'package:effective_sales/main_features/flight_tickets/pre_search/data/mappers/flight_ticket_offer_dto_to_entity_mapper.dart';
import 'package:effective_sales/main_features/flight_tickets/pre_search/domain/models/flight_offers_request_entity.dart';
import 'package:effective_sales/main_features/flight_tickets/pre_search/domain/models/flight_ticket_offers_entity.dart';
import 'package:effective_sales/main_features/flight_tickets/pre_search/domain/repositories/flight_pre_search_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class FlightPreSearchRepositoryImpl implements FlightPreSearchRepository {
  FlightPreSearchRepositoryImpl(this.client, this.flightOfferDtoToEntityMapper);

  final RestClient client;
  final FlightTicketOffersDtoToEntityMapper flightOfferDtoToEntityMapper;

  @override
  Future<List<FlightTicketOffersEntity>> getTicketsOffers(FlightOffersRequestEntity requestEntity) async {
    final responce = await client.fetchTicketOffers(const String.fromEnvironment('TICKETS_OFFERS_API_LINK'));
    return flightOfferDtoToEntityMapper.mapList(responce.offers);
  }
}
