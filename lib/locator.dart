import 'package:ember_trip_view/blocs/trip_view_cubit.dart';
import 'package:ember_trip_view/repositories/quote_repository.dart';
import 'package:ember_trip_view/repositories/trip_repository.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class Locator {
  static void registerDependencies() {
    getIt.registerFactory<TripRepository>(() => TripRepository());
    getIt.registerFactory<QuoteRepository>(() => QuoteRepository());
    getIt.registerLazySingleton<TripViewCubit>(
      () => TripViewCubit(
        quoteRepository: getIt.get(),
        tripRepository: getIt.get(),
      ),
    );
  }
}
