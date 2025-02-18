// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timing_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimingInfo _$TimingInfoFromJson(Map<String, dynamic> json) => TimingInfo(
  scheduled: DateTime.parse(json['scheduled'] as String),
  estimated:
      json['estimated'] == null
          ? null
          : DateTime.parse(json['estimated'] as String),
  actual:
      json['actual'] == null ? null : DateTime.parse(json['actual'] as String),
);
