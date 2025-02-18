import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'timing_info.g.dart';

@JsonSerializable()
class TimingInfo extends Equatable {
  final DateTime scheduled;
  final DateTime? estimated;
  final DateTime? actual;

  const TimingInfo({
    required this.scheduled,
    required this.estimated,
    required this.actual,
  });

  factory TimingInfo.fromJson(Map<String, dynamic> json) =>
      _$TimingInfoFromJson(json);

  @override
  List<Object?> get props => [scheduled, estimated, actual];

  @override
  bool? get stringify => true;
}
