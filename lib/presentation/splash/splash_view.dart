import 'package:flutter/material.dart';
import 'package:hafizh/common/const/asset_constant.dart';
import 'package:hafizh/common/const/named_routes.dart';
import 'package:hafizh/common/const/spacing_constant.dart';
import 'package:hafizh/common/dependencies/dependencies.dart';
import 'package:hafizh/common/ext/build_context_ext.dart';
import 'package:hafizh/common/provider/preference_settings_provider.dart';

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
  //         context.goNamed(NamedRoutes.homeView);
  //         return;
  //       }

  //       if (isDoneOnBoard) {
  //         context.goNamed(NamedRoutes.homeView);
  //       } else {
  //         context.goNamed(NamedRoutes.onBoardView);
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
          return context.goNamed(NamedRoutes.homeView);
        }

        if (!isDoneOnBoard) {
          return context.goNamed(NamedRoutes.onBoardView);
        }

        context.goNamed(NamedRoutes.loginView);
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      body: Center(
        child: ShowUpAnimation(
          curve: Curves.bounceIn,
          direction: Direction.vertical,
          offset: 0.5,
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
      ),
    );
  }
}
