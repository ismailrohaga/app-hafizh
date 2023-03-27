import 'package:hafizh/common/dependencies/dependencies.dart';
import 'package:hafizh/domain/entity/user_entity.dart';

class UserDTO {
  final String id;
  final String name;
  final String email;
  final String photo;
  final DateTime createdAt;
  final DateTime updatedAt;

  const UserDTO({
    required this.id,
    required this.name,
    required this.email,
    required this.photo,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserDTO.fromJson(Map<String, dynamic> map) {
    return UserDTO(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      photo: map['photo'],
      createdAt: map['createdAt'].toDate(),
      updatedAt: map['updatedAt'].toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'photo': photo,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory UserDTO.fromFirestore(DocumentSnapshot doc) {
    return UserDTO.fromJson({
      'id': doc.id,
      'name': doc['name'],
      'email': doc['email'],
      'photo': doc['photo'],
      'createdAt': doc['createdAt'],
      'updatedAt': doc['updatedAt'],
    });
  }

  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'photo': photo,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  UserDTO copyWith({
    String? id,
    String? name,
    String? email,
    String? photo,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return UserDTO(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      photo: photo ?? this.photo,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  UserEntity toEntity() {
    return UserEntity(
      id: id,
      name: name,
      email: email,
      photo: photo,
    );
  }

  static UserDTO fromEntity(UserEntity entity) {
    return UserDTO(
      id: entity.id,
      name: entity.name ?? '',
      email: entity.email ?? '',
      photo: entity.photo ?? '',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }
}
