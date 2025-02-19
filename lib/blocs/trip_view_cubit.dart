import 'package:bloc/bloc.dart';
import 'package:ember_trip_view/blocs/trip_view_state.dart';
import 'package:ember_trip_view/repositories/quote_repository.dart';
import 'package:ember_trip_view/repositories/trip_repository.dart';

class TripViewCubit extends Cubit<TripViewState> {
  TripViewCubit({
    required QuoteRepository quoteRepository,
    required TripRepository tripRepository,
  }) : _quoteRepository = quoteRepository,
       _tripRepository = tripRepository,
       super(TripViewState()) {
    loadQuotes();
  }

  final QuoteRepository _quoteRepository;
  final TripRepository _tripRepository;

  Future<void> loadQuotes() async {
    try {
      emit(state.copyWith(isLoading: true));
      final quotes = await _quoteRepository.fetchQuotes();
      emit(state.copyWith(quotes: quotes, hasError: false));
    } catch (_) {
      emit(state.copyWith(hasError: true));
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> selectTrip(String tripUid) async {
    try {
      emit(state.copyWith(isLoading: true));
      final trip = await _tripRepository.fetchTripInfo(tripUid);
      emit(state.copyWith(selectedTrip: trip, hasError: false));
    } catch (_) {
      emit(state.copyWith(hasError: true));
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }
}
