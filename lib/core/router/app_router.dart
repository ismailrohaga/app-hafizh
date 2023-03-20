import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hafizh/common/const/named_routes.dart';
import 'package:hafizh/common/ui/widget/organisms/bottom_nav/scaffold_with_bottom_nav_bar.dart';
import 'package:hafizh/presentation/detail_surah/detail_surah_view.dart';
import 'package:hafizh/presentation/home/home_view.dart';
import 'package:hafizh/presentation/login/login_view.dart';
import 'package:hafizh/presentation/quran/quran_view.dart';
import 'package:hafizh/presentation/settings/settings_view.dart';
import 'package:hafizh/presentation/onboard/onboard_view.dart';
import 'package:hafizh/presentation/splash/splash_view.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter appRouter = GoRouter(
  initialLocation: '/splash-view',
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      name: NamedRoutes.splashView,
      path: '/splash-view',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      name: NamedRoutes.onBoardView,
      path: '/onboard-view',
      builder: (context, state) => const OnBoardView(),
    ),
    GoRoute(
      name: NamedRoutes.loginView,
      path: '/login-view',
      builder: (context, state) => const LoginView(),
    ),
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return OrganismScaffoldWithBottomNavBar(child: child);
      },
      routes: [
        GoRoute(
          name: NamedRoutes.homeView,
          path: '/home-view',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: HomeView()),
        ),
        GoRoute(
          name: NamedRoutes.quranView,
          path: '/quran-view',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: QuranView()),
        ),
        GoRoute(
          name: NamedRoutes.settingsView,
          path: '/settings-view',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: SettingsView()),
        ),
      ],
    ),
    GoRoute(
      name: NamedRoutes.detailSurahView,
      path: '/detail-surah-view',
      builder: (context, state) => const DetailSurahView(),
    ),
  ],
);
