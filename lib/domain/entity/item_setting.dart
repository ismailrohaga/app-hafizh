import 'package:hafizh/domain/entity/setting.dart';

class ItemSetting extends Setting {
  bool? enabled;

  ItemSetting({
    required super.name,
    required super.type,
    super.description,
    super.icon,
    this.enabled,
  });
}
