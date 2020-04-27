part of 'notification_bloc.dart';

abstract class NotificationState extends Equatable {
  const NotificationState();
}

class NotificationShownState extends NotificationState {
  final NcovStatisticBasic currentStatistic;
  NotificationShownState({
    this.currentStatistic,
  });
  @override
  List<Object> get props => [currentStatistic];
}

class NotificationIdleState extends NotificationState {
  @override
  List<Object> get props => [];
}
