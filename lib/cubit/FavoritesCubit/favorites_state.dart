part of 'favorites_cubit.dart';

@immutable
abstract class FavoritesState {}

class FavoritesInitial extends FavoritesState {}

class FavoritesLoadingState extends FavoritesInitial {}

class FavoritesSucssesState extends FavoritesInitial {}

class FavoritesErrorState extends FavoritesInitial {}
