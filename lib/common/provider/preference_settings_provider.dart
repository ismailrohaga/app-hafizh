import 'package:flutter/material.dart';
import 'package:hafizh/common/helper/preference_settings_helper.dart';
import 'package:hafizh/common/ui/app_theme.dart';

class PreferenceSettingsProvider extends ChangeNotifier {
  late PreferenceSettingsHelper preferenceSettingsHelper;

  PreferenceSettingsProvider({required this.preferenceSettingsHelper}) {
    _getTheme();
    _getIsDoneOnBoard();
  }

  //theme
  bool _isDarkTheme = false;
  bool get isDarkTheme => _isDarkTheme;
  ThemeData get themeData =>
      _isDarkTheme ? AppTheme().darkTheme : AppTheme().lightTheme;

  //onboard
  bool _isDoneOnBoard = false;
  bool get isDoneOnBoard => _isDoneOnBoard;

  void _getTheme() async {
    _isDarkTheme = await preferenceSettingsHelper.isDarkTheme;
    notifyListeners();
  }

  void _getIsDoneOnBoard() async {
    _isDoneOnBoard = await preferenceSettingsHelper.isDoneOnBoard;
    notifyListeners();
  }

  void enableDarkTheme(bool value) {
    preferenceSettingsHelper.setDarkTheme(value);
    _getTheme();
  }

  void markDoneOnBoard(bool value) {
    preferenceSettingsHelper.setDoneOnBoard(value);
    _getIsDoneOnBoard();
  }
}
