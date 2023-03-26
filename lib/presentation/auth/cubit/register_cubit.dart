import 'package:hafizh/common/dependencies/dependencies.dart';
import 'package:hafizh/common/state/view_data_state.dart';
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
        ));

  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    try {
      emit(state.copyWith(
        registerStatus: ViewData.loading(message: 'Loading...'),
      ));

      final response =
          await _signUpWithEmailAndPasswordUseCase.call(email, password);

      response.fold((failure) {
        print("RegisterCubit signUpWithEmailAndPassword: ${failure.message}");
        emit(state.copyWith(
          registerStatus: ViewData.error(message: failure.message),
        ));
      }, (data) {
        emit(state.copyWith(
          registerStatus: ViewData.loaded(data: data),
        ));
      });
    } catch (e) {
      emit(state.copyWith(
        registerStatus: ViewData.error(message: e.toString()),
      ));
    }
  }
}
