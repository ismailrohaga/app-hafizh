import 'package:flutter/material.dart';
import 'package:hafizh/common/const/const.dart';
import 'package:hafizh/common/dependencies/dependencies.dart';
import 'package:hafizh/common/ext/build_context_ext.dart';
import 'package:hafizh/common/provider/provider.dart';
import 'package:hafizh/common/state/view_data_state.dart';
import 'package:hafizh/common/ui/widget/molecules/button/hafizh_button_widget.dart';
import 'package:hafizh/data/model/validation/auth/confirm_password.dart';
import 'package:hafizh/data/model/validation/auth/email.dart';
import 'package:hafizh/data/model/validation/auth/password.dart';
import 'package:hafizh/data/model/validation/auth/register_state_validation.dart';
import 'package:hafizh/presentation/auth/cubit/register_cubit.dart';

import 'package:hafizh/presentation/auth/widgets/register_bottom_rich_text_widget.dart';
import 'package:hafizh/presentation/auth/widgets/scaffold_login_view_wrapper_widget.dart';
import 'package:hafizh/presentation/auth/widgets/term_of_service_privacy_policy_widget.dart';
import 'package:hafizh/presentation/auth/widgets/texfields/text_form_field_widget.dart';
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
  late final TextEditingController _nameController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmedPasswordController;

  @override
  initState() {
    super.initState();

    _emailController = TextEditingController()..addListener(_onEmailChanged);
    _nameController = TextEditingController()..addListener(_onNameChanged);
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

  void _onNameChanged() {
    setState(() {
      _state = _state.copyWith(name: Name.dirty(_nameController.text));
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

  void _onTapRegister() async {
    final isValid = Formz.validate([
      _state.email,
      _state.password,
      _state.confirmedPassword,
    ]);

    if (!_formKey.currentState!.validate() || !isValid) return;

    final registerCubit = context.read<RegisterCubit>();

    var email = _emailController.text;
    var name = _nameController.text;
    var password = _passwordController.text;

    await registerCubit.signUpWithEmailAndPassword(
        email: email, name: name, password: password);
  }

  @override
  Widget build(BuildContext context) {
    var prefsSettingsProvider = context.read<PreferenceSettingsProvider>();

    return ScaffoldLoginViewWrapperWidget(
        bottomRichText: const RegisterBottomRichTextWidget(),
        child: BlocConsumer<RegisterCubit, RegisterState>(
            listener: (context, state) {
          final status = state.registerStatus.status;
          final message = state.registerStatus.message;

          if (status.isError) {
            context.scaffoldMessenger.showSnackBar(
              SnackBar(
                content: Text(message),
                backgroundColor: context.colors.primary,
              ),
            );
          }

          if (status.isHasData) {
            context.goNamed(NamedRoutes.homeView);
          }
        }, builder: (context, state) {
          final status = state.registerStatus.status;

          return Center(
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
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
                TextFormFieldWidget(
                  labelText: 'Email',
                  controller: _emailController,
                  validator: (_) => _state.email.displayError?.text,
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(height: SpacingConstant.md),
                TextFormFieldWidget(
                  labelText: 'Name',
                  controller: _nameController,
                  validator: (_) => _state.name.displayError?.text,
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(height: SpacingConstant.md),
                PasswordTextFieldWidget(
                  labelText: "Password",
                  controller: _passwordController,
                  validator: (_) => _state.password.displayError?.text,
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(height: SpacingConstant.md),
                PasswordTextFieldWidget(
                  labelText: "Confirm Password",
                  controller: _confirmedPasswordController,
                  validator: (_) => _state.confirmedPassword.displayError?.text,
                  textInputAction: TextInputAction.done,
                ),
                SizedBox(height: SpacingConstant.md),
                HafizhButtonWidget(
                    text: "Sign Up",
                    loading: status.isLoading,
                    onTap: _onTapRegister),
                SizedBox(height: SpacingConstant.xl),
                const TermOfServicePrivacyPolicyWidget(),
              ]),
            ),
          );
        }));
  }
}
