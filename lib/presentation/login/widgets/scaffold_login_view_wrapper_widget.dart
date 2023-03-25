import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hafizh/common/const/const.dart';
import 'package:hafizh/common/dependencies/dependencies.dart';
import 'package:hafizh/common/provider/preference_settings_provider.dart';

class ScaffoldLoginViewWrapperWidget extends StatelessWidget {
  final Widget child;

  const ScaffoldLoginViewWrapperWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    var prefsSettingsProvider = context.read<PreferenceSettingsProvider>();

    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: prefsSettingsProvider.isDarkTheme
            ? SystemUiOverlayStyle.light
            : SystemUiOverlayStyle.dark,
        child: Scaffold(
            body: SafeArea(
                child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: ScreenPaddingConstant.vertical,
                      horizontal: ScreenPaddingConstant.horizontal,
                    ),
                    child: child))));
  }
}
