import 'package:flutter/material.dart';
import 'package:hafizh/common/const/const.dart';
import 'package:hafizh/common/dependencies/dependencies.dart';
import 'package:hafizh/common/ui/widget/organisms/organisms.dart';
import 'package:hafizh/presentation/auth/login_view.dart';
import 'package:hafizh/presentation/auth/register_with_email_view.dart';
import 'package:hafizh/presentation/detail_surah/detail_surah_view.dart';
import 'package:hafizh/presentation/home/home_view.dart';
import 'package:hafizh/presentation/auth/login_with_email_view.dart';
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
      path: '/login',
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      name: NamedRoutes.loginWithEmailView,
      path: "/login-with-email-view",
      builder: (context, state) => const LoginWithEmailView(),
    ),
    GoRoute(
      name: NamedRoutes.registerWithEmailView,
      path: "/register-with-email-view",
      builder: (context, state) => const RegisterWithEmailView(),
    ),
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return ScaffoldWithBottomNavBar(child: child);
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
      parentNavigatorKey: _rootNavigatorKey,
      name: NamedRoutes.detailSurahView,
      path: '/detail-surah-view/:id',
      builder: (context, state) => DetailSurahView(
        key: const Key('detail-surah-view'),
        number: int.parse(state.params['id']!),
      ),
    ),
  ],
);
