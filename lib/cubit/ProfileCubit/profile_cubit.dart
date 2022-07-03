import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../Models/ProfileModel.dart';
import '../../database/EndPoint.dart';
import '../../database/DioHelper.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  static ProfileCubit get(context) => BlocProvider.of(context);

  ProfileModel? profileModel;

  void getProfileData() {
    emit(ProfileLoadingState());

    DioHelper.getData(
      path: PROFILE,
    ).then((value) {
      profileModel = ProfileModel.fromJson(value.data);
      emit(ProfileSucssesState(profileModel!));
    }).catchError((error, trace) {
      print(trace);
      print(error.toString());
      emit(ProfileErrorState());
    });
  }
}
