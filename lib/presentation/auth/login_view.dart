import 'package:flutter/material.dart';

import 'package:hafizh/common/const/const.dart';
import 'package:hafizh/common/dependencies/dependencies.dart';
import 'package:hafizh/common/ext/build_context_ext.dart';
import 'package:hafizh/common/provider/preference_settings_provider.dart';
import 'package:hafizh/common/state/view_data_state.dart';
import 'package:hafizh/common/ui/widget/molecules/molecules.dart';

import 'package:hafizh/presentation/auth/cubit/login_cubit.dart';
import 'package:hafizh/presentation/auth/widgets/google_signin_button.dart';
import 'package:hafizh/presentation/auth/widgets/login_bottom_rich_text_widget.dart';
import 'package:hafizh/presentation/auth/widgets/scaffold_login_view_wrapper_widget.dart';
import 'package:hafizh/presentation/auth/widgets/term_of_service_privacy_policy_widget.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldLoginViewWrapperWidget(
      bottomRichText: const LoginBottomRichTextWidget(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Consumer<PreferenceSettingsProvider>(
            builder: (context, preference, __) => Text(
              'Sign In',
              style: context.textTheme.headlineLarge?.copyWith(
                  color:
                      preference.isDarkTheme ? Colors.grey[300] : Colors.black),
            ),
          ),
          SizedBox(height: SpacingConstant.xl),
          const GoogleSignButtonBlocBuilderWidget(),
          SizedBox(height: SpacingConstant.md),
          HafizhButtonWidget(
            text: 'Sign-in with Email',
            onTap: () => context.goNamed(NamedRoutes.loginWithEmailView),
            leftIcon: const Icon(
              Icons.email,
              color: Colors.white,
            ),
          ),
          SizedBox(height: SpacingConstant.xl),
          const TermOfServicePrivacyPolicyWidget(),
        ],
      ),
    );
  }
}

class GoogleSignButtonBlocBuilderWidget extends StatelessWidget {
  const GoogleSignButtonBlocBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
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
  }
}
