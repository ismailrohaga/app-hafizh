import 'package:hafizh/common/dependencies/dependencies.dart';
import 'package:hafizh/data/model/dto/user_dto.dart';

abstract class UserRemoteDataSource {
  Future<void> createUser(UserDTO user);
  Future<void> updateUser(String id, UserDTO user);
  Future<UserDTO> getUserByEmail(String email);
  Future<UserDTO> getUserById(String id);
}

class UserRemoteDataSourceImpl extends UserRemoteDataSource {
  UserRemoteDataSourceImpl({
    required FirebaseFirestore firestore,
  })  : _firestore = firestore,
        super();

  final FirebaseFirestore _firestore;

  @override
  Future<void> createUser(UserDTO user) async {
    try {
      final autoId = _firestore.collection('users').doc().id;
      final payload = user.copyWith(
        id: autoId,
      );

      await _firestore
          .collection('users')
          .doc(autoId)
          .set(payload.toFirestore());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateUser(String id, UserDTO user) async {
    try {
      return await _firestore
          .collection('users')
          .doc(id)
          .update(user.toFirestore());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserDTO> getUserByEmail(String email) async {
    try {
      final snapshot = await _firestore
          .collection('users')
          .where('email', isEqualTo: email)
          .get();

      print(snapshot.docs.toSet());

      if (snapshot.docs.isEmpty) {
        return Future.error('User not found');
      }

      return UserDTO.fromFirestore(snapshot.docs.first);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserDTO> getUserById(String id) async {
    try {
      final snapshot = await _firestore.collection('users').doc(id).get();

      if (!snapshot.exists) {
        return Future.error('User not found');
      }

      return UserDTO.fromFirestore(snapshot);
    } catch (e) {
      rethrow;
    }
  }
}
