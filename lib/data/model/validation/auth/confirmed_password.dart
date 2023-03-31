import 'package:hafizh/common/dependencies/dependencies.dart';

enum ConfirmedPasswordValidationError { mismatch, empty }

class ConfirmedPassword
    extends FormzInput<String, ConfirmedPasswordValidationError> {
  final String password;

  const ConfirmedPassword.pure({this.password = ''}) : super.pure('');

  const ConfirmedPassword.dirty({required this.password, String value = ''})
      : super.dirty(value);

  @override
  ConfirmedPasswordValidationError? validator(String value) {
    if (value.isEmpty) {
      return ConfirmedPasswordValidationError.empty;
    }
    return password == value ? null : ConfirmedPasswordValidationError.mismatch;
  }
}

extension Explanation on ConfirmedPasswordValidationError {
  String? get text {
    switch (this) {
      case ConfirmedPasswordValidationError.mismatch:
        return 'Passwords must match';
      case ConfirmedPasswordValidationError.empty:
        return 'Please confirm your password';
      default:
        return null;
    }
  }
}
