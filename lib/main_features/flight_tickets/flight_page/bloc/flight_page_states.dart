part of 'flight_page_bloc.dart';

@freezed
class FlightPageState with _$FlightPageState {
  const factory FlightPageState.init() = _FlightInitialState;

  const factory FlightPageState.loaded(
    String? lastDeparture,
    List<FlightOfferEntity> flightOffers,
  ) = _FlightLoadedState;

  const factory FlightPageState.error(String? lastDeparture) = _ErrorFlightState;
}
