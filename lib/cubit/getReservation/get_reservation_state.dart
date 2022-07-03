part of 'get_reservation_cubit.dart';

@immutable
abstract class GetReservationState {}

class GetReservationInitial extends GetReservationState {}

class GetReservationLoadingState extends GetReservationInitial {}

class GetReservationSucssesState extends GetReservationInitial {}

class GetReservationErrorState extends GetReservationInitial {}
