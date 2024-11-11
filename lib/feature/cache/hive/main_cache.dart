part of 'hive_cache.dart';

abstract class ICacheManager<T> {
  final String key = T.toString();
  Box? _box;

  Future<void> init() async {
    registerAdapters();
    if (!(_box?.isOpen ?? false)) {
      _box = await Hive.openBox(key);
    }
  }

  void registerAdapters();

  Future<void> clearAll() async {
    await _box?.clear();
  }

  Future<void> addItems(List<T> items);
  Future<void> addItem(T items);

  Future<void> putItems(List<T> items);

  T? getItem();
  List<dynamic>? getValues();

  Future<void> removeDisk();

  Future<void> putItem(dynamic value);
  Future<void> removeItem(String key);
}



// class UserCacheManager extends ICacheManager<U>
//   UserCacheManager(String key) : super(key);

//   @override
//   Future<void> addItems(List<UserModel> items) async {
//     await _box?.addAll(items);
//   }

//   @override
//   Future<void> putItems(List<UserModel> items) async {
//     await _box?.putAll(Map.fromEntries(items.map((e) => MapEntry(e.id, e))));
//   }

//   @override
//   UserModel? getItem(String key) {
//     return _box?.get(key);
//   }

//   @override
//   Future<void> putItem(String key, UserModel item) async {
//     await _box?.put(key, item);
//   }

//   @override
//   Future<void> removeItem(String key) async {
//     await _box?.delete(key);
//   }

//   @override
//   List<UserModel>? getValues() {
//     return _box?.values.toList();
//   }

//   @override
//   void registerAdapters() {
//     if (!Hive.isAdapterRegistered(HiveConstants.userTypeId)) {
//       Hive.registerAdapter(UserModelAdapter());
//       Hive.registerAdapter(CompanyAdapter());
//     }
//   }
// }