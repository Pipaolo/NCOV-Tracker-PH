part of 'notification_bloc.dart';

abstract class NotificationState extends Equatable {
  const NotificationState();
}

class NotificationShownState extends NotificationState {
  final NcovStatisticBasic currentStatistic;
  final NcovStatisticBasic prevStatistic;
  NotificationShownState({
    this.currentStatistic,
    this.prevStatistic,
  });
  @override
  List<Object> get props => [currentStatistic, prevStatistic];
}

class NotificationIdleState extends NotificationState {
  @override
  List<Object> get props => [];
}
