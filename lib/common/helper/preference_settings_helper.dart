import 'dart:convert';

import 'package:hafizh/common/dependencies/dependencies.dart';
import 'package:hafizh/domain/entity/user_entity.dart';

class PreferenceSettingsHelper {
  final Future<SharedPreferences> sharedPreferences;

  PreferenceSettingsHelper({required this.sharedPreferences});

  static const darkTheme = 'dark_theme';
  static const doneOnBoard = 'done_on_board';
  static const userKey = "__user__";

  Future<bool> get isDarkTheme async {
    final prefs = await sharedPreferences;
    return prefs.getBool(darkTheme) ?? false;
  }

  Future<UserEntity> get user async {
    final prefs = await sharedPreferences;
    return prefs.getString(userKey) != null
        ? UserEntity.fromJson(
            jsonDecode(prefs.getString(userKey) ?? "{}")
                as Map<String, dynamic>,
          )
        : UserEntity.empty;
  }

  void setDarkTheme(bool value) async {
    final prefs = await sharedPreferences;
    prefs.setBool(darkTheme, value);
  }

  Future<bool> get isDoneOnBoard async {
    final prefs = await sharedPreferences;
    return prefs.getBool(doneOnBoard) ?? false;
  }

  void setDoneOnBoard(bool value) async {
    final prefs = await sharedPreferences;
    prefs.setBool(doneOnBoard, value);
  }

  void setUser(UserEntity user) async {
    final prefs = await sharedPreferences;
    prefs.setString(userKey, jsonEncode(user.toJson()));
  }
}
