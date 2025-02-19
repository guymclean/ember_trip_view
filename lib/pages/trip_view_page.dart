import 'package:ember_trip_view/blocs/trip_view_cubit.dart';
import 'package:ember_trip_view/blocs/trip_view_state.dart';
import 'package:ember_trip_view/locator.dart';
import 'package:ember_trip_view/repositories/quote_repository.dart';
import 'package:ember_trip_view/repositories/trip_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class TripViewPage extends StatefulWidget {
  const TripViewPage({super.key});

  @override
  State<TripViewPage> createState() => _TripViewPageState();
}

class _TripViewPageState extends State<TripViewPage> {
  late final mapController = MapController();

  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BlocProvider<TripViewCubit>(
    create: (context) => getIt.get(),
    child: BlocConsumer<TripViewCubit, TripViewState>(
      listener: (context, state) {
        final leg = state.quotes.firstOrNull?.legs.firstOrNull;

        if (leg == null) return;

        mapController.fitCamera(
          CameraFit.bounds(
            bounds: LatLngBounds(
              LatLng(leg.origin.lat, leg.origin.lon),
              LatLng(leg.destination.lat, leg.destination.lon),
            ),
            padding: EdgeInsets.all(20),
          ),
        );
      },
      listenWhen: (previous, current) => previous.trip != current.trip,
      builder:
          (context, state) => Scaffold(
            body: Center(
              child: FlutterMap(
                options: const MapOptions(),
                mapController: mapController,
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'com.example.app',
                  ),
                ],
              ),
            ),
          ),
    ),
  );
}
