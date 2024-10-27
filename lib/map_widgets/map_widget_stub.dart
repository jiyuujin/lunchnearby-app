import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'map_widget.dart';

MapWidget getMapWidget(LatLng center, Set<Marker> markers) =>
    throw UnsupportedError(
        'Cannot create a map widget without dart:html or dart:io');
