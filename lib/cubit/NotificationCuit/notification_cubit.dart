import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../Models/NotificationModel.dart';
import '../../database/DioHelper.dart';
import '../../database/EndPoint.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationInitial());

  static NotificationCubit get(context) => BlocProvider.of(context);

  List<NotificationModel> notification = [];

  void getNotificationData() {
    emit(NotificationLoadingState());

    DioHelper.postData(
      path: NOTIFICATION,
      data: {},
      //  data: FormData.fromMap({'user_id': CacheHelper.getData(key: 'id')}),
    ).then((value) {
      var data = json.decode(value.data.substring(22));
      notification.clear();
      for (var element in data) {
        notification.add(NotificationModel.fromJson(element));
      }
      emit(NotificationSucssesState());
    }).catchError((error, trace) {
      print(trace);
      print(error.toString());
      emit(NotificationErrorState());
    });
  }
}
