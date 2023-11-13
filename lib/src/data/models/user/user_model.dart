import 'package:marketplace_app/src/domain/entities/user/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    super.id,
    super.avatar,
    super.username,
    super.email,
    super.city,
    super.isActive = true,
    super.isAuthorized = false,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: int.tryParse('${map['id']}'),
      avatar: map['avatar'] as String?,
      username: map['username'] as String?,
      email: map['email'] as String?,
      city: map['city'] as dynamic,
      isActive: map['isActive'] ?? false,
      isAuthorized: map['isAuthorized'] ?? false,
    );
  }
}
