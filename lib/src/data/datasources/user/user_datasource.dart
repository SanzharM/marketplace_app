import 'package:marketplace_app/src/common/api/api.dart';
import 'package:marketplace_app/src/common/usecase/failure.dart';
import 'package:marketplace_app/src/core/extensions/extensions.dart';
import 'package:marketplace_app/src/core/local_storage/local_storage.dart';
import 'package:marketplace_app/src/data/models/user/user_model.dart';

abstract class UserDatasource {
  Future<UserModel> getUser();
  Future<void> logout();
}

class UserDatasourceImpl extends UserDatasource {
  final Api _api;
  final LocalStorage _storage;

  UserDatasourceImpl(this._api, this._storage);

  @override
  Future<UserModel> getUser() async {
    final response = await _api.get(
      endPoint: ApiEndpoints.getUser,
    );
    if (response.isSuccess && response.isDataMap) {
      final data = response.data as Map<String, dynamic>;
      return UserModel.fromMap(data);
    }

    throw ServerFailure(
      message: '${response.data['error'] ?? response.statusMessage ?? ''}',
    );
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }
}
