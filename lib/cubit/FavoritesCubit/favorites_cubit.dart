import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../Models/FavoritesModel.dart';
import '../../database/CacheHelper.dart';
import '../../database/EndPoint.dart';
import '../../database/DioHelper.dart';
part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(FavoritesInitial());
  static FavoritesCubit get(context) => BlocProvider.of(context);

  AddFavoritesModel? addfavoritesModel;
  FavoritesModel? favoritesModel;
  List<FavModel> favs = [];
  void getFavoritesData() {
    emit(FavoritesLoadingState());
    DioHelper.postData(
      path: GETFAVORITES,
      data: FormData.fromMap(
        {
          'user_id': CacheHelper.getData(key: 'id'),
          //"branch_id": placeId,
        },
      ),
    ).then((value) {
      favoritesModel = FavoritesModel.fromJson(value.data);
      favs = [...favoritesModel!.data];
      emit(FavoritesSucssesState());
    }).catchError((error, trace) {
      print(trace);
      print(error.toString());
      emit(FavoritesErrorState());
    });
  }

  deleteFav(placeId) {
    DioHelper.postData(
      path: 'delete-favorites?branch_id=$placeId',
      data: {},
      // data: FormData.fromMap(
      //   {
      //     'user_id': CacheHelper.getData(key: 'id'),
      //     "branch_id": placeId,
      //   },
      // ),
    ).then((value) {
      getFavoritesData();
    }).catchError((e) {});
  }

}
