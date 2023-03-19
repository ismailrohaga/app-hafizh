import 'package:flutter/material.dart';
import 'package:hafizh/common/const/const.dart';
import 'package:hafizh/common/dependencies/dependencies.dart';
import 'package:hafizh/common/ui/widget/organisms/bottom_nav/scaffold_with_bottom_nav_bar.dart';
import 'package:hafizh/presentation/detail_surah/detail_surah_view.dart';
import 'package:hafizh/presentation/home/home_view.dart';
import 'package:hafizh/presentation/login/cubit/login_cubit.dart';
import 'package:hafizh/presentation/login/login_view.dart';
import 'package:hafizh/presentation/quran/quran_view.dart';
import 'package:hafizh/presentation/settings/settings_view.dart';
import 'package:hafizh/presentation/onboard/onboard_view.dart';
import 'package:hafizh/presentation/splash/splash_view.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter appRouter = GoRouter(
  initialLocation: NamedRoutes.splashView,
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      name: NamedRoutes.splashView,
      path: NamedRoutes.splashView,
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      name: NamedRoutes.onBoardView,
      path: NamedRoutes.onBoardView,
      builder: (context, state) => const OnBoardView(),
    ),
    GoRoute(
      name: NamedRoutes.loginView,
      path: NamedRoutes.loginView,
      builder: (context, state) => BlocProvider(
          create: (context) => LoginCubit(signInWithGoogleUseCase: locator()),
          child: const LoginView()),
    ),
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return OrganismScaffoldWithBottomNavBar(child: child);
      },
      routes: [
        GoRoute(
          name: NamedRoutes.homeView,
          path: NamedRoutes.homeView,
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: HomeView()),
        ),
        GoRoute(
          name: NamedRoutes.quranView,
          path: NamedRoutes.quranView,
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: QuranView()),
        ),
        GoRoute(
          name: NamedRoutes.settingsView,
          path: NamedRoutes.settingsView,
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: SettingsView()),
        ),
      ],
    ),
    GoRoute(
      name: NamedRoutes.detailSurahView,
      path: NamedRoutes.detailSurahView,
      builder: (context, state) => const DetailSurahView(),
    ),
  ],
);
