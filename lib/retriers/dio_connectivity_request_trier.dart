import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

class DioConnectivityRequestRetrier {
  final Dio dio;
  final Connectivity connectivity;


  DioConnectivityRequestRetrier({
    @required this.dio,
    @required this.connectivity,
  });

  Future<Response> scheduleRequestRetry(RequestOptions options) async {
    StreamSubscription streamSubscription;
    final responseCompleter = Completer<Response>();

    streamSubscription =
        connectivity.onConnectivityChanged.listen((connectivityResult) async {
      if (connectivityResult != ConnectivityResult.none) {
        streamSubscription.cancel();

        dio.request(
          options.path,
          cancelToken: options.cancelToken,
          data: options.data,
          onReceiveProgress: options.onReceiveProgress,
          queryParameters: options.queryParameters,
          options: options,
        );
      }
    });
    return responseCompleter.future;
  }
}
