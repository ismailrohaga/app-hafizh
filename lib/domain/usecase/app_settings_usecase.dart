import 'package:hafizh/domain/entity/setting.dart';
import 'package:hafizh/domain/repo/app_settings_repo.dart';

class AppSettingsUseCase {
  final AppSettingsRepo _appSettingsRepo;

  AppSettingsUseCase(this._appSettingsRepo);

  List<Setting> getSettings() {
    return _appSettingsRepo.getAppSettings();
  }

  Future<Setting> setSettings(String id, Setting newSetting) {
    return _appSettingsRepo.setAppSettings(id, newSetting);
  }
}
