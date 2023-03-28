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
import 'package:hafizh/data/model/validation/auth/register_form_state.dart';
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

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final registerCubit = context.read<RegisterCubit>();
    registerCubit.resetForm();
  }

  void _onTapRegister() async {
    final registerCubit = context.read<RegisterCubit>();
    final formValues = registerCubit.state.form;

    await registerCubit.signUpWithEmailAndPassword(
        email: formValues.email.value,
        name: formValues.name.value,
        password: formValues.confirmedPassword.value);
  }

  @override
  Widget build(BuildContext context) {
    var prefsSettingsProvider = context.read<PreferenceSettingsProvider>();

    return ScaffoldLoginViewWrapperWidget(
        bottomRichText: const RegisterBottomRichTextWidget(),
        child: BlocConsumer<RegisterCubit, RegisterState>(
            listenWhen: (previous, current) =>
                previous.registerStatus != current.registerStatus,
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
            },
            builder: (context, state) {
              final status = state.registerStatus.status;
              final form = context.read<RegisterCubit>();
              final formState = form.state.form;
              final isValid = formState.isValid;

              return Center(
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
                    TextFormFieldWidget(
                      labelText: 'Email',
                      initialValue: formState.email.value,
                      errorText: formState.email.displayError?.text,
                      onChanged: (value) => form.onEmailChanged(value),
                    ),
                    SizedBox(height: SpacingConstant.md),
                    TextFormFieldWidget(
                      labelText: 'Name',
                      initialValue: formState.name.value,
                      errorText: formState.name.displayError?.text,
                      onChanged: (value) => form.onNameChanged(value),
                    ),
                    SizedBox(height: SpacingConstant.md),
                    PasswordTextFieldWidget(
                      labelText: "Password",
                      initialValue: formState.password.value,
                      errorText: formState.password.displayError?.text,
                      onChanged: (value) => form.onPasswordChanged(value),
                    ),
                    SizedBox(height: SpacingConstant.md),
                    PasswordTextFieldWidget(
                      labelText: "Confirm Password",
                      initialValue: formState.confirmedPassword.value,
                      errorText: formState.confirmedPassword.displayError?.text,
                      onChanged: (value) =>
                          form.onConfirmPasswordChanged(value),
                    ),
                    SizedBox(height: SpacingConstant.md),
                    HafizhButtonWidget(
                        text: "Sign Up",
                        disabled: !isValid,
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
