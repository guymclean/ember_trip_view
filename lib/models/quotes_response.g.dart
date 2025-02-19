// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quotes_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuotesResponse _$QuotesResponseFromJson(Map<String, dynamic> json) =>
    QuotesResponse(
      quotes:
          (json['quotes'] as List<dynamic>)
              .map((e) => Quote.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
