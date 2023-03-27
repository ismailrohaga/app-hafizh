import 'package:hafizh/common/dependencies/dependencies.dart';
import 'package:hafizh/data/model/validation/auth/confirm_password.dart';
import 'package:hafizh/data/model/validation/auth/email.dart';
import 'package:hafizh/data/model/validation/auth/password.dart';

class RegisterStateValidation with FormzMixin {
  RegisterStateValidation({
    Email? email,
    this.name = const Name.pure(),
    this.password = const Password.pure(),
    this.confirmedPassword = const ConfirmedPassword.pure(),
    this.status = FormzSubmissionStatus.initial,
  }) : email = email ?? const Email.pure();

  final Email email;
  final Name name;
  final Password password;
  final ConfirmedPassword confirmedPassword;
  final FormzSubmissionStatus status;

  RegisterStateValidation copyWith({
    Email? email,
    Name? name,
    Password? password,
    ConfirmedPassword? confirmedPassword,
    FormzSubmissionStatus? status,
  }) {
    return RegisterStateValidation(
      email: email ?? this.email,
      name: name ?? this.name,
      password: password ?? this.password,
      confirmedPassword: confirmedPassword ?? this.confirmedPassword,
      status: status ?? this.status,
    );
  }

  @override
  List<FormzInput<dynamic, dynamic>> get inputs =>
      [email, name, password, confirmedPassword];
}

enum NameValidationError { min, empty }

class Name extends FormzInput<String, NameValidationError> {
  const Name.pure() : super.pure('');

  const Name.dirty([super.value = '']) : super.dirty();

  @override
  NameValidationError? validator(String? value) {
    if (value == null || value.isEmpty) return NameValidationError.empty;
    return value.length < 3 ? NameValidationError.min : null;
  }
}

extension EmailValidationErrorExt on NameValidationError {
  String? get text {
    switch (this) {
      case NameValidationError.min:
        return 'Name must be at least 3 characters';
      case NameValidationError.empty:
        return 'Name cannot be empty';
      default:
        return null;
    }
  }
}
