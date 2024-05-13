import 'package:effective_sales/main_features/flight_tickets/end_search/data/models/ticket_offers_responce.dart';
import 'package:effective_sales/main_features/flight_tickets/flight_page/data/models/flight_offer_responce.dart';
import 'package:effective_sales/main_features/flight_tickets/pre_search/data/models/flight_ticket_offers_responce.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

part 'api_service.g.dart';

@injectable
@RestApi(baseUrl: 'https://run.mocky.io/v3/')
abstract class RestClient {
  @factoryMethod
  factory RestClient(Dio dio) = _RestClient;

  // RETROFIT НЕ ПОЗВОЛЯЕТ КОДГЕНИТЬ ИЗ DART-DEFINE, БУДЕМ ПЕРЕДАВАТЬ КАК АРГУМЕНТ ФУНКЦИИ

  @GET('/{url}')
  Future<FlightOfferResponce> fetchFlightOffers(@Path() String url);

  @GET('/{url}')
  Future<FlightTicketOffersResponce> fetchTicketOffers(@Path() String url);

  @GET('/{url}')
  Future<TicketOffersResponce> fetchTickets(@Path() String url);
}
