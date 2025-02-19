import 'package:ember_trip_view/models/location.dart';
import 'package:ember_trip_view/models/timing_info.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'leg.g.dart';

@JsonSerializable()
class Leg extends Equatable {
  final String tripUid;
  final Location origin;
  final Location destination;
  final TimingInfo departure;
  final TimingInfo arrival;

  const Leg({
    required this.tripUid,
    required this.origin,
    required this.destination,
    required this.departure,
    required this.arrival,
  });

  factory Leg.fromJson(Map<String, dynamic> json) => _$LegFromJson(json);

  @override
  List<Object?> get props => [tripUid, origin, destination, departure, arrival];

  @override
  bool? get stringify => true;
}
