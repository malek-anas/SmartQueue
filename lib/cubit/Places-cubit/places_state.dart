part of 'places_cubit.dart';

@immutable
abstract class PlacesState {}

class PlacesInitial extends PlacesState {}


class PlacesLoadingState extends PlacesInitial{}
class PlacesSucssesState extends PlacesInitial{
  final PlacesModels placesModels;

  PlacesSucssesState(this.placesModels);
}
class PlacesErrorState extends PlacesInitial{}