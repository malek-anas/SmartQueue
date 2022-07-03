part of 'branches_cubit.dart';

@immutable
abstract class BranchesState {}

class BranchesInitial extends BranchesState {}



class BranchesLoadingState extends BranchesInitial{}
class BranchesSucssesState extends BranchesInitial{
  final BranchesModel branchesModel;

  BranchesSucssesState(this.branchesModel);
}
class BranchesErrorState extends BranchesInitial{}