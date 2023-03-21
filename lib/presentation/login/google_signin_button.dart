import 'package:flutter/material.dart';
import 'package:hafizh/common/const/asset_constant.dart';
import 'package:hafizh/common/const/spacing_constant.dart';
import 'package:hafizh/common/ext/build_context_ext.dart';

class GoogleSignInButton extends StatelessWidget {
  final Function()? onPressed;
  final bool loading;

  const GoogleSignInButton({super.key, this.onPressed, this.loading = false});

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
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
        onPressed: onPressed,
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

    // return BlocListener<LoginCubit, LoginState>(
    //   listener: (context, state) {
    //     final status = state.viewData.status;
    //     final message = state.message;

    //     if (status.isError) {
    //       context.scaffoldMessenger.showSnackBar(
    //         SnackBar(
    //           backgroundColor: context.colors.primary,
    //           content: Text(message.toString()),
    //         ),
    //       );
    //     }

    //     if (status.isHasData) {
    //       context.scaffoldMessenger.showSnackBar(
    //         SnackBar(
    //           backgroundColor: context.colors.background,
    //           content: Text(message.toString()),
    //         ),
    //       );

    //       context.goNamed(NamedRoutes.homeView);
    //     }
    //   },
    //   child: BlocBuilder<LoginCubit, LoginState>(
    //     bloc: bloc,
    //     builder: (context, state) {
    //       final status = state.viewData.status;

    //       if (status.isLoading) {
    //         return const Center(
    //           child: CircularProgressIndicator(),
    //         );
    //       }

    //       return Padding(
    //         padding: const EdgeInsets.symmetric(horizontal: SpacingConstant.lg),
    //         child: OutlinedButton(
    //           style: ButtonStyle(
    //             backgroundColor: MaterialStateProperty.all(Colors.white),
    //             shape: MaterialStateProperty.all(
    //               RoundedRectangleBorder(
    //                 borderRadius: BorderRadius.circular(12),
    //               ),
    //             ),
    //           ),
    //           onPressed: () => context.read<LoginCubit>().signInWithGoogle(),
    //           child: Padding(
    //             padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
    //             child: Row(
    //               mainAxisSize: MainAxisSize.min,
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               children: <Widget>[
    //                 const Image(
    //                   image: AssetImage(AssetConstant.googleIcon),
    //                   height: 22.0,
    //                 ),
    //                 Padding(
    //                   padding: const EdgeInsets.only(left: 10),
    //                   child: Text(
    //                     'Sign in with Google',
    //                     style: context.textTheme.titleMedium!
    //                         .copyWith(color: Colors.black),
    //                   ),
    //                 )
    //               ],
    //             ),
    //           ),
    //         ),
    //       );
    //     },
    //   ),
    // );
  }
}
