import 'package:flutter/material.dart';
import 'package:hafizh/common/dependencies/dependencies.dart';
import 'package:hafizh/common/helper/helper.dart';
import 'package:hafizh/common/provider/provider.dart';
import 'package:hafizh/common/ui/app_theme.dart';
import 'package:hafizh/core/router/app_router.dart';
import 'package:hafizh/presentation/bloc/auth/auth_bloc.dart';
import 'package:hafizh/presentation/detail_surah/bloc/detail_surah_bloc.dart';
import 'package:hafizh/presentation/auth/cubit/login_cubit.dart';
import 'package:hafizh/presentation/quran/bloc/quran_bloc.dart';

class Main extends StatelessWidget {
  const Main({super.key});

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
              create: (_) => AuthBloc(authenticationRepository: locator())),
          BlocProvider(
              create: (context) =>
                  LoginCubit(signInWithGoogleUseCase: locator())),
          BlocProvider(create: (_) => QuranBloc(getSurahUsecase: locator())),
          BlocProvider(
              create: (_) => DetailSurahBloc(getDetailSurahUsecase: locator())),
        ],
        child: Consumer<PreferenceSettingsProvider>(
          builder: (context, prefSetProvider, _) {
            return ScreenUtilInit(
              designSize: const Size(390, 844),
              minTextAdapt: true,
              splitScreenMode: true,
              builder: (context, child) => MaterialApp.router(
                title: 'Hafizh',
                theme: prefSetProvider.themeData,
                routerConfig: appRouter,
              ),
            );
          },
        ),
      ),
    );
  }
}
