import 'package:hafizh/domain/entity/setting.dart';

abstract class AppSettingsRepo {
  List<Setting> getAppSettings();
  Future<Setting> setAppSettings(String id, Setting newSetting);
}