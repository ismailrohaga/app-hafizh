import 'package:flutter/material.dart';
import 'package:hafizh/common/const/const.dart';
import 'package:hafizh/common/dependencies/dependencies.dart';
import 'package:hafizh/common/ext/build_context_ext.dart';
import 'package:hafizh/common/provider/provider.dart';
import 'package:hafizh/common/state/view_data_state.dart';
import 'package:hafizh/common/ui/widget/molecules/button/hafizh_button_widget.dart';
import 'package:hafizh/data/model/validation/auth/email.dart';
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

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final loginCubit = context.read<LoginCubit>();
    loginCubit.resetForm();
  }

  void _onLoginTap() async {
    final loginCubit = context.read<LoginCubit>();
    final formValues = loginCubit.state.form;

    await loginCubit.signWithEmailAndPassword(
        formValues.email.value, formValues.password.value);
  }

  @override
  Widget build(BuildContext context) {
    var prefsSettingsProvider = context.read<PreferenceSettingsProvider>();

    return ScaffoldLoginViewWrapperWidget(
        bottomRichText: const LoginBottomRichTextWidget(),
        child: BlocConsumer<LoginCubit, LoginState>(
            listenWhen: (previous, current) =>
                previous.loginStatus.status != current.loginStatus.status,
            listener: (context, state) {
              final status = state.loginStatus.status;
              final message = state.loginStatus.message;

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
            },
            builder: (context, state) {
              final status = state.loginStatus.status;
              final form = context.read<LoginCubit>();
              final formState = form.state.form;
              final isValid = formState.isValid;

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
                    errorText: formState.email.displayError?.text,
                    onChanged: (value) => form.onEmailChanged(value),
                    // validator: (_) => _state.email.displayError?.text,
                  ),
                  SizedBox(height: SpacingConstant.md),
                  PasswordTextFieldWidget(
                    labelText: 'Password',
                    errorText: formState.password.displayError?.text,
                    initialValue: formState.password.value,
                    onChanged: (value) => form.onPasswordChanged(value),
                    // validator: (_) => _state.password.displayError?.text,
                  ),
                  SizedBox(height: SpacingConstant.md),
                  HafizhButtonWidget(
                    text: "Sign In",
                    onTap: _onLoginTap,
                    disabled: !isValid,
                    loading: status.isLoading,
                    // disabled: _formKey.currentState?.validate() == false,
                  ),
                  SizedBox(height: SpacingConstant.xl),
                  const TermOfServicePrivacyPolicyWidget(),
                ]),
              );
            }));
  }
}
