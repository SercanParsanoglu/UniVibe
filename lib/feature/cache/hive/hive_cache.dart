import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uni_social/feature/model/user_model.dart';

import 'hive_type_ids.dart';

part 'main_cache.dart';

class HiveCache<T> extends ICacheManager<T> {
  @override
  Future<void> addItems(List<T> model) async {
    await _box?.addAll(model);
  }

  @override
  Future<void> putItems(List<T> items) async {
    // await _box?.putAll(Map.fromEntries(items.map((e) => MapEntry(e, e))));
  }

  @override
  T? getItem({String? key}) {
    var keyy = key ?? super.key;
    return _box?.get(keyy);
  }

  @override
  Future<void> putItem(dynamic item, {String? key}) async {
    var keyy = key ?? super.key;
    print('Hive putItem keyy: $keyy');
    await _box?.put(keyy, item);
  }

  @override
  Future<void> removeItem(String key) async {
    await _box?.delete(key);
  }

  @override
  List<dynamic>? getValues() {
    return _box?.values.toList();
  }

  @override
  Future<void> addItem(T items) async {
    await _box?.add(items);
  }

  @override
  Future<void> removeDisk() async {
    await _box?.deleteFromDisk();
  }

  @override
  void registerAdapters() {
    print("register adapter");
    if (!Hive.isAdapterRegistered(HiveConstants.userHiveId)) {
      Hive.registerAdapter((UserModelAdapter()));
      // Hive.registerAdapter(GetAssetsModelResAdapter());
      // Hive.registerAdapter(ProfileImageAdapter());
      // Hive.registerAdapter(IconsAdapter());
      // Hive.registerAdapter(JpgIconsAdapter());
      // Hive.registerAdapter(PngIconsAdapter());
      // Hive.registerAdapter(SvgIconsAdapter());
      // Hive.registerAdapter(IcoIconsAdapter());
      // Hive.registerAdapter(LogosAdapter());
      // Hive.registerAdapter(JpgLogosAdapter());
      // Hive.registerAdapter(PngLogosAdapter());
      // Hive.registerAdapter(SvgLogosAdapter());
      // Hive.registerAdapter(IcoLogosAdapter());
      // Hive.registerAdapter(AssetsAdapter());
      // Hive.registerAdapter(JpgAssetsAdapter());
      // Hive.registerAdapter(PngAssetsAdapter());
      // Hive.registerAdapter(SvgAssetsAdapter());
      // Hive.registerAdapter(IcoAssetsAdapter());
      // Hive.registerAdapter(UserImagesAdapter());
      // Hive.registerAdapter(VenueImagesAdapter());
      // Hive.registerAdapter(CompanyImagesAdapter());
      // Hive.registerAdapter(NullImagesAdapter());
      // Hive.registerAdapter(CompanyAddReviewCacheModelAdapter());
      // Hive.registerAdapter(CompanyReviewViewStatusAdapter());
      // Hive.registerAdapter(BrandAddReviewCacheModelAdapter());
      // Hive.registerAdapter(BrandReviewViewStatusAdapter());
      // Hive.registerAdapter(BusinessCacheModelAdapter());
      // Hive.registerAdapter(ReviewCacheModelAdapter());
      // Hive.registerAdapter(AdressModelAdapter());
      // Hive.registerAdapter(ReviewUpdateBrandCacheAdapter());
      // Hive.registerAdapter(BrandRegistrationDetailCacheAdapter());
      // Hive.registerAdapter(ReviewUpdateCompanyCacheAdapter());
    }
  }
}
