import 'package:flutter/material.dart';
import 'package:hafizh/common/const/const.dart';
import 'package:hafizh/common/dependencies/dependencies.dart';
import 'package:hafizh/common/ext/build_context_ext.dart';
import 'package:hafizh/common/provider/provider.dart';
import 'package:hafizh/common/state/view_data_state.dart';
import 'package:hafizh/common/ui/widget/molecules/button/hafizh_button_widget.dart';

import 'package:hafizh/data/model/validation/auth/email.dart';
import 'package:hafizh/data/model/validation/auth/login_state_validation.dart';
import 'package:hafizh/data/model/validation/auth/password.dart';
import 'package:hafizh/presentation/auth/cubit/login_cubit.dart';

import 'package:hafizh/presentation/auth/widgets/login_bottom_rich_text_widget.dart';
import 'package:hafizh/presentation/auth/widgets/scaffold_login_view_wrapper_widget.dart';
import 'package:hafizh/presentation/auth/widgets/term_of_service_privacy_policy_widget.dart';
import 'package:hafizh/presentation/auth/widgets/texfields/text_form_field_widget.dart';
import 'package:hafizh/presentation/auth/widgets/texfields/password_text_field_widget.dart';

class LoginWithEmailView extends StatefulWidget {
  const LoginWithEmailView({super.key});

  @override
  State<LoginWithEmailView> createState() => _LoginWithEmailViewState();
}

class _LoginWithEmailViewState extends State<LoginWithEmailView> {
  final _formKey = GlobalKey<FormState>();

  LoginStateValidation _state = LoginStateValidation();

  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();

    _emailController = TextEditingController()..addListener(_onEmailChanged);
    _passwordController = TextEditingController()
      ..addListener(_onPasswordChanged);
  }

  @override
  void dispose() {
    super.dispose();

    _emailController.dispose();
    _passwordController.dispose();
  }

  void _onEmailChanged() {
    setState(() {
      _state = _state.copyWith(email: Email.dirty(_emailController.text));
    });
  }

  void _onPasswordChanged() {
    setState(() {
      _state =
          _state.copyWith(password: Password.dirty(_passwordController.text));
    });
  }

  void _onRegisterTap() async {
    final isValid = Formz.validate([
      _state.email,
      _state.password,
    ]);

    if (!_formKey.currentState!.validate() || !isValid) {
      return;
    }

    final loginCubit = context.read<LoginCubit>();
    await loginCubit.signWithEmailAndPassword(
        _emailController.text, _passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    var prefsSettingsProvider = context.read<PreferenceSettingsProvider>();

    return ScaffoldLoginViewWrapperWidget(
        bottomRichText: const LoginBottomRichTextWidget(),
        child: BlocConsumer<LoginCubit, LoginState>(listener: (context, state) {
          final status = state.viewData.status;
          final message = state.viewData.message;

          if (status.isError) {
            context.scaffoldMessenger.showSnackBar(
              SnackBar(
                content: Text(message),
                backgroundColor: context.colors.primary,
              ),
            );
          }

          if (status.isHasData) {
            context.scaffoldMessenger.showSnackBar(
              SnackBar(
                content: Text(message),
              ),
            );

            context.goNamed(NamedRoutes.homeView);
          }
        }, builder: (context, state) {
          return Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(children: [
              Text(
                'Sign In',
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
              ),
              SizedBox(height: SpacingConstant.md),
              PasswordTextFieldWidget(
                controller: _passwordController,
                labelText: 'Password',
                validator: (_) => _state.password.displayError?.text,
              ),
              SizedBox(height: SpacingConstant.md),
              HafizhButtonWidget(
                text: "Sign In",
                loading: state.viewData.status.isLoading,
                onTap: _onRegisterTap,
                disabled: _formKey.currentState?.validate() == false,
              ),
              SizedBox(height: SpacingConstant.xl),
              const TermOfServicePrivacyPolicyWidget(),
            ]),
          );
        }));
  }
}
