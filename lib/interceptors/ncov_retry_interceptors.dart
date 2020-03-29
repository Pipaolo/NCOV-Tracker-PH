import 'dart:io';

import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import 'package:ncov_tracker_ph/retriers/dio_connectivity_request_trier.dart';

class NcovRetryOnConnectionChangeInterceptors extends Interceptor {
  final DioConnectivityRequestRetrier requestRetrier;
  NcovRetryOnConnectionChangeInterceptors({
    @required this.requestRetrier,
  });

  @override
  Future onError(DioError err) async {
    if (_shouldRetry(err)) {
      try {
        return requestRetrier.scheduleRequestRetry(err.request);
      } catch (e) {
        return e;
      }
    }
    return err;
  }

  bool _shouldRetry(DioError error) {
    return error.type == DioErrorType.DEFAULT &&
        error.type != null &&
        error.error is SocketException;
  }
}
