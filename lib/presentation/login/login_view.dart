import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:hafizh/common/const/const.dart';
import 'package:hafizh/common/dependencies/dependencies.dart';
import 'package:hafizh/common/ext/build_context_ext.dart';
import 'package:hafizh/common/provider/preference_settings_provider.dart';
import 'package:hafizh/common/state/view_data_state.dart';
import 'package:hafizh/common/ui/app_colors.dart';
import 'package:hafizh/common/ui/widget/molecules/molecules.dart';
import 'package:hafizh/presentation/login/cubit/login_cubit.dart';
import 'package:hafizh/presentation/login/cubit/login_state.dart';
import 'package:hafizh/presentation/login/widgets/google_signin_button.dart';
import 'package:hafizh/presentation/login/widgets/scaffold_login_view_wrapper_widget.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    var prefsSettingsProvider = context.read<PreferenceSettingsProvider>();

    var googleSignInBloc = BlocConsumer<LoginCubit, LoginState>(
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
          onPressed: () => context.read<LoginCubit>().signInWithGoogle(),
        );
      },
    );

    return ScaffoldLoginViewWrapperWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'Sign In',
            style: context.textTheme.headlineLarge?.copyWith(
                color: prefsSettingsProvider.isDarkTheme
                    ? Colors.grey[300]
                    : Colors.black),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: SpacingConstant.xl),
          googleSignInBloc,
          SizedBox(height: SpacingConstant.md),
          HafizhButtonWidget(
            text: 'Sign-in with Email',
            onTap: () {
              prefsSettingsProvider
                  .enableDarkTheme(!prefsSettingsProvider.isDarkTheme);
            },
            leftIcon: const Icon(
              Icons.email,
              color: Colors.white,
            ),
          ),
          SizedBox(height: SpacingConstant.xl),
          const TermOfServicePrivacyPolicyTextWidget(),
        ],
      ),
    );
  }
}

class TermOfServicePrivacyPolicyTextWidget extends StatelessWidget {
  const TermOfServicePrivacyPolicyTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final prefsSettingsProvider = context.read<PreferenceSettingsProvider>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 52),
      child: Text.rich(
        style: context.textTheme.bodyMedium?.copyWith(
          fontSize: 14.sp,
          color: prefsSettingsProvider.isDarkTheme
              ? Colors.grey[300]
              : AppColors.kDeepGreen,
        ),
        TextSpan(
          text: 'By signing up you are agreeing to our ',
          children: [
            TextSpan(
              text: 'Terms of Service',
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  // TODO: implement onTap for Terms of Service
                },
              style: context.textTheme.bodyMedium?.copyWith(
                color: prefsSettingsProvider.isDarkTheme
                    ? Colors.blueAccent
                    : AppColors.kNormalBlue,
              ),
            ),
            const TextSpan(
              text: ' and ',
            ),
            TextSpan(
              text: 'Privacy Policy',
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  // TODO: implement onTap for Privacy Policy
                },
              style: context.textTheme.bodyMedium?.copyWith(
                color: prefsSettingsProvider.isDarkTheme
                    ? Colors.blueAccent
                    : AppColors.kNormalBlue,
              ),
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
