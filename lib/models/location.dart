import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'location.g.dart';

@JsonSerializable()
class Location extends Equatable {
  final double lat;
  final double lon;
  final String name;
  final String regionName;

  const Location({
    required this.lat,
    required this.lon,
    required this.name,
    required this.regionName,
  });

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  @override
  List<Object?> get props => [lat, lon, name, regionName];

  @override
  bool? get stringify => true;
}
