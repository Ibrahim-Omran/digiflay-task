import 'package:digiflay_task/core/database/api/end_points.dart';
import 'package:dio/dio.dart';

import '../../service/service_locator.dart';
import '../cache/cache_helper.dart';


class ApiInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[ApiKeys.accessToken] = sl<CacheHelper>().getData(key: ApiKeys.accessToken) != null
        ? '${sl<CacheHelper>().getData(key: ApiKeys.accessToken)}'
        : null;
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // TODO: implement onResponse
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // TODO: implement onError
    super.onError(err, handler);
  }
}
