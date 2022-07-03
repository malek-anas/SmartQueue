import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../Models/Places-Models.dart';
import '../../database/EndPoint.dart';
import '../../database/DioHelper.dart';

part 'places_state.dart';

class PlacesCubit extends Cubit<PlacesState> {
  PlacesCubit() : super(PlacesInitial());

  static PlacesCubit get(context) => BlocProvider.of(context);

  PlacesModels? placesModels;

  void getPlacesData(catId) {
    emit(PlacesLoadingState());

    DioHelper.postData(
      path: PLACES + '?id=$catId',
      token: '',
      data: {},
    ).then((value) {
      placesModels = PlacesModels.fromJson(value.data);
      emit(PlacesSucssesState(placesModels!));
    }).catchError((error, trace) {
      print(trace);
      print(error.toString());
      emit(PlacesErrorState());
    });
  }
}
