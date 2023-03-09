import 'package:hafizh/domain/entity/setting.dart';
import 'package:hafizh/domain/repo/app_settings_repo.dart';

class AppSettingsRepoImpl implements AppSettingsRepo {
  @override
  List<Setting> getAppSettings() {
    throw UnimplementedError();
  }

  @override
  Future<Setting> setAppSettings(String id, Setting newSetting) {
    throw UnimplementedError();
  }
}
