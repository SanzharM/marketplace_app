import 'package:get_it/get_it.dart';
import 'package:marketplace_app/src/common/api/api.dart';
import 'package:marketplace_app/src/core/app_router/app_router.dart';
import 'package:marketplace_app/src/core/local_storage/local_storage.dart';
import 'package:marketplace_app/src/data/datasources/authorization/authorization_datasource.dart';
import 'package:marketplace_app/src/data/repositories_impl/authorization/authorization_repository_impl.dart';
import 'package:marketplace_app/src/domain/repositories/authorization/authorization_repository.dart';
import 'package:marketplace_app/src/domain/usecases/authorization/login_usecase.dart';
import 'package:marketplace_app/src/domain/usecases/authorization/refresh_token_usecase.dart';
import 'package:marketplace_app/src/domain/usecases/authorization/register_usecase.dart';
import 'package:marketplace_app/src/domain/usecases/authorization/save_token_usecase.dart';

final GetIt sl = GetIt.instance;

Future<void> initialize() async {
  sl
    ..registerLazySingleton<Api>(() => Api())
    ..registerLazySingleton<AppRouter>(() => AppRouter())
    ..registerLazySingleton<LocalStorage>(() => const LocalStorage())

    // REPOSITORIES
    ..registerLazySingleton<AuthorizationRepository>(
      () => AuthorizationRepositoryImpl(sl()),
    )

    // DATASOURCES
    ..registerLazySingleton<AuthorizationDatasource>(
      () => AuthorizationDatasourceImpl(sl(), sl()),
    )

    // USECASES
    // AUTHORIZATION
    ..registerLazySingleton(
      () => LoginUseCase(sl()),
    )
    ..registerLazySingleton(
      () => RegisterUseCase(sl()),
    )
    ..registerLazySingleton(
      () => RefreshTokenUseCase(sl()),
    )
    ..registerLazySingleton(
      () => SaveTokenUseCase(sl()),
    );
}
