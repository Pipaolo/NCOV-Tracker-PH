part of 'notification_bloc.dart';

abstract class NotificationEvent extends Equatable {
  const NotificationEvent();
}

class NotificationConfigured extends NotificationEvent {
  @override
  List<Object> get props => [];
}

class NotificationPressed extends NotificationEvent {
  final String updatedStatistics;
  NotificationPressed({
    this.updatedStatistics,
  });
  @override
  List<Object> get props => [updatedStatistics];
}
