import 'package:bloc_test/bloc_test.dart';
import 'package:ember_trip_view/blocs/trip_view_cubit.dart';
import 'package:ember_trip_view/blocs/trip_view_state.dart';
import 'package:ember_trip_view/models/leg.dart';
import 'package:ember_trip_view/models/location.dart';
import 'package:ember_trip_view/models/quote.dart';
import 'package:ember_trip_view/models/stop.dart';
import 'package:ember_trip_view/models/timing_info.dart';
import 'package:ember_trip_view/models/trip.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../generate_mocks.mocks.dart';

void main() {
  late MockQuoteRepository quoteRepository;
  late MockTripRepository tripRepository;
  late TripViewCubit tripViewCubit;

  final testQuoteA = Quote(
    legs: [
      Leg(
        tripUid: 'tripUidA',
        origin: Location(
          lat: 1,
          lon: 2,
          name: 'name',
          regionName: 'regionName',
        ),
        destination: Location(
          lat: 3,
          lon: 4,
          name: 'name',
          regionName: 'regionName',
        ),
        departure: TimingInfo(
          scheduled: DateTime(2025),
          estimated: null,
          actual: null,
        ),
        arrival: TimingInfo(
          scheduled: DateTime(2026),
          estimated: null,
          actual: null,
        ),
      ),
    ],
  );
  final testQuoteB = Quote(
    legs: [
      Leg(
        tripUid: 'tripUidB',
        origin: Location(
          lat: 1,
          lon: 2,
          name: 'name',
          regionName: 'regionName',
        ),
        destination: Location(
          lat: 3,
          lon: 4,
          name: 'name',
          regionName: 'regionName',
        ),
        departure: TimingInfo(
          scheduled: DateTime(2025),
          estimated: null,
          actual: null,
        ),
        arrival: TimingInfo(
          scheduled: DateTime(2026),
          estimated: null,
          actual: null,
        ),
      ),
    ],
  );
  final testTrip = Trip(
    route: [
      Stop(
        id: 1,
        departure: TimingInfo(
          scheduled: DateTime(2025),
          estimated: null,
          actual: null,
        ),
        arrival: TimingInfo(
          scheduled: DateTime(2026),
          estimated: null,
          actual: null,
        ),
        location: Location(
          lat: 3,
          lon: 4,
          name: 'name',
          regionName: 'regionName',
        ),
      ),
    ],
  );

  setUp(() {
    quoteRepository = MockQuoteRepository();
    tripRepository = MockTripRepository();
    tripViewCubit = TripViewCubit(
      quoteRepository: quoteRepository,
      tripRepository: tripRepository,
    );
  });

  tearDown(() {
    tripViewCubit.close();
  });

  group('TripViewCubit', () {
    blocTest<TripViewCubit, TripViewState>(
      'emits [loading, success] when loadQuotes succeeds',
      build: () {
        when(
          quoteRepository.fetchQuotes(),
        ).thenAnswer((_) async => [testQuoteA, testQuoteB]);
        return tripViewCubit;
      },
      seed: () => TripViewState(isLoading: false),
      act: (cubit) => cubit.loadQuotes(),
      expect:
          () => [
            TripViewState(isLoading: true),
            TripViewState(quotes: [testQuoteA, testQuoteB], hasError: false),
            TripViewState(
              isLoading: false,
              quotes: [testQuoteA, testQuoteB],
              hasError: false,
            ),
          ],
    );

    blocTest<TripViewCubit, TripViewState>(
      'emits [loading, error] when loadQuotes fails',
      build: () {
        when(quoteRepository.fetchQuotes()).thenThrow(Exception());
        return tripViewCubit;
      },
      seed: () => TripViewState(isLoading: false),
      act: (cubit) => cubit.loadQuotes(),
      expect:
          () => [
            TripViewState(isLoading: true),
            TripViewState(hasError: true),
            TripViewState(isLoading: false, hasError: true),
          ],
    );

    blocTest<TripViewCubit, TripViewState>(
      'emits [loading, success] when selectTrip succeeds',
      build: () {
        when(
          tripRepository.fetchTripInfo('trip123'),
        ).thenAnswer((_) async => testTrip);
        return tripViewCubit;
      },
      seed: () => TripViewState(isLoading: false),
      act: (cubit) => cubit.selectTrip('trip123'),
      expect:
          () => [
            TripViewState(isLoading: true),
            TripViewState(selectedTrip: testTrip, hasError: false),
            TripViewState(
              isLoading: false,
              selectedTrip: testTrip,
              hasError: false,
            ),
          ],
    );

    blocTest<TripViewCubit, TripViewState>(
      'emits [loading, error] when selectTrip fails',
      build: () {
        when(
          tripRepository.fetchTripInfo('trip123'),
        ).thenThrow(Exception());
        return tripViewCubit;
      },
      seed: () => TripViewState(isLoading: false),
      act: (cubit) => cubit.selectTrip('trip123'),
      expect:
          () => [
            TripViewState(isLoading: true),
            TripViewState(hasError: true),
            TripViewState(isLoading: false, hasError: true),
          ],
    );
  });
}
