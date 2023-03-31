import 'package:hafizh/common/dependencies/dependencies.dart';
import 'package:hafizh/common/state/view_data_state.dart';
import 'package:hafizh/data/model/validation/auth/confirmed_password.dart';
import 'package:hafizh/data/model/validation/auth/email.dart';
import 'package:hafizh/data/model/validation/auth/password.dart';
import 'package:hafizh/data/model/validation/auth/register_form_state.dart';
import 'package:hafizh/domain/entity/user_entity.dart';
import 'package:hafizh/domain/usecase/authentication/sign_up_with_email_and_password_usecase.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final SignUpWithEmailAndPasswordUseCase _signUpWithEmailAndPasswordUseCase;

  RegisterCubit({
    required SignUpWithEmailAndPasswordUseCase
        signUpWithEmailAndPasswordUseCase,
  })  : _signUpWithEmailAndPasswordUseCase = signUpWithEmailAndPasswordUseCase,
        super(RegisterState(
          registerStatus: ViewData.initial(),
          form: RegisterFormState(),
        ));

  void onEmailChanged(String value) {
    final email = Email.dirty(value);

    emit(state.copyWith(
      form: state.form.copyWith(
        email: email,
      ),
    ));
  }

  void onNameChanged(String value) {
    final name = Name.dirty(value);

    emit(state.copyWith(
      form: state.form.copyWith(
        name: name,
      ),
    ));
  }

  void onPasswordChanged(String value) {
    final password = Password.dirty(value);
    final confirmedPassword = ConfirmedPassword.dirty(
      password: password.value,
      value: state.form.confirmedPassword.value,
    );

    emit(state.copyWith(
      form: state.form.copyWith(
        password: password,
        confirmedPassword: confirmedPassword,
      ),
    ));
  }

  void onConfirmPasswordChanged(String value) {
    final confirmedPassword = ConfirmedPassword.dirty(
      password: state.form.password.value,
      value: value,
    );

    emit(state.copyWith(
      form: state.form.copyWith(
        confirmedPassword: confirmedPassword,
      ),
    ));
  }

  void resetForm() {
    emit(state.copyWith(
      form: RegisterFormState(),
    ));
  }

  Future<void> signUpWithEmailAndPassword(
      {required String email,
      required String name,
      required String password}) async {
    try {
      final isValid = state.form.isValid;
      if (!isValid) return;

      emit(state.copyWith(
          registerStatus: ViewData.loading(message: 'Loading...'),
          form: state.form.copyWith(
            status: FormzSubmissionStatus.inProgress,
          )));

      final response = await _signUpWithEmailAndPasswordUseCase.call(
          email: email, name: name, password: password);

      response.fold((failure) {
        emit(state.copyWith(
            registerStatus: ViewData.error(message: failure.message),
            form: state.form.copyWith(
              status: FormzSubmissionStatus.failure,
            )));
      }, (data) {
        emit(state.copyWith(
            registerStatus: ViewData.loaded(data: data),
            form: state.form.copyWith(
              status: FormzSubmissionStatus.success,
            )));
      });
    } catch (e) {
      emit(state.copyWith(
        registerStatus: ViewData.error(message: e.toString()),
        form: state.form.copyWith(
          status: FormzSubmissionStatus.failure,
        ),
      ));
    }
  }
}
