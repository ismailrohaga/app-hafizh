import 'package:flutter/material.dart';
import 'package:hafizh/common/const/const.dart';
import 'package:hafizh/common/dependencies/dependencies.dart';
import 'package:hafizh/common/ext/build_context_ext.dart';
import 'package:hafizh/common/provider/provider.dart';
import 'package:hafizh/common/ui/widget/molecules/button/hafizh_button_widget.dart';
import 'package:hafizh/data/model/validation/auth/confirm_password.dart';
import 'package:hafizh/data/model/validation/auth/email.dart';
import 'package:hafizh/data/model/validation/auth/password.dart';
import 'package:hafizh/data/model/validation/auth/register_state_validation.dart';

import 'package:hafizh/presentation/auth/widgets/register_bottom_rich_text_widget.dart';
import 'package:hafizh/presentation/auth/widgets/scaffold_login_view_wrapper_widget.dart';
import 'package:hafizh/presentation/auth/widgets/term_of_service_privacy_policy_widget.dart';
import 'package:hafizh/presentation/auth/widgets/texfields/email_text_field_widget.dart';
import 'package:hafizh/presentation/auth/widgets/texfields/password_text_field_widget.dart';

class RegisterWithEmailView extends StatefulWidget {
  const RegisterWithEmailView({super.key});

  @override
  State<RegisterWithEmailView> createState() => _RegisterWithEmailViewState();
}

class _RegisterWithEmailViewState extends State<RegisterWithEmailView> {
  final _formKey = GlobalKey<FormState>();

  RegisterStateValidation _state = RegisterStateValidation();

  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmedPasswordController;

  @override
  initState() {
    super.initState();

    _emailController = TextEditingController()..addListener(_onEmailChanged);
    _passwordController = TextEditingController()
      ..addListener(_onPasswordChanged);
    _confirmedPasswordController = TextEditingController()
      ..addListener(_onConfirmedPasswordChanged);
  }

  @override
  void dispose() {
    super.dispose();

    _emailController.dispose();
    _passwordController.dispose();
    _confirmedPasswordController.dispose();
  }

  void _onEmailChanged() {
    setState(() {
      _state = _state.copyWith(email: Email.dirty(_emailController.text));
    });
  }

  void _onPasswordChanged() {
    setState(() {
      _state = _state.copyWith(
          confirmedPassword: ConfirmedPassword.dirty(
            value: _confirmedPasswordController.text,
            password: _passwordController.text,
          ),
          password: Password.dirty(
            _passwordController.text,
          ));
    });
  }

  void _onConfirmedPasswordChanged() {
    setState(() {
      _state = _state.copyWith(
          confirmedPassword: ConfirmedPassword.dirty(
        value: _confirmedPasswordController.text,
        password: _passwordController.text,
      ));
    });
  }

  void _onTapRegister() {}

  @override
  Widget build(BuildContext context) {
    var prefsSettingsProvider = context.read<PreferenceSettingsProvider>();

    return ScaffoldLoginViewWrapperWidget(
        bottomRichText: const RegisterBottomRichTextWidget(),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(children: [
              Text(
                'Sign Up With Email',
                style: context.textTheme.headlineLarge?.copyWith(
                    color: prefsSettingsProvider.isDarkTheme
                        ? Colors.grey[300]
                        : Colors.black),
              ),
              SizedBox(height: 52.h),
              EmailTextFieldWidget(
                controller: _emailController,
                errorText: _state.email.displayError?.text,
                validator: (_) => _state.email.displayError?.text,
              ),
              SizedBox(height: SpacingConstant.md),
              PasswordTextFieldWidget(
                labelText: "Password",
                controller: _passwordController,
                errorText: _state.password.displayError?.text,
                validator: (_) => _state.password.displayError?.text,
              ),
              SizedBox(height: SpacingConstant.md),
              PasswordTextFieldWidget(
                labelText: "Confirm Password",
                controller: _confirmedPasswordController,
                errorText: _state.confirmedPassword.displayError?.text,
                validator: (_) => _state.confirmedPassword.displayError?.text,
              ),
              SizedBox(height: SpacingConstant.md),
              HafizhButtonWidget(text: "Sign Up", onTap: _onTapRegister),
              SizedBox(height: SpacingConstant.xl),
              const TermOfServicePrivacyPolicyWidget(),
            ]),
          ),
        ));
  }
}
