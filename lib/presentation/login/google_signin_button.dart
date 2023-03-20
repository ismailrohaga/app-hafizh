import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hafizh/common/const/asset_constant.dart';
import 'package:hafizh/common/const/named_routes.dart';
import 'package:hafizh/common/const/spacing_constant.dart';
import 'package:hafizh/common/ext/build_context_ext.dart';
import 'package:hafizh/common/state/view_data_state.dart';
import 'package:hafizh/presentation/login/cubit/login_cubit.dart';
import 'package:hafizh/presentation/login/cubit/login_state.dart';

class GoogleSignInButton extends StatefulWidget {
  const GoogleSignInButton({super.key});

  @override
  State<GoogleSignInButton> createState() => _GoogleSignInButtonState();
}

class _GoogleSignInButtonState extends State<GoogleSignInButton> {
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<LoginCubit>();

    return BlocBuilder<LoginCubit, LoginState>(
      bloc: bloc,
      builder: (context, state) {
        final status = state.viewData.status;

        print(status.toString());

        if (status.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (status.isError) {
          context.scaffoldMessenger
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(state.viewData.message),
              ),
            );
        }

        if (status.isHasData) {
          context.goNamed(NamedRoutes.homeView);
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: SpacingConstant.lg),
          child: OutlinedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.white),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            onPressed: () async => await bloc.signInWithGoogleUseCase(),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Image(
                    image: AssetImage(AssetConstant.googleIcon),
                    height: 22.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'Sign in with Google',
                      style: context.textTheme.titleMedium!
                          .copyWith(color: Colors.black),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
