import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:hafizh/common/const/const.dart';
import 'package:hafizh/common/dependencies/dependencies.dart';
import 'package:hafizh/common/ext/build_context_ext.dart';
import 'package:hafizh/common/state/view_data_state.dart';
import 'package:hafizh/presentation/login/cubit/login_cubit.dart';
import 'package:hafizh/presentation/login/cubit/login_state.dart';
import 'package:hafizh/presentation/login/google_signin_button.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

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
                BlocConsumer<LoginCubit, LoginState>(
                  bloc: context.read<LoginCubit>(),
                  listener: (context, state) {
                    final status = state.viewData.status;
                    final message = state.message;

                    if (status.isError) {
                      context.scaffoldMessenger.showSnackBar(
                        SnackBar(
                          backgroundColor: context.colors.primary,
                          content: Text(message.toString()),
                        ),
                      );
                    }

                    if (status.isHasData) {
                      context.scaffoldMessenger.showSnackBar(
                        SnackBar(
                          backgroundColor: context.colors.background,
                          content: Text(message.toString()),
                        ),
                      );

                      context.goNamed(NamedRoutes.homeView);
                    }
                  },
                  builder: (context, state) {
                    final loading = state.viewData.status.isLoading;

                    return GoogleSignInButton(
                      loading: loading,
                      onPressed: () =>
                          context.read<LoginCubit>().signInWithGoogle(),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
