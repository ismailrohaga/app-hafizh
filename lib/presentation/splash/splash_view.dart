import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hafizh/common/const/asset_constant.dart';
import 'package:hafizh/common/const/named_routes.dart';
import 'package:hafizh/common/ext/build_context_ext.dart';
import 'package:hafizh/common/provider/preference_settings_provider.dart';
import 'package:provider/provider.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  void _handleOnInitialize(BuildContext context, bool isDoneOnBoard) async {
    // TODO: initialize something, such as DB, etc. then remove Future Delayed initialization
    Future.delayed(const Duration(seconds: 3)).then(
      (_) => {
        if (isDoneOnBoard)
          //TODO: check whether the user is logged in
          {context.go(NamedRoutes.homeView)}
        else
          {context.go(NamedRoutes.onBoardView)}
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PreferenceSettingsProvider>(
      builder: (context, prefSetProvider, _) {
        return _StatefulWrapper(
          onInit: () {
            _handleOnInitialize(context, prefSetProvider.isDoneOnBoard);
          },
          child: Scaffold(
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
                  const SizedBox(width: 5.0),
                  Text('Hafizh', style: context.textTheme.headlineLarge),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _StatefulWrapper extends StatefulWidget {
  final Function onInit;
  final Widget child;
  const _StatefulWrapper({required this.onInit, required this.child});

  @override
  State<_StatefulWrapper> createState() => _StatefulWrapperState();
}

class _StatefulWrapperState extends State<_StatefulWrapper> {
  @override
  void initState() {
    widget.onInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
