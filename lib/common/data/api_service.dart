import 'package:effective_sales/main_features/flight_tickets/flight_page/data/models/flight_offer_responce.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

part 'api_service.g.dart';

@injectable
@RestApi(baseUrl: 'https://run.mocky.io/v3/')
abstract class RestClient {
  @factoryMethod
  factory RestClient(Dio dio) = _RestClient;

  //TODO ПОДЧИСТИТЬ

  // RETROFIT НЕ ПОЗВОЛЯЕТ КОДГЕНИТЬ ИЗ DART-DEFINE, ТАК ЧТО ЗАБУДЕМ О БЕЗОПАСНОСТИ
  /*static const String flightOffersUrl =
       bool.hasEnvironment('OFFERS_API_LINK') ?  String.fromEnvironment('OFFERS_API_LINK') : 'not_found';

  static const String _flightTicketsOfferUrl =
      bool.hasEnvironment('TICKETS_OFFERS_API_LINK') ? String.fromEnvironment('TICKETS_OFFERS_API_LINK') : 'not_found';
  static const String _flightTicketUrl =
      bool.hasEnvironment('TICKETS_API_LINK') ? String.fromEnvironment('TICKETS_API_LINK') : 'not_found';*/
  @GET('/{url}')
  Future<FlightOfferResponce> fetchFlightOffers(@Path() String url);
}
