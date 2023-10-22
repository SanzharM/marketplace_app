import 'package:dartz/dartz.dart';
import 'package:marketplace_app/src/common/usecase/failure.dart';
import 'package:marketplace_app/src/domain/entities/authorization/token_entity.dart';
import 'package:marketplace_app/src/domain/usecases/authorization/login_usecase.dart';
import 'package:marketplace_app/src/domain/usecases/authorization/register_usecase.dart';
import 'package:marketplace_app/src/domain/usecases/authorization/save_token_usecase.dart';

abstract class AuthorizationRepository {
  Future<Either<Failure, TokenEntity>> login(LoginParams params);
  Future<Either<Failure, void>> saveToken(SaveTokenParams params);
  Future<Either<Failure, void>> refreshToken();
  Future<Either<Failure, TokenEntity>> register(RegisterParams params);
}
