import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartqueue/cubit/Auth-cubit/states.dart';
import '../../Models/AuthModel.dart';
import '../../database/EndPoint.dart';
import '../../database/DioHelper.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(initialState());

  static AuthCubit get(context) => BlocProvider.of(context);

  AuthModel? authModel;

  void userLogin({
    // ignore: non_constant_identifier_names
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());
    /*String? fcmToken = await FirebaseMessaging.instance.getToken();
    print("fcmToken: ${fcmToken} " );*/
    DioHelper.postData(
      path: LOGIN,
      data: {
        'email': email,
        'password': password,
/*
      'fcm_token': fcmToken,
*/
      },
    ).then((value) {
      // ignore: avoid_print
      // print(value.data);

      authModel = AuthModel.fromJson(value.data);

      emit(LoginSucssesState(authModel!));
    }).catchError((error, trace) {
      print(trace);
      // ignore: avoid_print
      print(error.toString());
      emit(LoginErrorState());
    });
  }

  void userRegister({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) {
    emit(SignUpLoadingState());

    DioHelper.postData(
      path: REGISTER,
      data: {
        'name': name,
        'email': email,
        'phone': phone,
        'password': password,
      },
    ).then((value) {
      // ignore: avoid_print
      print(value.data);
      authModel = AuthModel.fromJson(value.data);
      emit(SignUpSucssesState(authModel!));
    }).catchError((error) {
      // ignore: avoid_print
      print(error.toString());
      emit(SignUpErrorState());
    });
  }
}
