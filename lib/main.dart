import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hafizh/common/dependencies/get_it/get_it.dart';
import 'package:hafizh/common/helper/preference_settings_helper.dart';
import 'package:hafizh/common/provider/preference_settings_provider.dart';
import 'package:hafizh/common/ui/app_theme.dart';
import 'package:hafizh/core/router/app_router.dart';
import 'package:hafizh/presentation/bloc/app_bloc.dart';
import 'package:hafizh/presentation/login/cubit/login_cubit.dart';
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
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (_) => AppBloc(authenticationRepository: locator())),
          BlocProvider(
              create: (context) =>
                  LoginCubit(signInWithGoogleUseCase: locator())),
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
      ),
    );
  }
}
