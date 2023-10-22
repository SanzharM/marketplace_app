import 'package:dartz/dartz.dart';
import 'package:marketplace_app/src/common/usecase/failure.dart';
import 'package:marketplace_app/src/common/usecase/params.dart';
import 'package:marketplace_app/src/common/usecase/usecase.dart';
import 'package:marketplace_app/src/domain/entities/authorization/token_entity.dart';
import 'package:marketplace_app/src/domain/repositories/authorization/authorization_repository.dart';

class LoginUseCase extends UseCase<TokenEntity, LoginParams> {
  final AuthorizationRepository _repository;

  LoginUseCase(this._repository);

  @override
  Future<Either<Failure, TokenEntity>> call({LoginParams? params}) {
    if (params == null) {
      throw const UnexpectedFailure(message: 'Provide credentials');
    }
    return _repository.login(params);
  }
}

class LoginParams extends UseCaseParams {
  final String username;
  final String password;

  const LoginParams({
    required this.password,
    required this.username,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'password': password,
    };
  }
}
