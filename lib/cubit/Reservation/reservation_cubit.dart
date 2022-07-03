import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:smartqueue/Models/addReservationModel.dart';
import 'package:smartqueue/database/CacheHelper.dart';
import 'package:smartqueue/modules/HomeScreen/ReservationScreen.dart';

import '../../database/EndPoint.dart';
import '../../database/DioHelper.dart';

part 'reservation_state.dart';

class ReservationCubit extends Cubit<ReservationState> {
  ReservationCubit() : super(ReservationInitial());
  static ReservationCubit post(context) => BlocProvider.of(context);

  ReservationModel? reservationModel;
  void addReservationData(braId, ctx, locatation, servId) {
    emit(ReservationLoadingState());

    DioHelper.postData(
      path: ADDRESERVATION,
      token: '',
      data: FormData.fromMap({
        'user_id': CacheHelper.getData(key: 'id'),
        "branch_id": braId,
        "service_id": servId
      }),
    ).then((value) {
      reservationModel = ReservationModel.fromJson(value.data);
      showAlertDialog(
          reservationModel!.data!, ctx, locatation, reservationModel!.message);
      // emit(ReservationSucssesState());
    }).catchError((error, trace) {
      print(trace);
      print(error.toString());
      // emit(ReservationErrorState());
    });
  }
}
