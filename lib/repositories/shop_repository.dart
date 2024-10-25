import 'package:lunchnearby_app/models/shop_model.dart';
import 'package:lunchnearby_app/supabase/supabase_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'shop_repository.g.dart';

@Riverpod(keepAlive: true)
class ShopRepository extends _$ShopRepository {
  late final SupabaseClient supabaseClient;
  @override
  void build() {
    supabaseClient = ref.read(supabaseRepositoryProvider);
  }

  Stream? stream({
    Shop? condition,
  }) {
    final data = supabaseClient.rpc('nearby_shops',
        params: {'lat': 35.6321071, 'long': 139.7911525}).asStream();

    return data;
  }

  Future<List<Map<String, dynamic>>> select() async {
    final data = await supabaseClient.from('shops').select();
    return data;
  }
}
