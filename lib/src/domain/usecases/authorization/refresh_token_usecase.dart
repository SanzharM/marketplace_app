import 'package:dartz/dartz.dart';
import 'package:marketplace_app/src/common/usecase/failure.dart';
import 'package:marketplace_app/src/common/usecase/usecase.dart';
import 'package:marketplace_app/src/domain/repositories/authorization/authorization_repository.dart';

class RefreshTokenUseCase extends UseCase<void, void> {
  final AuthorizationRepository _repostiory;

  RefreshTokenUseCase(this._repostiory);

  @override
  Future<Either<Failure, void>> call({void params}) {
    return _repostiory.refreshToken();
  }
}
