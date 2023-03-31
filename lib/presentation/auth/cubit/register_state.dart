part of 'register_cubit.dart';

class RegisterState extends Equatable {
  final ViewData<UserEntity> registerStatus;
  final RegisterFormState form;

  RegisterState({
    ViewData<UserEntity>? registerStatus,
    RegisterFormState? form,
  })  : registerStatus = registerStatus ?? ViewData.initial(),
        form = form ?? RegisterFormState();

  RegisterState copyWith({
    ViewData<UserEntity>? registerStatus,
    RegisterFormState? form,
  }) {
    return RegisterState(
      registerStatus: registerStatus ?? this.registerStatus,
      form: form ?? this.form,
    );
  }

  @override
  List<Object?> get props => [
        registerStatus,
        form,
      ];
}
