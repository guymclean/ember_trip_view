// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Trip _$TripFromJson(Map<String, dynamic> json) => Trip(
  route:
      (json['route'] as List<dynamic>?)
          ?.map((e) => Stop.fromJson(e as Map<String, dynamic>))
          .toList(),
);
