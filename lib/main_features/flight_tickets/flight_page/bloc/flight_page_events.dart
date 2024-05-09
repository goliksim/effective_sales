part of 'flight_page_bloc.dart';

@freezed
abstract class FlightPageEvent with _$FlightPageEvent {
  const factory FlightPageEvent.load() = _LoadFlightPage;
}
