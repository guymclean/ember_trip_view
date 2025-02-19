import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:ember_trip_view/models/quote.dart';
import 'package:ember_trip_view/models/trip.dart';
import 'package:equatable/equatable.dart';

part 'trip_view_state.g.dart';

@CopyWith()
class TripViewState extends Equatable {
  final bool isLoading;
  final bool hasError;
  final List<Quote> quotes;
  final Trip? selectedTrip;

  const TripViewState({
    this.isLoading = true,
    this.hasError = false,
    this.quotes = const [],
    this.selectedTrip,
  });

  @override
  List<Object?> get props => [
    isLoading,
    hasError,
    quotes,
    selectedTrip,
  ];

  @override
  bool? get stringify => true;
}
