part of 'login_cubit.dart';

class LoginState extends Equatable {
  final ViewData loginStatus;
  final LoginFormState form;

  LoginState({
    ViewData? loginStatus,
    LoginFormState? form,
  })  : loginStatus = loginStatus ?? ViewData.initial(),
        form = form ?? LoginFormState();

  LoginState copyWith({
    ViewData? loginStatus,
    LoginFormState? form,
  }) {
    return LoginState(
      loginStatus: loginStatus ?? this.loginStatus,
      form: form ?? this.form,
    );
  }

  @override
  List<Object?> get props => [
        loginStatus,
        form,
      ];
}
