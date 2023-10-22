import 'package:marketplace_app/src/domain/entities/authorization/token_entity.dart';

class TokenModel extends TokenEntity {
  const TokenModel({
    super.access,
    super.refresh,
  });

  factory TokenModel.fromMap(Map<String, dynamic> map) {
    return TokenModel(
      access: map['access'] as String?,
      refresh: map['refresh'] as String?,
    );
  }
}
