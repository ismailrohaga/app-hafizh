class Setting {
  SettingType type;
  String? description;
  String? icon;
  String name;

  String get id => "${name.trim().toLowerCase()}-${type.name}";

  Setting({
    required this.type,
    this.description,
    this.icon,
    required this.name,
  });
}

enum SettingType { info, intent, option, toggle }
