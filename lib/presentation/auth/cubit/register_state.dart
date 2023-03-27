part of 'register_cubit.dart';

class RegisterState extends Equatable {
  final ViewData<UserEntity> registerStatus;

  RegisterState({
    ViewData<UserEntity>? registerStatus,
  }) : registerStatus = registerStatus ?? ViewData.initial();

  RegisterState copyWith({
    ViewData<UserEntity>? registerStatus,
  }) {
    return RegisterState(
      registerStatus: registerStatus ?? this.registerStatus,
    );
  }

  @override
  List<Object?> get props => [
        registerStatus,
      ];
}
