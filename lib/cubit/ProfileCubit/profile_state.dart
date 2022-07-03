part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}


class ProfileLoadingState extends ProfileState{}
class ProfileSucssesState extends ProfileState{
  final ProfileModel profileModel;

  ProfileSucssesState(this.profileModel);
}
class ProfileErrorState extends ProfileState{}