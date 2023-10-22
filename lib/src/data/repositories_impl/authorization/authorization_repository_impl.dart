import 'package:dartz/dartz.dart';
import 'package:marketplace_app/src/common/usecase/failure.dart';
import 'package:marketplace_app/src/data/datasources/authorization/authorization_datasource.dart';
import 'package:marketplace_app/src/domain/entities/authorization/token_entity.dart';
import 'package:marketplace_app/src/domain/repositories/authorization/authorization_repository.dart';
import 'package:marketplace_app/src/domain/usecases/authorization/login_usecase.dart';
import 'package:marketplace_app/src/domain/usecases/authorization/register_usecase.dart';
import 'package:marketplace_app/src/domain/usecases/authorization/save_token_usecase.dart';

class AuthorizationRepositoryImpl implements AuthorizationRepository {
  final AuthorizationDatasource _datasource;

  const AuthorizationRepositoryImpl(this._datasource);

  @override
  Future<Either<Failure, TokenEntity>> login(LoginParams params) async {
    try {
      return Right(await _datasource.login(params));
    } on ServerFailure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> refreshToken() async {
    try {
      return Right(await _datasource.refreshToken());
    } on ServerFailure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, TokenEntity>> register(RegisterParams params) async {
    try {
      return Right(await _datasource.register(params));
    } on ServerFailure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> saveToken(SaveTokenParams params) async {
    try {
      return Right(await _datasource.saveToken(params));
    } on ServerFailure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }
}
