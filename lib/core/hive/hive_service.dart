import 'package:flutter/cupertino.dart';
import 'package:hafizh/core/di/di.dart';
import 'package:hafizh/core/hive/base_hive_box.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

final hiveInstance = locator<HiveService>();

final hiveBoxNames = {};

class HiveService {
  ValueNotifier<bool> initializedNotifier = ValueNotifier(false);
  Map<String, BaseHiveBox> boxes = {};

  Future<String> get path async {
    final dir = await getApplicationSupportDirectory();
    return dir.path;
  }

  Future<void> init() async {
    initializedNotifier.value = false;
    final dbPath = await path;
    Hive.init(dbPath);
    _registerAdapters();
    await _initializeBoxes();
    initializedNotifier.value = true;
  }

  void _registerAdapters() {
    // TODO: implement
  }

  Future<void> _initializeBoxes() async {
    // TODO: implement
  }
}
