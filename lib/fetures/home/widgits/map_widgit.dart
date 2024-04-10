import 'dart:async';

import 'package:among_us_gdsc/core/geolocator_services.dart';
import 'package:among_us_gdsc/provider/marker_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

final mapControllerProvider = Provider<MapController>((ref) => MapController());

class MapWidget extends StatefulWidget {
  const MapWidget({Key? key}) : super(key: key);

  @override
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  List<Marker> markers = [];
  late final MapController _mapController;
  GeolocatorServices geoservices = GeolocatorServices();

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
    _updateLocation();
  }

  Future<void> _updateLocation() async {
    try {
      _mapController.move(
        LatLng(31.7070, 76.5263),
        17,
      );
    } catch (e) {
      print('Error updating location: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: _mapController,
      options: MapOptions(
        interactiveFlags: InteractiveFlag.all &
            ~InteractiveFlag.pinchZoom &
            ~InteractiveFlag.doubleTapZoom,
        center: LatLng(31.7070, 76.5263),
        zoom: 17.5,
      ),
      children: [
        TileLayer(
          urlTemplate:
              'https://api.mapbox.com/styles/v1/harshvss/clur4jhs701dg01pihy490el6/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiaGFyc2h2c3MiLCJhIjoiY2x1cjQ5eTdxMDNxYjJpbjBoM2JwN2llYSJ9.bXR-Xw8Cn0suHXrgG_Sgnw',
          additionalOptions: const {
            'accessToken':
                'pk.eyJ1IjoiaGFyc2h2c3MiLCJhIjoiY2x1cjQ5eTdxMDNxYjJpbjBoM2JwN2llYSJ9.bXR-Xw8Cn0suHXrgG_Sgnw',
          },
        ),
        Consumer(
          builder: (context, ref, child) {
            Timer(const Duration(seconds: 1), () {
              setState(() {
                markers = ref.watch(teamMarkersProvider).values.toList();
              });
            });
            return MarkerLayer(
              markers: markers,
            );
          },
        ),
      ],
      // Other widgets
    );
  }

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }
}
