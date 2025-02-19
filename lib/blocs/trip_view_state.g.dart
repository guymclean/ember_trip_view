// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_view_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TripViewStateCWProxy {
  TripViewState isLoading(bool isLoading);

  TripViewState hasError(bool hasError);

  TripViewState quotes(List<Quote> quotes);

  TripViewState selectedTrip(Trip? selectedTrip);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TripViewState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TripViewState(...).copyWith(id: 12, name: "My name")
  /// ````
  TripViewState call({
    bool isLoading,
    bool hasError,
    List<Quote> quotes,
    Trip? selectedTrip,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTripViewState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTripViewState.copyWith.fieldName(...)`
class _$TripViewStateCWProxyImpl implements _$TripViewStateCWProxy {
  const _$TripViewStateCWProxyImpl(this._value);

  final TripViewState _value;

  @override
  TripViewState isLoading(bool isLoading) => this(isLoading: isLoading);

  @override
  TripViewState hasError(bool hasError) => this(hasError: hasError);

  @override
  TripViewState quotes(List<Quote> quotes) => this(quotes: quotes);

  @override
  TripViewState selectedTrip(Trip? selectedTrip) =>
      this(selectedTrip: selectedTrip);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TripViewState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TripViewState(...).copyWith(id: 12, name: "My name")
  /// ````
  TripViewState call({
    Object? isLoading = const $CopyWithPlaceholder(),
    Object? hasError = const $CopyWithPlaceholder(),
    Object? quotes = const $CopyWithPlaceholder(),
    Object? selectedTrip = const $CopyWithPlaceholder(),
  }) {
    return TripViewState(
      isLoading:
          isLoading == const $CopyWithPlaceholder()
              ? _value.isLoading
              // ignore: cast_nullable_to_non_nullable
              : isLoading as bool,
      hasError:
          hasError == const $CopyWithPlaceholder()
              ? _value.hasError
              // ignore: cast_nullable_to_non_nullable
              : hasError as bool,
      quotes:
          quotes == const $CopyWithPlaceholder()
              ? _value.quotes
              // ignore: cast_nullable_to_non_nullable
              : quotes as List<Quote>,
      selectedTrip:
          selectedTrip == const $CopyWithPlaceholder()
              ? _value.selectedTrip
              // ignore: cast_nullable_to_non_nullable
              : selectedTrip as Trip?,
    );
  }
}

extension $TripViewStateCopyWith on TripViewState {
  /// Returns a callable class that can be used as follows: `instanceOfTripViewState.copyWith(...)` or like so:`instanceOfTripViewState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TripViewStateCWProxy get copyWith => _$TripViewStateCWProxyImpl(this);
}
