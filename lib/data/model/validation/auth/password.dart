import 'package:hafizh/common/dependencies/dependencies.dart';

/// Validation errors for the [Password] [FormzInput].
enum PasswordValidationError {
  /// Generic invalid error.
  invalid,
  empty
}

/// {@template password}
/// Form input for an password input.
/// {@endtemplate}
class Password extends FormzInput<String, PasswordValidationError> {
  /// {@macro password}
  const Password.pure() : super.pure('');

  /// {@macro password}
  const Password.dirty([super.value = '']) : super.dirty();

  static final _passwordRegExp =
      RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');

  @override
  PasswordValidationError? validator(String? value) {
    if (value == null || value.isEmpty) return PasswordValidationError.empty;

    return _passwordRegExp.hasMatch(value)
        ? null
        : PasswordValidationError.invalid;
  }
}

extension PasswordValidationErrorExt on PasswordValidationError {
  String get text {
    switch (this) {
      case PasswordValidationError.invalid:
        return 'Invalid password format (min 8 characters, at least 1 letter and 1 number)';
      case PasswordValidationError.empty:
        return 'Password cannot be empty';
    }
  }
}
