part of 'splash_page_bloc.dart';

abstract class SplashPageState extends Equatable {
  const SplashPageState();
}

class SplashPageInitial extends SplashPageState {
  @override
  List<Object> get props => [];
}

class AppOpenedOnce extends SplashPageState {
  @override
  List<Object> get props => [];
}

class AppNotOpenedOnce extends SplashPageState {
  @override
  List<Object> get props => [];
}
