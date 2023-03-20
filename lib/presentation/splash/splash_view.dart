import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hafizh/common/const/asset_constant.dart';
import 'package:hafizh/common/const/named_routes.dart';
import 'package:hafizh/common/const/spacing_constant.dart';
import 'package:hafizh/common/ext/build_context_ext.dart';
import 'package:hafizh/common/provider/preference_settings_provider.dart';
import 'package:provider/provider.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  // void _handleOnInitialize(
  //     BuildContext context, bool isDoneOnBoard, bool isNotLoggedIn) async {
  //   // TODO: initialize something, such as DB, etc. then remove Future Delayed initialization
  //   Future.delayed(const Duration(seconds: 3)).then(
  //     (_) {
  //       if (!isNotLoggedIn) {
  //         context.go(NamedRoutes.homeView);
  //         return;
  //       }

  //       if (isDoneOnBoard) {
  //         context.go(NamedRoutes.homeView);
  //       } else {
  //         context.go(NamedRoutes.onBoardView);
  //       }
  //     },
  //   );
  // }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 3)).then((_) {
        final prefSetProvider = context.read<PreferenceSettingsProvider>();
        final isDoneOnBoard = prefSetProvider.isDoneOnBoard;
        final user = prefSetProvider.user;

        if (user.isNotEmpty) {
          return context.go(NamedRoutes.homeView);
        }

        if (!isDoneOnBoard) {
          return context.go(NamedRoutes.onBoardView);
        }

        context.go(NamedRoutes.loginView);
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      body: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AssetConstant.hafizhWhiteIcon,
              width: 40,
            ),
            const SizedBox(width: SpacingConstant.xs),
            Text('Hafizh', style: context.textTheme.headlineLarge),
          ],
        ),
      ),
    );
  }
}
