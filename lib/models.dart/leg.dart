import 'package:ember_trip_view/models.dart/location.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'leg.g.dart';

@JsonSerializable()
class Leg extends Equatable {
  final String tripUid;
  final Location origin;
  final Location destination;

  const Leg({required this.tripUid, required this.origin, required this.destination});

  factory Leg.fromJson(Map<String, dynamic> json) => _$LegFromJson(json);

  @override
  List<Object?> get props => [tripUid, origin, destination];

  @override
  bool? get stringify => true;
}
