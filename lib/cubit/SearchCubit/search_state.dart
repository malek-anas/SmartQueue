part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}


class SearchLoadingState extends SearchState{}
class SearchSucssesState extends SearchState{
  final SearchModel searchModel;

  SearchSucssesState(this.searchModel);
}
class SearchErrorState extends SearchState{}