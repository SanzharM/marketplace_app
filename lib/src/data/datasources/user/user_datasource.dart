import 'package:marketplace_app/src/common/api/api.dart';
import 'package:marketplace_app/src/common/usecase/failure.dart';
import 'package:marketplace_app/src/core/extensions/extensions.dart';
import 'package:marketplace_app/src/core/local_storage/local_storage.dart';
import 'package:marketplace_app/src/core/utils/utils.dart';
import 'package:marketplace_app/src/data/models/authorization/token_model.dart';
import 'package:marketplace_app/src/data/models/user/user_model.dart';

abstract class UserDatasource {
  Future<UserModel> getUser();
  Future<void> logout();
  Future<TokenModel> refreshToken();
}

class UserDatasourceImpl extends UserDatasource {
  final Api _api;
  final LocalStorage _storage;

  UserDatasourceImpl(this._api, this._storage);

  @override
  Future<UserModel> getUser() async {
    final token = await _storage.getToken();
    final jwt = Utils.parseJwtPayLoad(token?.access ?? '');
    final response = await _api.get(
      endPoint: '${ApiEndpoints.getUser}${jwt['id']}',
    );
    if (response.isSuccess && response.isDataMap) {
      final data = response.data as Map<String, dynamic>;
      return UserModel.fromMap(data);
    }

    throw ServerFailure(
      message: response.detail ?? response.statusMessage,
    );
  }

  @override
  Future<void> logout() async {
    final response = await _api.postHTTP(
      endPoint: ApiEndpoints.logout,
    );
    if (response.statusCode == 201) {
      return;
    }
    throw ServerFailure(
      message: response.detail ?? response.statusMessage,
    );
  }

  @override
  Future<TokenModel> refreshToken() async {
    final response = await _api.postHTTP(
      endPoint: ApiEndpoints.refreshToken,
    );
    if (response.isSuccess && response.isDataMap) {
      return TokenModel.fromMap(response.data);
    }
    throw ServerFailure(
      message: response.detail ?? response.statusMessage,
    );
  }
}
