import 'package:hafizh/domain/entity/item_setting.dart';
import 'package:hafizh/domain/entity/setting.dart';

class AppSettings extends Setting {
  List<ItemSetting>? itemSettings;

  AppSettings({
    required super.name,
    required super.type,
    super.description,
    super.icon,
    this.itemSettings,
  });
}
