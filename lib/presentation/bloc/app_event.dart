import 'package:hafizh/domain/entity/user_entity.dart';

abstract class AppEvent {
  const AppEvent();
}

class AppLogoutRequested extends AppEvent {
  const AppLogoutRequested();
}

class AppUserChanged extends AppEvent {
  final UserEntity user;

  const AppUserChanged(this.user);
}
