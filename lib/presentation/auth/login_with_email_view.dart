import 'package:flutter/material.dart';
import 'package:hafizh/common/const/const.dart';
import 'package:hafizh/common/dependencies/dependencies.dart';
import 'package:hafizh/common/ext/build_context_ext.dart';
import 'package:hafizh/common/provider/provider.dart';
import 'package:hafizh/common/ui/widget/molecules/button/hafizh_button_widget.dart';

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
  void _onLoginButtonPressed() {}

  @override
  Widget build(BuildContext context) {
    var prefsSettingsProvider = context.read<PreferenceSettingsProvider>();

    return ScaffoldLoginViewWrapperWidget(
        bottomRichText: const LoginBottomRichTextWidget(),
        child: Center(
          child: Column(children: [
            Text(
              'Sign In',
              style: context.textTheme.headlineLarge?.copyWith(
                  color: prefsSettingsProvider.isDarkTheme
                      ? Colors.grey[300]
                      : Colors.black),
            ),
            SizedBox(height: 52.h),
            const EmailTextFieldWidget(),
            SizedBox(height: SpacingConstant.md),
            const PasswordTextFieldWidget(
              labelText: 'Password',
            ),
            SizedBox(height: SpacingConstant.md),
            HafizhButtonWidget(text: "Sign In", onTap: _onLoginButtonPressed),
            SizedBox(height: SpacingConstant.xl),
            const TermOfServicePrivacyPolicyWidget(),
          ]),
        ));
  }
}
