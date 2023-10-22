import 'package:dartz/dartz.dart';
import 'package:marketplace_app/src/common/usecase/failure.dart';
import 'package:marketplace_app/src/common/usecase/params.dart';
import 'package:marketplace_app/src/common/usecase/usecase.dart';
import 'package:marketplace_app/src/domain/entities/authorization/token_entity.dart';
import 'package:marketplace_app/src/domain/repositories/authorization/authorization_repository.dart';

class RegisterUseCase extends UseCase<TokenEntity, RegisterParams> {
  final AuthorizationRepository _repostiory;

  RegisterUseCase(this._repostiory);

  @override
  Future<Either<Failure, TokenEntity>> call({RegisterParams? params}) {
    if (params == null) {
      throw const UnexpectedFailure(message: 'Provide registration credentials');
    }
    return _repostiory.register(params);
  }
}

class RegisterParams extends UseCaseParams {
  final String username;
  final String password;
  final String email;
  final String firstName;
  final String lastName;

  const RegisterParams({
    required this.username,
    required this.password,
    required this.email,
    required this.firstName,
    required this.lastName,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'password': password,
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
    };
  }
}
