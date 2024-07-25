import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/constants/app_strings.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on((event, emit) async {
      if (event is LoginSubmitted) {
        emit(LoginInitial());
        String value = validation(event);
        if (value != "") {
          emit(LoginValidation(value));
        } else {
          emit(LoginLoading());
          await Future.delayed(const Duration(seconds: 2), () {
            if (event.password.toString() != AppStrings.password ||
                event.email.toString() != AppStrings.username) {
              emit(LoginError(error: "Please enter valid login credentials"));
            } else {
              emit(LoginLoaded());
            }
          });
        }
      }
    });
  }

  // @override
  // Stream<LoginState> mapEventToState(LoginEvent event) async* {
  //   switch (event.eventType) {
  //     case EventType.login:
  //       {
  //         yield LoggedIn();
  //         break;
  //       }
  //
  //     case EventType.logout:
  //       {
  //         yield NotLoggedIn();
  //         break;
  //       }
  //
  //     default:
  //       throw Exception('Event not found $event');
  //   }
  // }

  validation(LoginSubmitted loginSubmitted) {


    if (loginSubmitted.email.isEmpty) {
      return "Please enter email";
    } else if (!EmailValidator.validate(loginSubmitted.email)) {
      return "Please enter valid email";
    } else if (loginSubmitted.password.isEmpty) {
      return "Please enter password";
    } else if (loginSubmitted.password.length < 8) {
      return "Please enter at least 8 characters password";
    } else {
      return "";
    }
  }
}
