import 'package:marketplace_app/src/common/api/api.dart';
import 'package:marketplace_app/src/common/usecase/failure.dart';
import 'package:marketplace_app/src/core/extensions/extensions.dart';
import 'package:marketplace_app/src/core/local_storage/local_storage.dart';
import 'package:marketplace_app/src/data/models/authorization/token_model.dart';
import 'package:marketplace_app/src/domain/usecases/authorization/login_usecase.dart';
import 'package:marketplace_app/src/domain/usecases/authorization/register_usecase.dart';
import 'package:marketplace_app/src/domain/usecases/authorization/save_token_usecase.dart';

abstract class AuthorizationDatasource {
  Future<void> refreshToken();
  Future<TokenModel> register(RegisterParams params);
  Future<void> saveToken(SaveTokenParams params);
  Future<TokenModel> login(LoginParams params);
}

class AuthorizationDatasourceImpl implements AuthorizationDatasource {
  final Api _api;
  final LocalStorage _storage;

  const AuthorizationDatasourceImpl(this._api, this._storage);

  @override
  Future<void> refreshToken() async {
    String? refresh = (await _storage.getToken())?.refresh;

    final response = await _api.postHTTP(
      endPoint: ApiEndpoints.refreshToken,
      data: refresh,
    );

    if (response.isSuccess) {
      return;
    }

    throw ServerFailure(
      message: response.detail ?? response.statusMessage,
    );
  }

  @override
  Future<TokenModel> register(RegisterParams params) async {
    final response = await _api.postHTTP(
      endPoint: ApiEndpoints.register,
      data: params.toMap(),
    );

    if (response.isNotSuccess || response.data is! Map<String, dynamic>) {
      throw ServerFailure(
        message: response.detail ?? response.statusMessage,
      );
    }

    return TokenModel.fromMap(response.data);
  }

  @override
  Future<void> saveToken(SaveTokenParams params) async {
    return _storage.setToken(
      access: params.token.access,
      refresh: params.token.refresh,
    );
  }

  @override
  Future<TokenModel> login(LoginParams params) async {
    final response = await _api.postHTTP(
      endPoint: ApiEndpoints.login,
      data: params.toMap(),
    );

    if (response.isNotSuccess || response.data is! Map<String, dynamic>) {
      throw ServerFailure(
        message: response.detail ?? response.statusMessage,
      );
    }

    return TokenModel.fromMap(response.data);
  }
}
