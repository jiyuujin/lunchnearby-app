import 'dart:html';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:google_maps/google_maps.dart';

import 'map_widget.dart';

MapWidget getMapWidget(LatLng center, Set<Marker> markers) =>
    WebMap(center: center, markers: markers);

class WebMap extends StatefulWidget implements MapWidget {
  const WebMap({Key? key, required this.center, required this.markers})
      : super(key: key);

  final LatLng center;
  final Set<Marker> markers;

  @override
  State<WebMap> createState() => WebMapState();
}

class WebMapState extends State<WebMap> {
  @override
  Widget build(BuildContext context) {
    const String htmlId = 'map';

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(htmlId, (int viewId) {
      final mapOptions = MapOptions()
        ..zoom = 15.0
        ..center = widget.center;

      final elem = DivElement()..id = htmlId;
      // ignore: undefined_method
      final map = GMap(elem, mapOptions);

      map.onCenterChanged.listen((event) {});
      map.onDragstart.listen((event) {});
      map.onDragend.listen((event) {});

      widget.markers.forEach((latlng) {
        Marker(MarkerOptions()
          ..position = latlng as LatLngOrLatLngLiteral?
          ..map = map);
      });

      return elem;
    });
    return HtmlElementView(viewType: htmlId);
  }
}
