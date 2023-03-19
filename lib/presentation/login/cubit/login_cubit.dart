import 'package:hafizh/common/dependencies/dependencies.dart';
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
    emit(LoginState(
      viewData: ViewData.loading(message: "Logging in"),
    ));

    final result = await signInWithGoogleUseCase.call();

    result.fold(
        (failure) => emit(LoginState(
              message: failure.message,
              viewData: ViewData.error(message: failure.message),
            )),
        (user) => emit(
              LoginState(
                  message: "Login successful",
                  viewData: ViewData.loaded(data: user)),
            ));
  }
}
