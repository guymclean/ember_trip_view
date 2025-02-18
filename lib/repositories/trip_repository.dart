import 'dart:convert';

import 'package:ember_trip_view/models.dart/trip.dart';
import 'package:http/http.dart' as http;

class TripRepository {
  Future<Trip> getTripInfo(String tripUid) async {
    Uri url = Uri.https('api.ember.to', '/v1/trips/$tripUid', {
      'route': 'true',
    });
    var response = await http.get(url);
    final json = jsonDecode(response.body);
    return Trip.fromJson(json);
  }
}
