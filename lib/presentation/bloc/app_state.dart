import 'package:equatable/equatable.dart';
import 'package:hafizh/domain/entity/user_entity.dart';

enum AppStatus {
  authenticated,
  unauthenticated,
}

class AppState extends Equatable {
  final AppStatus status;
  final UserEntity user;

  const AppState._({
    required this.status,
    this.user = UserEntity.empty,
  });

  const AppState.authenticated(UserEntity user)
      : this._(status: AppStatus.authenticated, user: user);

  const AppState.unauthenticated() : this._(status: AppStatus.unauthenticated);

  @override
  List<Object?> get props => throw UnimplementedError();
}
