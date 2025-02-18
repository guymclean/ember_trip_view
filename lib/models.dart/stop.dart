import 'package:ember_trip_view/models.dart/location.dart';
import 'package:ember_trip_view/models.dart/timing_info.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'stop.g.dart';

@JsonSerializable()
class Stop extends Equatable {
  final int id;
  final TimingInfo departure;
  final TimingInfo arrival;
  final Location location;

  const Stop({
    required this.id,
    required this.departure,
    required this.arrival,
    required this.location,
  });

  factory Stop.fromJson(Map<String, dynamic> json) => _$StopFromJson(json);

  @override
  List<Object?> get props => [id, departure, arrival, location];

  @override
  bool? get stringify => true;
}
