import 'package:bloc/bloc.dart';
import 'package:email_validator/email_validator.dart';

part 'signin_event.dart';

part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  SigninBloc() : super(SigninInitState()) {
    on<SigninTextChangeEvent>((event, emit) {
      if (EmailValidator.validate(event.emailVal) == false) {
        emit(SigninErrorState("Please enter a valid email address"));
      } else if (event.passwordVal == "" || event.passwordVal.length < 8) {
        emit(SigninErrorState("Please enter a valid password"));
      } else {
        emit(SigninValidState());
      }
    });

    on<SigninSubmittedEvent>((event, emit) {
      emit(SigninLoadingState());
    });

    on<SigninSuccessEvent>((event, emit) {
      emit(SigninSuccessState());
    });
  }
}
