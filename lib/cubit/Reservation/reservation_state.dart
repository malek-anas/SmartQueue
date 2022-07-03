part of 'reservation_cubit.dart';

@immutable
abstract class ReservationState {}

class ReservationInitial extends ReservationState {}

class ReservationLoadingState extends ReservationState {}

class ReservationSucssesState extends ReservationState {
  // final ReservationModel branchesModel;

  // ReservationSucssesState(this.branchesModel);
}

class ReservationErrorState extends ReservationState {}
