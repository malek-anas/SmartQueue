import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:smartqueue/database/EndPoint.dart';
import '../../Models/Branch-models.dart';
import '../../database/CacheHelper.dart';
import '../../database/DioHelper.dart';
part 'branches_state.dart';

class BranchesCubit extends Cubit<BranchesState> {
  BranchesCubit() : super(BranchesInitial());

  static BranchesCubit get(context) => BlocProvider.of(context);

  BranchesModel? branchesModel;
  Map<int, bool> addfavorate = {};
  void getBranchesData(placeId) {
    emit(BranchesLoadingState());
    DioHelper.postData(
      path: BRANCHES + '?id=$placeId',
      token: '',
      data: {},
    ).then((value) {
      branchesModel = BranchesModel.fromJson(value.data);
      branchesModel!.branches?.forEach((element) {
        addfavorate.addAll({
          /* element.id :element.placeId;*/
        });
      });
      emit(BranchesSucssesState(branchesModel!));
    }).catchError((error) {
      print(error.toString());
      emit(BranchesErrorState());
    });
  }

  changeFavState(placeId, bool state) {
    DioHelper.postData(
      path: state ? 'add-favorite' : 'delete-favorite',
      data: FormData.fromMap(
        {
          'user_id': CacheHelper.getData(key: 'id'),
          "branch_id": placeId,
        },
      ),
    ).catchError((e) {});
  }
}
