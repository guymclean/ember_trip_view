// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leg.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Leg _$LegFromJson(Map<String, dynamic> json) => Leg(
  tripUid: json['trip_uid'] as String,
  origin: Location.fromJson(json['origin'] as Map<String, dynamic>),
  destination: Location.fromJson(json['destination'] as Map<String, dynamic>),
  departure: TimingInfo.fromJson(json['departure'] as Map<String, dynamic>),
  arrival: TimingInfo.fromJson(json['arrival'] as Map<String, dynamic>),
);
