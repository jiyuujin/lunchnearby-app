import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'map_widget.dart';

MapWidget getMapWidget(LatLng center, Set<Marker> markers) =>
    MobileMap(center: center, markers: markers);

class MobileMap extends StatefulWidget implements MapWidget {
  const MobileMap({Key? key, required this.center, required this.markers})
      : super(key: key);

  final LatLng center;
  final Set<Marker> markers;

  @override
  State<MobileMap> createState() => MobileMapState();
}

class MobileMapState extends State<MobileMap> {
  final Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      markers: widget.markers,
      initialCameraPosition: CameraPosition(target: widget.center, zoom: 15),
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    );
  }
}
