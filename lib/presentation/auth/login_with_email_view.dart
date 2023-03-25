import 'package:flutter/material.dart';
import 'package:hafizh/common/const/const.dart';
import 'package:hafizh/common/dependencies/dependencies.dart';
import 'package:hafizh/common/ext/build_context_ext.dart';
import 'package:hafizh/common/provider/provider.dart';
import 'package:hafizh/common/ui/widget/molecules/button/hafizh_button_widget.dart';
import 'package:hafizh/data/model/validation/auth/email.dart';
import 'package:hafizh/data/model/validation/auth/password.dart';
import 'package:hafizh/presentation/auth/cubit/login_cubit.dart';

import 'package:hafizh/presentation/auth/widgets/login_bottom_rich_text_widget.dart';
import 'package:hafizh/presentation/auth/widgets/scaffold_login_view_wrapper_widget.dart';
import 'package:hafizh/presentation/auth/widgets/term_of_service_privacy_policy_widget.dart';
import 'package:hafizh/presentation/auth/widgets/texfields/email_text_field_widget.dart';
import 'package:hafizh/presentation/auth/widgets/texfields/password_text_field_widget.dart';

class LoginWithEmailView extends StatefulWidget {
  const LoginWithEmailView({super.key});

  @override
  State<LoginWithEmailView> createState() => _LoginWithEmailViewState();
}

class _LoginWithEmailViewState extends State<LoginWithEmailView> {
  void _onLoginButtonPressed() {
    final submissionStatus = context.read<LoginCubit>().state.submissionStatus;

    if (submissionStatus) {
      // context.read<LoginCubit>().loginWithEmail();

      print('Login with email');
    }
  }

  @override
  Widget build(BuildContext context) {
    var prefsSettingsProvider = context.read<PreferenceSettingsProvider>();

    return ScaffoldLoginViewWrapperWidget(
        bottomRichText: const LoginBottomRichTextWidget(),
        child: BlocBuilder<LoginCubit, LoginState>(builder: (context, state) {
          return Column(children: [
            Text(
              'Sign In',
              style: context.textTheme.headlineLarge?.copyWith(
                  color: prefsSettingsProvider.isDarkTheme
                      ? Colors.grey[300]
                      : Colors.black),
            ),
            SizedBox(height: 52.h),
            EmailTextFieldWidget(
              errorText: state.email.displayError?.text,
              onChanged: (value) =>
                  context.read<LoginCubit>().emailChanged(value),
            ),
            SizedBox(height: SpacingConstant.md),
            PasswordTextFieldWidget(
              labelText: 'Password',
              errorText: state.password.displayError?.text,
              onChanged: (value) =>
                  context.read<LoginCubit>().passwordChanged(value),
            ),
            SizedBox(height: SpacingConstant.md),
            HafizhButtonWidget(
                text: "Sign In",
                disabled: !state.submissionStatus,
                onTap: _onLoginButtonPressed),
            SizedBox(height: SpacingConstant.xl),
            const TermOfServicePrivacyPolicyWidget(),
          ]);
        }));
  }
}
