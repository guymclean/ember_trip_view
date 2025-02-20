import 'dart:convert';

import 'package:ember_trip_view/models/quote.dart';
import 'package:ember_trip_view/models/quotes_response.dart';
import 'package:http/http.dart' as http;

class QuoteRepository {
  Future<List<Quote>> fetchQuotes() async {
    Uri url = Uri.https('api.ember.to', '/v1/quotes/', {
      'origin': '13',
      'destination': '42',
      'departure_date_from': '2025-02-27T00:00:00.000000+00:00', // TODO inject date provider to use current day
      'departure_date_to': '2025-02-27T23:59:59.999999+00:00',
    });
    final response = await http.get(url);
    final json = jsonDecode(response.body);
    final quoteResponse = QuotesResponse.fromJson(json);
    return quoteResponse.quotes;
  }
}
