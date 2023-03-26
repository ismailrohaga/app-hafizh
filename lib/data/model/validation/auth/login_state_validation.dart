import 'package:hafizh/common/dependencies/dependencies.dart';
import 'package:hafizh/data/model/validation/auth/email.dart';
import 'package:hafizh/data/model/validation/auth/password.dart';

class LoginStateValidation with FormzMixin {
  LoginStateValidation({
    Email? email,
    this.password = const Password.pure(),
    this.status = FormzSubmissionStatus.initial,
  }) : email = email ?? const Email.pure();

  final Email email;
  final Password password;
  final FormzSubmissionStatus status;

  LoginStateValidation copyWith({
    Email? email,
    Password? password,
    FormzSubmissionStatus? status,
  }) {
    return LoginStateValidation(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }

  @override
  List<FormzInput<dynamic, dynamic>> get inputs => [email, password];
}
