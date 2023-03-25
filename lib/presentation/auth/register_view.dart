import 'package:flutter/material.dart';

import 'package:hafizh/common/const/const.dart';
import 'package:hafizh/common/dependencies/dependencies.dart';
import 'package:hafizh/common/ext/build_context_ext.dart';
import 'package:hafizh/common/provider/preference_settings_provider.dart';
import 'package:hafizh/common/ui/widget/molecules/molecules.dart';
import 'package:hafizh/presentation/auth/widgets/google_signin_button.dart';
import 'package:hafizh/presentation/auth/widgets/register_bottom_rich_text_widget.dart';
import 'package:hafizh/presentation/auth/widgets/scaffold_login_view_wrapper_widget.dart';
import 'package:hafizh/presentation/auth/widgets/term_of_service_privacy_policy_widget.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldLoginViewWrapperWidget(
      bottomRichText: const RegisterBottomRichTextWidget(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Consumer<PreferenceSettingsProvider>(
            builder: (context, preference, __) => Text(
              'Sign Up',
              style: context.textTheme.headlineLarge?.copyWith(
                  color:
                      preference.isDarkTheme ? Colors.grey[300] : Colors.black),
            ),
          ),
          SizedBox(height: SpacingConstant.xl),
          GoogleSignInButton(
            text: 'Sign up with Google',
            onPressed: () {},
          ),
          SizedBox(height: SpacingConstant.md),
          HafizhButtonWidget(
            text: 'Sign-up with Email',
            onTap: () => context.goNamed(NamedRoutes.registerWithEmailView),
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
