import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lunchnearby_app/constants.dart';
import 'package:lunchnearby_app/repositories/shop_repository.dart';
import 'package:lunchnearby_app/utils.dart';
import 'package:url_launcher/url_launcher.dart';

class ShopsListPage extends HookConsumerWidget {
  ShopsListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shopRepositoryNotifier = ref.read(shopRepositoryProvider.notifier);
    final shopStream = shopRepositoryNotifier.stream();

    return Scaffold(
      appBar: AppBar(
        title: const Text('$position周辺のランチマップ'),
      ),
      body: StreamBuilder<dynamic>(
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
            return CustomScrollView(
              slivers: <Widget>[
                SliverFixedExtentList(
                  itemExtent: 75.0,
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return ListTile(
                        title: Text(
                          shops[index]['name'],
                          style: const TextStyle(
                            fontFamily: 'OpenSans',
                            fontSize: 18,
                            height: 1.8,
                            letterSpacing: .3,
                            color: Color(0xff083e64),
                          ),
                        ),
                        trailing: Column(
                          children: [
                            Text(
                              '徒歩${((shops[index]['dist_meters'] / 1000 / 4 * 60).ceil()).toString()}分',
                              style: const TextStyle(
                                fontFamily: 'OpenSans',
                                fontSize: 16,
                                height: 1.8,
                                letterSpacing: .2,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff083e64),
                              ),
                            ),
                            Text(
                              '(${shops[index]['dist_meters'].toString()}m)',
                              style: const TextStyle(
                                fontFamily: 'Oswald',
                                fontSize: 11,
                                height: 1,
                                letterSpacing: .1,
                                color: Color(0xffafafaf),
                              ),
                            ),
                          ],
                        ),
                        onTap: () async => await launchUrl(Uri.parse(
                            'https://www.google.com/maps/search/${shops[index]['name']}/@${pointToLatLng(shops[index]['location'])['latitude']},${pointToLatLng(shops[index]['location'])['longitude']},16z')),
                      );
                    },
                    childCount: shops.length,
                  ),
                ),
              ],
            );
          }),
    );
  }
}
