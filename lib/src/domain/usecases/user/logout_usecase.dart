import 'package:dartz/dartz.dart';
import 'package:marketplace_app/src/common/usecase/failure.dart';
import 'package:marketplace_app/src/common/usecase/usecase.dart';
import 'package:marketplace_app/src/domain/repositories/user/user_repository.dart';

class LogoutUseCase extends UseCase<void, void> {
  final UserRepository _repository;

  LogoutUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call({void params}) {
    return _repository.logout();
  }
}
