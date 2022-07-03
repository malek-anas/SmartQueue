import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../Models/Categories.models.dart';
import '../../Models/searchmodel.dart';
import '../../database/DioHelper.dart';
import '../../database/EndPoint.dart';
import 'dart:convert';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitial());
  static CategoriesCubit get(context) => BlocProvider.of(context);

  CategoriesModel? categoriesModel;

  void getCategoriesData() {
    emit(CategoriesLoadingState());

    DioHelper.getData(
      path: CATEGORIES,
    ).then((value) {
      categoriesModel = CategoriesModel.fromJson(value.data);
      emit(CategoriesSucssesState(categoriesModel!));
    }).catchError((error) {
      print(error.toString());
      emit(CategoriesErrorState());
    });
  }

  List<SearchModel> result = [];
  void search(String name) {
    emit(CategoriesSearchingState());
    DioHelper.getData(
      path: SEARCH + "/$name",
    ).then((value) {
      dynamic json3 = json.decode(value.data.substring(22));
      result.clear();
      for (var item in json3) {
        result.add(SearchModel.fromJson(item));
      }
      emit(CategoriesSearchingSuccess());
    }).catchError((error, trace) {
      print(trace);
      print(error.toString());
      emit(CategoriesSearchingError());
    });
  }
}
