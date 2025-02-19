import 'package:ember_trip_view/models/quote.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'quotes_response.g.dart';

@JsonSerializable()
class QuotesResponse extends Equatable {
  final List<Quote> quotes;

  const QuotesResponse({required this.quotes});

  factory QuotesResponse.fromJson(Map<String, dynamic> json) =>
      _$QuotesResponseFromJson(json);

  @override
  List<Object?> get props => [quotes];

  @override
  bool? get stringify => true;
}
