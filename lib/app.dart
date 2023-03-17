import 'package:flutter/material.dart';
import 'package:hafizh/common/helper/preference_settings_helper.dart';
import 'package:hafizh/common/provider/preference_settings_provider.dart';
import 'package:hafizh/common/ui/app_theme.dart';
import 'package:hafizh/core/router/app_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class App extends StatelessWidget {
  const App({super.key});

  AppTheme get theme => AppTheme();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PreferenceSettingsProvider(
            preferenceSettingsHelper: PreferenceSettingsHelper(
              sharedPreferences: SharedPreferences.getInstance(),
            ),
          ),
        ),
      ],
      child: Consumer<PreferenceSettingsProvider>(
        builder: (context, prefSetProvider, _) {
          return MaterialApp.router(
            title: 'Hafizh',
            theme: prefSetProvider.themeData,
            routerConfig: appRouter,
          );
        },
      ),
    );
  }
}
