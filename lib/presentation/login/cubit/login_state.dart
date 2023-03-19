import 'package:equatable/equatable.dart';
import 'package:hafizh/common/state/view_data_state.dart';

class LoginState extends Equatable {
  final String message;
  final ViewData viewData;

  LoginState({
    ViewData? viewData,
    this.message = '',
  }) : viewData = viewData ?? ViewData.initial();

  @override
  List<Object?> get props => [viewData, message];
}
