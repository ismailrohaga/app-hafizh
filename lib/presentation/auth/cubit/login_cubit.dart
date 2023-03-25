import 'package:hafizh/common/dependencies/dependencies.dart';
import 'package:hafizh/common/state/view_data_state.dart';
import 'package:hafizh/data/model/validation/auth/email.dart';
import 'package:hafizh/data/model/validation/auth/password.dart';
import 'package:hafizh/domain/usecase/authentication/sign_in_with_google_usecase.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final SignInWithGoogleUseCase _signInWithGoogleUseCase;

  LoginCubit({required SignInWithGoogleUseCase signInWithGoogleUseCase})
      : _signInWithGoogleUseCase = signInWithGoogleUseCase,
        super(LoginState(
          viewData: ViewData.initial(),
        ));

  void emailChanged(String value) {
    final email = Email.dirty(value);

    emit(state.copyWith(
      email: email,
      submissionStatus: Formz.validate([state.password, email]),
    ));
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);

    emit(state.copyWith(
      password: password,
      submissionStatus: Formz.validate([state.password, password]),
    ));
  }

  Future<void> signInWithGoogle() async {
    try {
      emit(state.copyWith(
        viewData: ViewData.loading(
          message: "Logging in...",
        ),
      ));

      final result = await _signInWithGoogleUseCase.call();

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
