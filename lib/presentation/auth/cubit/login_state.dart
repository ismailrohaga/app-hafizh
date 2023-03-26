part of 'login_cubit.dart';

class LoginState extends Equatable {
  final String message;
  final ViewData viewData;
  final Email email;
  final Password password;
  final bool submissionStatus;

  LoginState({
    ViewData? viewData,
    this.message = '',
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.submissionStatus = false,
  }) : viewData = viewData ?? ViewData.initial();

  LoginState copyWith({
    ViewData? viewData,
    String? message,
    Email? email,
    Password? password,
    bool? submissionStatus,
  }) {
    return LoginState(
      viewData: viewData ?? this.viewData,
      message: message ?? this.message,
      email: email ?? this.email,
      password: password ?? this.password,
      submissionStatus: submissionStatus ?? this.submissionStatus,
    );
  }

  @override
  List<Object?> get props => [
        viewData,
        message,
        email,
        password,
        submissionStatus,
      ];
}
