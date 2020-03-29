part of 'splash_page_bloc.dart';

abstract class SplashPageEvent extends Equatable {
  const SplashPageEvent();
}

class AppStarted extends SplashPageEvent {
  @override
  List<Object> get props => [];
}

class InstanceStored extends SplashPageEvent {
  @override
  List<Object> get props => [];
}
