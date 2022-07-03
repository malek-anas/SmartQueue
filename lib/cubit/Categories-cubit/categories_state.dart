part of 'categories_cubit.dart';

@immutable
abstract class CategoriesState {}

class CategoriesInitial extends CategoriesState {}

class CategoriesLoadingState extends CategoriesState {}

class CategoriesSucssesState extends CategoriesState {
  final CategoriesModel categoriesmodel;

  CategoriesSucssesState(this.categoriesmodel);
}

class CategoriesErrorState extends CategoriesState {}

class CategoriesSearchingState extends CategoriesState {}

class CategoriesSearchingError extends CategoriesState {}

class CategoriesSearchingSuccess extends CategoriesState {}
