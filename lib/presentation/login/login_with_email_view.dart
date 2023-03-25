import 'package:flutter/material.dart';
import 'package:hafizh/common/const/const.dart';
import 'package:hafizh/common/dependencies/dependencies.dart';
import 'package:hafizh/common/ext/build_context_ext.dart';
import 'package:hafizh/common/provider/provider.dart';
import 'package:hafizh/common/ui/widget/molecules/button/hafizh_button_widget.dart';
import 'package:hafizh/presentation/login/widgets/scaffold_login_view_wrapper_widget.dart';
import 'package:hafizh/presentation/login/widgets/term_of_service_privacy_policy_widget.dart';

class LoginWithEmailView extends StatefulWidget {
  const LoginWithEmailView({super.key});

  @override
  State<LoginWithEmailView> createState() => _LoginWithEmailViewState();
}

class _LoginWithEmailViewState extends State<LoginWithEmailView> {
  @override
  Widget build(BuildContext context) {
    var prefsSettingsProvider = context.read<PreferenceSettingsProvider>();

    return ScaffoldLoginViewWrapperWidget(
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
        const TextField(
          decoration: InputDecoration(
            labelText: 'Email',
          ),
        ),
        SizedBox(height: SpacingConstant.md),
        TextField(
          obscureText: true,
          style: context.textTheme.bodyLarge?.copyWith(
            color: Colors.black,
          ),
          decoration: InputDecoration(
            labelText: 'Password',
            suffixIcon: SizedBox(
              width: 22.w,
              height: 15.h,
              child: IconButton(
                  splashRadius: 16.w,
                  onPressed: () {},
                  icon: const Icon(Icons.remove_red_eye)),
            ),
          ),
        ),
        SizedBox(height: SpacingConstant.md),
        HafizhButtonWidget(text: "Sign In", onTap: () {}),
        SizedBox(height: SpacingConstant.xl),
        const TermOfServicePrivacyPolicyWidget(),
      ]),
    ));
  }
}
