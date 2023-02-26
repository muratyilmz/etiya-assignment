import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';

import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../constant/application_constants.dart';

class CoreDio with DioMixin implements Dio {
  @override
  // ignore: overridden_fields
  final BaseOptions options;

  CoreDio(this.options) {
    options = options;
    interceptors.add(PrettyDioLogger());
    interceptors.add(
      RetryInterceptor(
        dio: this,
        logPrint: print,
        retries: 3,
        retryDelays: const [
          Duration(seconds: 2),
          Duration(seconds: 4),
          Duration(seconds: 10),
        ],
      ),
    );
    httpClientAdapter = DefaultHttpClientAdapter();
  }
}

class NetworkManager {
  final Dio dio = CoreDio(BaseOptions(
    baseUrl: ApplicationConstants.baseUrl,
  ));
}
