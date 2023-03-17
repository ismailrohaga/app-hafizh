import 'package:go_router/go_router.dart';
import 'package:hafizh/common/const/named_routes.dart';
import 'package:hafizh/presentation/detail_surah/detail_surah_view.dart';
import 'package:hafizh/presentation/home/home_view.dart';
import 'package:hafizh/presentation/quran/quran_view.dart';
import 'package:hafizh/presentation/settings/settings_view.dart';
import 'package:hafizh/presentation/splash/onboard_view.dart';
import 'package:hafizh/presentation/splash/splash_view.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: NamedRoutes.splashView,
  routes: [
    GoRoute(
      path: NamedRoutes.splashView,
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: NamedRoutes.onBoardView,
      builder: (context, state) => const OnBoardView(),
    ),
    GoRoute(
      path: NamedRoutes.homeView,
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: NamedRoutes.quranView,
      builder: (context, state) => const QuranView(),
    ),
    GoRoute(
      path: NamedRoutes.detailSurahView,
      builder: (context, state) => const DetailSurahView(),
    ),
    GoRoute(
      path: NamedRoutes.settingsView,
      builder: (context, state) => const SettingsView(),
    ),
  ],
);
