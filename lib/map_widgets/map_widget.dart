import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'map_widget_stub.dart'
    // use web_map_widget.dart if dart:html is available
    if (dart.library.html) 'mob_map_widget.dart'
    if (dart.library.io) 'mob_map_widget.dart';

abstract class MapWidget extends StatefulWidget {
  factory MapWidget({required LatLng center, required Set<Marker> markers}) =>
      getMapWidget(center, markers);
}
