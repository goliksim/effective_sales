part of 'flight_search_bloc.dart';

@freezed
class FlightSearchState with _$FlightSearchState {
  const factory FlightSearchState.init({
    required FlightOffersRequestEntity requestEntity,
  }) = _FlightSearchInitial;

  const factory FlightSearchState.preSearch({
    required FlightOffersRequestEntity requestEntity,
    required List<FlightTicketOffersEntity> offersEntity,
  }) = _FlightPreSearchLoaded;

  const factory FlightSearchState.ticketsLoaded({
    required FlightOffersRequestEntity requestEntity,
    required List<TicketOffersEntity> tickets,
  }) = _FlightSearchLoaded;

  const factory FlightSearchState.error({
    required FlightOffersRequestEntity requestEntity,
  }) = _FlightSearchError;
}
