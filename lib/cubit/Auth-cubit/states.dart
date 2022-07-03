import 'package:smartqueue/Models/AuthModel.dart';

abstract class AuthState {}

class initialState extends AuthState{}


class LoginLoadingState extends AuthState{}
class LoginSucssesState extends AuthState{
 final AuthModel authModel;

 LoginSucssesState(this.authModel);
}
class LoginErrorState extends AuthState{}


class SignUpLoadingState extends AuthState{}
class SignUpSucssesState extends AuthState{
 final AuthModel authModel;

  SignUpSucssesState(this.authModel);
}
class SignUpErrorState extends AuthState{}

class ProfileLoadingState extends AuthState{}
class ProfileSucssesState extends AuthState{
 final AuthModel authModel;

 ProfileSucssesState(this.authModel);
}
class ProfileErrorState extends AuthState{}