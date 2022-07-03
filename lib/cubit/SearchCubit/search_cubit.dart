import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../Models/searchmodel.dart';
import '../../database/DioHelper.dart';
import '../../database/EndPoint.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  static SearchCubit get(context) => BlocProvider.of(context);

  SearchModel? searchModel;

  void getProfileData() {
    emit(SearchLoadingState());

    DioHelper.getData(
      path: SEARCH + "/",
    ).then((value) {
      searchModel = SearchModel.fromJson(value.data);
      emit(SearchSucssesState(searchModel!));
    }).catchError((error, trace) {
      print(trace);
      print(error.toString());
      emit(SearchErrorState());
    });
  }
}
