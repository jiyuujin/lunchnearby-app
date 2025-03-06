import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lunchnearby_app/constants.dart';
import 'package:lunchnearby_app/map_widgets/map_widget.dart';
import 'package:lunchnearby_app/repositories/shop_repository.dart';
import 'package:lunchnearby_app/utils.dart';

class MapPage extends HookConsumerWidget {
  MapPage({super.key});

  late GoogleMapController mapController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shopRepositoryNotifier = ref.read(shopRepositoryProvider.notifier);
    final shopStream = shopRepositoryNotifier.stream();

    return StreamBuilder<dynamic>(
      stream: shopStream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final shops = snapshot.data!;
        Set<Marker> markers = {
          ...shops.map((shop) {
            return Marker(
              markerId: MarkerId(shop['id'].toString()),
              position: LatLng(pointToLatLng(shop['location'])['latitude'],
                  pointToLatLng(shop['location'])['longitude'] + 0.0026),
              infoWindow: InfoWindow(title: shop['name'].toString()),
            );
          }),
        };
        return MapWidget(center: centerPos, markers: markers);
      },
    );
  }
}
