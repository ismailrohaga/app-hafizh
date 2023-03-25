import 'package:hafizh/common/dependencies/dependencies.dart';

/// Validation errors for the [Email] [FormzInput].
enum EmailValidationError {
  /// Generic invalid error.
  invalid,
  empty
}

/// {@template email}
/// Form input for an email input.
/// {@endtemplate}
class Email extends FormzInput<String, EmailValidationError> {
  /// {@macro email}
  const Email.pure() : super.pure('');

  /// {@macro email}
  const Email.dirty([super.value = '']) : super.dirty();

  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  @override
  EmailValidationError? validator(String? value) {
    if (value == null || value.isEmpty) return EmailValidationError.empty;
    return _emailRegExp.hasMatch(value) ? null : EmailValidationError.invalid;
  }
}

extension EmailValidationErrorExt on EmailValidationError {
  String get text {
    switch (this) {
      case EmailValidationError.invalid:
        return 'Invalid email';
      case EmailValidationError.empty:
        return 'Email cannot be empty';
    }
  }
}
