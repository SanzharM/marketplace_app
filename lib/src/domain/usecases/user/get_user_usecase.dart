import 'package:dartz/dartz.dart';
import 'package:marketplace_app/src/common/usecase/failure.dart';
import 'package:marketplace_app/src/common/usecase/usecase.dart';
import 'package:marketplace_app/src/domain/entities/user/user_entity.dart';
import 'package:marketplace_app/src/domain/repositories/user/user_repository.dart';

class GetUserUseCase extends UseCase<UserEntity, void> {
  final UserRepository _repository;

  GetUserUseCase(this._repository);

  @override
  Future<Either<Failure, UserEntity>> call({void params}) {
    return _repository.getUser();
  }
}
