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
    return requestRetrier.scheduleRequestRetry(err.request);
  }
}
