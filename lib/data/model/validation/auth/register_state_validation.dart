import 'package:hafizh/common/dependencies/dependencies.dart';
import 'package:hafizh/data/model/validation/auth/confirm_password.dart';
import 'package:hafizh/data/model/validation/auth/email.dart';
import 'package:hafizh/data/model/validation/auth/password.dart';

class RegisterStateValidation with FormzMixin {
  RegisterStateValidation({
    Email? email,
    this.password = const Password.pure(),
    this.confirmedPassword = const ConfirmedPassword.pure(),
    this.status = FormzSubmissionStatus.initial,
  }) : email = email ?? const Email.pure();

  final Email email;
  final Password password;
  final ConfirmedPassword confirmedPassword;
  final FormzSubmissionStatus status;

  RegisterStateValidation copyWith({
    Email? email,
    Password? password,
    ConfirmedPassword? confirmedPassword,
    FormzSubmissionStatus? status,
  }) {
    return RegisterStateValidation(
      email: email ?? this.email,
      password: password ?? this.password,
      confirmedPassword: confirmedPassword ?? this.confirmedPassword,
      status: status ?? this.status,
    );
  }

  @override
  List<FormzInput<dynamic, dynamic>> get inputs =>
      [email, password, confirmedPassword];
}
