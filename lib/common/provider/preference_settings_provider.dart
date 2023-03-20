import 'package:flutter/material.dart';
import 'package:hafizh/common/helper/preference_settings_helper.dart';
import 'package:hafizh/common/ui/app_theme.dart';
import 'package:hafizh/domain/entity/user_entity.dart';

class PreferenceSettingsProvider extends ChangeNotifier {
  late PreferenceSettingsHelper preferenceSettingsHelper;

  PreferenceSettingsProvider({required this.preferenceSettingsHelper}) {
    _getTheme();
    _getIsDoneOnBoard();
    _getUser();
  }

  //theme
  bool _isDarkTheme = false;
  bool get isDarkTheme => _isDarkTheme;
  ThemeData get themeData =>
      _isDarkTheme ? AppTheme().darkTheme : AppTheme().lightTheme;

  //onboard
  bool _isDoneOnBoard = false;
  bool get isDoneOnBoard => _isDoneOnBoard;

  UserEntity? _user;
  UserEntity get user => _user ?? UserEntity.empty;

  void _getTheme() async {
    _isDarkTheme = await preferenceSettingsHelper.isDarkTheme;
    notifyListeners();
  }

  void _getIsDoneOnBoard() async {
    _isDoneOnBoard = await preferenceSettingsHelper.isDoneOnBoard;
    notifyListeners();
  }

  void _getUser() async {
    _user = await preferenceSettingsHelper.user;
    notifyListeners();
  }

  void enableDarkTheme(bool value) {
    preferenceSettingsHelper.setDarkTheme(value);
    _getTheme();
  }

  void markDoneOnBoard() => preferenceSettingsHelper.setDoneOnBoard(true);

  void setUser(UserEntity user) {
    preferenceSettingsHelper.setUser(user);
    _getUser();
  }
}
