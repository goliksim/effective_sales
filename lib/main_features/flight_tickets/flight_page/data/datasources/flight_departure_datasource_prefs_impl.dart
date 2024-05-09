import 'package:injectable/injectable.dart';

import 'package:shared_preferences/shared_preferences.dart';

@injectable
class FlightDepartureLocalStorageDatasourcePref {
  FlightDepartureLocalStorageDatasourcePref(this.prefs);
  final SharedPreferences prefs;

  Future<String?> getLastDeparture() async {
    try {
      final String? departure = prefs.getString('lastDeparture');

      return departure;
    } catch (e) {
      return null;
    }
  }

  Future<bool> writeLastDeparture(String newDeparture) async {
    try {
      await prefs.setString('lastDeparture', newDeparture);
      return true;
    } catch (e) {
      return false;
    }
  }
}
