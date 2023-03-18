import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hafizh/common/const/asset_constant.dart';
import 'package:hafizh/common/ext/build_context_ext.dart';
import 'package:hafizh/presentation/login/google_signin_button.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: BoxDecoration(
            color: context.colors.background,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 40.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(48.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const Center(
                        child: Image(
                          image: AssetImage(
                            AssetConstant.onBoardImage,
                          ),
                          height: 300.0,
                          width: 300.0,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Text(
                        'Login',
                        style: context.textTheme.headlineMedium,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16.0),
                      Text(
                        'Description',
                        style: context.textTheme.bodyLarge,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16.0),
                // implement firebase
                const GoogleSignInButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
