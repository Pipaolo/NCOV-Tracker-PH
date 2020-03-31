import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity/connectivity.dart';

part 'connectivity_event.dart';
part 'connectivity_state.dart';

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  final Connectivity connectivity;
  ConnectivityBloc({
    this.connectivity,
  }) {
    connectivity.onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.wifi ||
          event == ConnectivityResult.mobile) {
        add(ConnectivityEvent.reEstablished);
      } else {
        add(ConnectivityEvent.retry);
      }
    });
  }
  @override
  ConnectivityState get initialState => ConnectivityState.hasInternet;

  @override
  Stream<ConnectivityState> mapEventToState(
    ConnectivityEvent event,
  ) async* {
    switch (event) {
      case ConnectivityEvent.reEstablished:
        yield ConnectivityState.hasInternet;
        break;
      case ConnectivityEvent.retry:
        yield ConnectivityState.noInternet;
        break;
    }
  }
}
