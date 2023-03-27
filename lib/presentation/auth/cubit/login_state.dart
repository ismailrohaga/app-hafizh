part of 'login_cubit.dart';

class LoginState extends Equatable {
  final String message;
  final ViewData viewData;

  LoginState({
    ViewData? viewData,
    this.message = '',
  }) : viewData = viewData ?? ViewData.initial();

  LoginState copyWith({
    ViewData? viewData,
    String? message,
  }) {
    return LoginState(
      viewData: viewData ?? this.viewData,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [
        viewData,
        message,
      ];
}
