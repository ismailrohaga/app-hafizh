import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hafizh/common/state/view_data_state.dart';
import 'package:hafizh/domain/usecase/authentication/sign_in_with_google_usecase.dart';
import 'package:hafizh/presentation/login/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final SignInWithGoogleUseCase signInWithGoogleUseCase;

  LoginCubit({required this.signInWithGoogleUseCase})
      : super(LoginState(
          viewData: ViewData.initial(),
        ));

  Future<void> signInWithGoogle() async {
    try {
      emit(state.copyWith(
        viewData: ViewData.loading(
          message: "Logging in...",
        ),
      ));

      final result = await signInWithGoogleUseCase.call();

      result.fold(
          (failure) => emit(state.copyWith(
                message: failure.message,
                viewData: ViewData.error(message: failure.message),
              )),
          (user) => emit(
                state.copyWith(
                    message: "Login successful",
                    viewData: ViewData.loaded(data: user)),
              ));
    } catch (e) {
      emit(state.copyWith(
        message: e.toString(),
        viewData: ViewData.error(message: e.toString()),
      ));
    }
  }
}
