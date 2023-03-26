part of 'register_cubit.dart';

class RegisterState extends Equatable {
  final String message;

  const RegisterState({
    this.message = '',
  });

  RegisterState copyWith({
    String? message,
    Email? email,
    Password? password,
    ConfirmedPassword? confirmedPassword,
    bool? submissionStatus,
  }) {
    return RegisterState(
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [
        message,
      ];
}
