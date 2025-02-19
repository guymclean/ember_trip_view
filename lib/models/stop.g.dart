// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stop.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Stop _$StopFromJson(Map<String, dynamic> json) => Stop(
  id: (json['id'] as num).toInt(),
  departure: TimingInfo.fromJson(json['departure'] as Map<String, dynamic>),
  arrival: TimingInfo.fromJson(json['arrival'] as Map<String, dynamic>),
  location: Location.fromJson(json['location'] as Map<String, dynamic>),
);
