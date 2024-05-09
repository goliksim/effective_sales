import 'package:effective_sales/main_features/flight_tickets/flight_page/domain/models/flight_offer_entity.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

part 'api_service.g.dart';

@injectable
@RestApi(baseUrl: 'https://run.mocky.io/v3/')
abstract class RestClient {
  @factoryMethod
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  static const String _flightOffersUrl =
      bool.hasEnvironment('OFFERS_API_LINK') ? String.fromEnvironment('OFFERS_API_LINK') : '';

  @GET(_flightOffersUrl)
  Future<List<FlightOfferEntity>> fetchFlightOffers();
}
