import 'package:dartz/dartz.dart';
import 'package:marketplace_app/src/common/usecase/failure.dart';
import 'package:marketplace_app/src/common/usecase/params.dart';
import 'package:marketplace_app/src/common/usecase/usecase.dart';
import 'package:marketplace_app/src/domain/entities/authorization/token_entity.dart';
import 'package:marketplace_app/src/domain/repositories/authorization/authorization_repository.dart';

class SaveTokenUseCase extends UseCase<void, SaveTokenParams> {
  final AuthorizationRepository _repository;

  SaveTokenUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call({SaveTokenParams? params}) {
    if (params == null) {
      throw const UnexpectedFailure(message: 'Provide token details');
    }
    return _repository.saveToken(params);
  }
}

class SaveTokenParams extends UseCaseParams {
  final TokenEntity token;

  const SaveTokenParams(this.token);
}
