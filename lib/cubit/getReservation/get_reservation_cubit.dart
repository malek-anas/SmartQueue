import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:smartqueue/Models/getReservationModel.dart';
import 'package:smartqueue/database/CacheHelper.dart';
import '../../Models/getReservationModel.dart';
import '../../database/EndPoint.dart';
import '../../database/DioHelper.dart';
part 'get_reservation_state.dart';

class GetReservationCubit extends Cubit<GetReservationState> {
  GetReservationCubit() : super(GetReservationInitial());

  static GetReservationCubit get(context) => BlocProvider.of(context);

  List<GetReservationModel> reservations = [];

  void getReservationData() {
    emit(GetReservationLoadingState());

    DioHelper.postData(
      path: GETRESERVATIONS,
      data: FormData.fromMap({'user_id': CacheHelper.getData(key: 'id')}),
    ).then((value) {
      var data = json.decode(value.data.substring(22));
      reservations.clear();
      for (var element in data) {
        var getReservationModel = GetReservationModel.fromJson(element);
        reservations.add(getReservationModel);
      }
      emit(GetReservationSucssesState());
    }).catchError((error, trace) {
      print(trace);
      print(error.toString());
      emit(GetReservationErrorState());
    });
  }
}
