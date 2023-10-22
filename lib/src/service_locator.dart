import 'package:get_it/get_it.dart';
import 'package:marketplace_app/src/common/api/api.dart';
import 'package:marketplace_app/src/core/app_router/app_router.dart';
import 'package:marketplace_app/src/core/local_storage/local_storage.dart';

final GetIt sl = GetIt.instance;

Future<void> initialize() async {
  sl
    ..registerLazySingleton<Api>(() => Api())
    ..registerLazySingleton<AppRouter>(() => AppRouter())
    ..registerLazySingleton<LocalStorage>(() => const LocalStorage());
}
