abstract interface class FlightDepartureRepository {
  Future<String?> getLastDeparture();
  Future<bool> writeLastDeparture(String newDeparture);
}
