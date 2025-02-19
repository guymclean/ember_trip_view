// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
  lat: (json['lat'] as num).toDouble(),
  lon: (json['lon'] as num).toDouble(),
  name: json['name'] as String,
  regionName: json['region_name'] as String,
);
