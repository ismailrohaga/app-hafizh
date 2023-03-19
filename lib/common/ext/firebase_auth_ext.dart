import "package:firebase_auth/firebase_auth.dart" as firebase_auth;
import "package:hafizh/domain/entity/user_entity.dart";

extension User on firebase_auth.User {
  UserEntity get toUserEntity {
    return UserEntity(
        id: uid, email: email, name: displayName, photo: photoURL);
  }
}
