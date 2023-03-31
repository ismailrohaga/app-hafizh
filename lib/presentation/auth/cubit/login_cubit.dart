import 'package:hafizh/common/dependencies/dependencies.dart';
import 'package:hafizh/common/state/view_data_state.dart';
import 'package:hafizh/data/model/validation/auth/email.dart';
import 'package:hafizh/data/model/validation/auth/login_form_state.dart';
import 'package:hafizh/data/model/validation/auth/password.dart';
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
          loginStatus: ViewData.initial(),
          form: LoginFormState(),
        ));

  void resetForm() {
    emit(LoginState(
      form: LoginFormState(),
    ));
  }

  void onEmailChanged(String value) {
    final email = Email.dirty(value);

    emit(state.copyWith(
      form: state.form.copyWith(email: email),
    ));
  }

  void onPasswordChanged(String value) {
    final password = Password.dirty(value);

    emit(state.copyWith(
      form: state.form.copyWith(password: password),
    ));
  }

  Future<void> signInWithGoogle() async {
    try {
      emit(state.copyWith(
        loginStatus: ViewData.loading(
          message: "Logging in...",
        ),
      ));

      final result = await _signInWithGoogleUseCase.call();

      result.fold((failure) {
        emit(state.copyWith(
          loginStatus: ViewData.error(message: failure.message),
        ));
      }, (user) {
        emit(
          state.copyWith(loginStatus: ViewData.loaded(data: user)),
        );
      });
    } catch (e) {
      emit(state.copyWith(
        loginStatus: ViewData.error(message: e.toString()),
      ));
    }
  }

  Future<void> signWithEmailAndPassword(String email, String password) async {
    try {
      emit(state.copyWith(
        loginStatus: ViewData.loading(
          message: "Logging in...",
        ),
      ));

      final result =
          await _signInWithEmailAndPasswordUseCase.call(email, password);

      result.fold((failure) {
        emit(state.copyWith(
          loginStatus: ViewData.error(message: failure.message),
        ));
      }, (user) {
        emit(
          state.copyWith(loginStatus: ViewData.loaded(data: user)),
        );
      });
    } catch (e) {
      emit(state.copyWith(
        loginStatus: ViewData.error(message: e.toString()),
      ));
    }
  }
}
