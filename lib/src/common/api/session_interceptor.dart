import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:marketplace_app/src/application.dart';
import 'package:marketplace_app/src/core/app_router/app_router.dart';
import 'package:marketplace_app/src/core/extensions/extensions.dart';
import 'package:marketplace_app/src/core/l10n/l10n_service.dart';
import 'package:marketplace_app/src/core/local_storage/local_storage.dart';
import 'package:marketplace_app/src/service_locator.dart';

class SessionInterceptor extends InterceptorsWrapper {
  SessionInterceptor(this.api);

  final Dio api;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers['Accept'] = 'application/json';

    final token = await const LocalStorage().getToken();
    if (token?.isNotEmpty ?? false) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    final language = await const LocalStorage().getLocale();
    options.headers['language'] = language.languageCode;

    super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      const LocalStorage().setToken(null);
      try {
        sl<AppRouter>().replaceAll(const [
          SplashRoute(),
        ]);
        final context = sl<AppRouter>().navigatorKey.currentContext;
        if (context != null) {
          context.showSnackBar(L10n.current.sessionExpired);
          Application.resetGlobalBlocs(context, resetUserBloc: true);
        }
      } catch (e) {
        debugPrint('Unable to access route or reset global blocks');
      }
    }
    super.onError(err, handler);
  }
}
