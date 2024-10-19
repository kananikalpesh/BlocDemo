part of 'signin_bloc.dart';

sealed class SigninState {}

class SigninInitState extends SigninState {}

class SigninInvalidState extends SigninState {}

class SigninValidState extends SigninState {}

class SigninErrorState extends SigninState {
  final String errorMessage;
  SigninErrorState(this.errorMessage);
}

class SigninLoadingState extends SigninState {}

class SigninSuccessState extends SigninState {}
