import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/login/login_usecases.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCases loginUseCases;

  LoginBloc(this.loginUseCases) : super(LoginInitial()) {
    on((event, emit) async {
      if (event is LoginSubmitted) {
        emit(LoginInitial());
        String value = validation(event);
        if (value != "") {
          emit(LoginValidation(value));
        } else {
          emit(LoginLoading());

          try {
            final result =
                await loginUseCases.login(event.email, event.password);
            emit(LoginLoaded());
            emit(result.fold((error) => LoginError(error: error.message),
                (success) => LoginSuccess(data: success.userId)));
          } catch (_) {
            rethrow;
          }
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
    // } else if (!EmailValidator.validate(loginSubmitted.email)) {
    //   return "Please enter valid email";
    } else if (loginSubmitted.password.isEmpty) {
      return "Please enter password";
    } else if (loginSubmitted.password.length < 4) {
      return "Please enter at least 8 characters password";
    } else {
      return "";
    }
  }
}
