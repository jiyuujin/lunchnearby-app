import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lunchnearby_app/constants.dart';
import 'package:lunchnearby_app/repositories/shop_repository.dart';

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
                        title: Text(shops[index]['name']),
                        trailing: Text(
                            '徒歩${((shops[index]['dist_meters'] / 1000 / 4 * 60).ceil()).toString()}分'),
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
