import 'package:demo_flutter_app/bloc/signup_bloc/signup_event.dart';
import 'package:demo_flutter_app/bloc/signup_bloc/signup_state.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial()) {
    on((event, emit) async {

      if(event is GetSignup) {
        String value = validation(event);
        if(value != "") {
          emit(SignupValidation(value));
        } else {
          emit(SignupLoading());
          await Future.delayed(Duration(seconds: 2), () {

          });
          emit(SignupLoaded());
        }
      }

    });
  }


  validation(GetSignup data) {
    if(data.name?.isEmpty==true) {
      return "Please enter name";
    }
    if(data.email?.isEmpty==true) {
      return "Please enter email";
    }
    if(!EmailValidator.validate(data.email!)) {
      return "Please enter valid email";
    }

    return "";
  }

}
