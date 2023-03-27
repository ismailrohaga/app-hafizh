import 'package:hafizh/common/dependencies/dependencies.dart';
import 'package:hafizh/common/state/view_data_state.dart';
import 'package:hafizh/domain/usecase/authentication/sign_in_with_email_and_password_usecase.dart';
import 'package:hafizh/domain/usecase/authentication/sign_in_with_google_usecase.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final SignInWithGoogleUseCase _signInWithGoogleUseCase;
  final SignInWithEmailAndPasswordUseCase _signInWithEmailAndPasswordUseCase;

  LoginCubit(
      {required SignInWithGoogleUseCase signInWithGoogleUseCase,
      required SignInWithEmailAndPasswordUseCase
          signInWithEmailAndPasswordUseCase})
      : _signInWithGoogleUseCase = signInWithGoogleUseCase,
        _signInWithEmailAndPasswordUseCase = signInWithEmailAndPasswordUseCase,
        super(LoginState(
          viewData: ViewData.initial(),
        ));

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

  Future<void> signWithEmailAndPassword(String email, String password) async {
    try {
      emit(state.copyWith(
        viewData: ViewData.loading(
          message: "Logging in...",
        ),
      ));

      final result =
          await _signInWithEmailAndPasswordUseCase.call(email, password);

      result.fold((failure) {
        emit(state.copyWith(
          message: failure.message,
          viewData: ViewData.error(message: failure.message),
        ));
      },
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
