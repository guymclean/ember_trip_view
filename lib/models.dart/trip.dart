import 'package:ember_trip_view/models.dart/stop.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'trip.g.dart';

@JsonSerializable()
class Trip extends Equatable {
  final List<Stop> route;

  const Trip({
    required this.route,
  });

  factory Trip.fromJson(Map<String, dynamic> json) => _$TripFromJson(json);

  @override
  List<Object?> get props => [route];

  @override
  bool? get stringify => true;
}
