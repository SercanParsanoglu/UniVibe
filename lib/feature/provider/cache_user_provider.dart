import 'package:flutter/material.dart';
import 'package:uni_social/feature/model/user_model.dart';

import '../cache/hive/hive_cache.dart';

class CacheUserProvider extends ChangeNotifier {
  final HiveCache<UserModel> _hiveManager = HiveCache();
  UserModel? _userDetailData;

  CacheUserProvider() {
    startHive();
  }

  UserModel? get userDetailData => _userDetailData;
  Future<void> startHive() async {
    await _hiveManager.init();
    if (_hiveManager.getValues()!.isNotEmpty) {
      _userDetailData = _hiveManager.getValues()![0];
    }
  }

  Future<void> cleanHive() async {
    await _hiveManager.clearAll();
    _userDetailData = null;
  }

  Future<void> writeHive(UserModel? item) async {
    print("writeee");
    await _hiveManager.putItem(item);
    await refreshHive();
    print("writeee222");
  }

  Future<void> refreshHive() async {
    print(_hiveManager.getValues()?.length);
    // _userDetailData = _hiveManager.getValues()?[0];
    notifyListeners();
  }
}
