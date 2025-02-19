import 'package:ember_trip_view/models/leg.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'quote.g.dart';

@JsonSerializable()
class Quote extends Equatable {
  final List<Leg> legs;

  const Quote({required this.legs});

  factory Quote.fromJson(Map<String, dynamic> json) => _$QuoteFromJson(json);

  @override
  List<Object?> get props => [legs];

  @override
  bool? get stringify => true;
}
