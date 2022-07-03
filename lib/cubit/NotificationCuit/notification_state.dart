part of 'notification_cubit.dart';

@immutable
abstract class NotificationState {}

class NotificationInitial extends NotificationState {}


class NotificationLoadingState extends NotificationState{}
class NotificationSucssesState extends NotificationState{
/*  final NotificationModel notificationModel;

  NotificationSucssesState(this.notificationModel);*/
}
class NotificationErrorState extends NotificationState{}