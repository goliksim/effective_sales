import 'package:effective_sales/app/logger.dart';
import 'package:effective_sales/common/data/api_service.dart';
import 'package:effective_sales/main_features/flight_tickets/end_search/data/mappers/ticket_offers_dto_to_entity_mapper.dart';
import 'package:effective_sales/main_features/flight_tickets/end_search/domain/models/ticket_offers_entity.dart';
import 'package:effective_sales/main_features/flight_tickets/end_search/domain/repositories/ticket_offers_repositories.dart';
import 'package:effective_sales/main_features/flight_tickets/pre_search/domain/models/flight_offers_request_entity.dart';
import 'package:injectable/injectable.dart';

@injectable
class TicketOffersRepositoryImpl implements TicketOffersRepository {
  TicketOffersRepositoryImpl(this._restClient, this._ticketOffersDtoToEntityMapper);

  final RestClient _restClient;
  final TicketOffersDtoToEntityMapper _ticketOffersDtoToEntityMapper;

  @override
  Future<List<TicketOffersEntity>> getTicketOffers(FlightOffersRequestEntity requestEntity) async {
    final responce = await _restClient.fetchTickets(const String.fromEnvironment('TICKETS_API_LINK'));
    logger.log('ticketOffersRepositoriesImpl fetchTickets $responce');
    return _ticketOffersDtoToEntityMapper.mapList(responce.tickets);
  }
}
