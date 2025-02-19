import 'package:ember_trip_view/blocs/trip_view_cubit.dart';
import 'package:ember_trip_view/blocs/trip_view_state.dart';
import 'package:ember_trip_view/locator.dart';
import 'package:ember_trip_view/models/quote.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';

class TripViewPage extends StatefulWidget {
  const TripViewPage({super.key});

  @override
  State<TripViewPage> createState() => _TripViewPageState();
}

class _TripViewPageState extends State<TripViewPage> {
  static const codebaseCoords = LatLng(55.94718639564854, -3.201742498213463);
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
      listener: (_, state) => _updateMapBounds(state),
      listenWhen:
          (previous, current) => previous.selectedTrip != current.selectedTrip,
      builder:
          (context, state) => Scaffold(
            body: Stack(
              children: [
                Positioned.fill(
                  child: FlutterMap(
                    options: const MapOptions(initialCenter: codebaseCoords),
                    mapController: mapController,
                    children: [
                      TileLayer(
                        urlTemplate:
                            'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        userAgentPackageName: 'com.example.app',
                      ),
                      MarkerLayer(markers: _getStopMapMarkers(state)),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    margin: EdgeInsets.fromLTRB(16, 50, 16, 0),
                    padding: EdgeInsets.all(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        DropdownMenu(
                          width: double.infinity,
                          label: Text('Select a departure time'),
                          dropdownMenuEntries: quotes(state.quotes),
                          onSelected: (tripUid) {
                            if (tripUid == null) return;
                            context.read<TripViewCubit>().selectTrip(tripUid);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                if (state.isLoading)
                  Align(
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(),
                  ),
              ],
            ),
          ),
    ),
  );

  List<DropdownMenuEntry<String>> quotes(List<Quote> quotes) =>
      quotes.where((quote) => quote.legs.isNotEmpty).map((quote) {
        final leg = quote.legs.first;
        return DropdownMenuEntry<String>(
          value: leg.tripUid,
          label: DateFormat('HH:mm').format(leg.departure.scheduled),
        );
      }).toList();

  List<Marker> _getStopMapMarkers(TripViewState state) {
    return (state.selectedTrip?.route ?? [])
        .map(
          (stop) => Marker(
            point: LatLng(stop.location.lat, stop.location.lon),
            child: Icon(Icons.place, color: Colors.greenAccent, size: 40),
          ),
        )
        .toList();
  }

  void _updateMapBounds(TripViewState state) {
    final route = state.selectedTrip?.route ?? [];

    if (route.isEmpty) return;

    mapController.fitCamera(
      CameraFit.bounds(
        bounds: LatLngBounds.fromPoints(
          route
              .map((stop) => LatLng(stop.location.lat, stop.location.lon))
              .toList(),
        ),
        padding: EdgeInsets.fromLTRB(50, 200, 50, 50),
      ),
    );
  }
}
