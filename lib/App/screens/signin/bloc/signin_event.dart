part of 'signin_bloc.dart';

sealed class SigninEvent {}

class SigninTextChangeEvent extends SigninEvent {
  final String emailVal;
  final String passwordVal;
  SigninTextChangeEvent(this.emailVal, this.passwordVal);
}

class SigninSubmittedEvent extends SigninEvent {
  final String email;
  final String password;
  SigninSubmittedEvent(this.email, this.password);
}

class SigninSuccessEvent extends SigninEvent {
  SigninSuccessEvent();
}
