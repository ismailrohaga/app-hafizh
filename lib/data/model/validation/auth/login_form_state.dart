import 'package:hafizh/common/dependencies/dependencies.dart';
import 'package:hafizh/data/model/validation/auth/email.dart';
import 'package:hafizh/data/model/validation/auth/password.dart';

class LoginFormState with FormzMixin {
  LoginFormState({
    Email? email,
    this.password = const Password.pure(),
  }) : email = email ?? const Email.pure();

  final Email email;
  final Password password;

  LoginFormState copyWith({
    Email? email,
    Password? password,
  }) {
    return LoginFormState(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  List<FormzInput<dynamic, dynamic>> get inputs => [email, password];
}
