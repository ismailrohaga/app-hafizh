import 'package:flutter/material.dart';
import 'package:hafizh/common/provider/preference_settings_provider.dart';
import 'package:hafizh/common/ui/widget/molecules/button/hafizh_button_widget.dart';
import 'package:provider/provider.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PreferenceSettingsProvider>(
        builder: (context, prefSetProvider, _) {
      return Center(
          child: HafizhButtonWidget(
        onTap: () =>
            prefSetProvider.enableDarkTheme(!prefSetProvider.isDarkTheme),
        text: 'Hit me!',
      ));
    });
  }
}
