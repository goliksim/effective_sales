import 'package:effective_sales/common/data/api_service.dart';
import 'package:effective_sales/main_features/flight_tickets/flight_page/data/mappers/flight_offer_dto_to_entity_mapper.dart';
import 'package:effective_sales/main_features/flight_tickets/flight_page/domain/models/flight_offer_entity.dart';
import 'package:effective_sales/main_features/flight_tickets/flight_page/domain/repositories/network_flight_offers_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class NetworkFlightOffersRepositoryImpl implements NetworkFlightOffersRepository {
  NetworkFlightOffersRepositoryImpl({
    required this.client,
    required this.flightOfferDtoToEntityMapper,
  });

  final RestClient client;
  final FlightOfferDtoToEntityMapper flightOfferDtoToEntityMapper;

  @override
  Future<List<FlightOfferEntity>> fetchOffers() async {
    final responce = await client.fetchFlightOffers(const String.fromEnvironment('OFFERS_API_LINK'));
    final list = flightOfferDtoToEntityMapper.mapList(responce.offers ?? []);
    return list;
  }

  @override
  Future<FlightOfferEntity?> getOfferById(int id) {
    throw UnimplementedError();
  }
}
