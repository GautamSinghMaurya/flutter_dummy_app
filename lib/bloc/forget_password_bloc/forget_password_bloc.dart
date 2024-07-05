import 'package:demo_flutter_app/bloc/forget_password_bloc/forget_password_event.dart';
import 'package:demo_flutter_app/bloc/forget_password_bloc/forget_password_state.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordBloc
    extends Bloc<ForgetPasswordEvent, ForgetPasswordState> {
  TextEditingController emailController = TextEditingController();

  ForgetPasswordBloc() : super(ForgetPasswordInitial()) {
    on((event, emit) async {
      print(event);

      emit(ForgetPasswordInitial());
      if (event is ForgetPasswordSubmitted) {
        String value = validation(event);

        print("validation");
        print(value);
        if (value != "") {
          emit(ForgetPasswordValidation(value: value));
        } else {
          emit(ForgetPasswordLoading());
          await Future.delayed(const Duration(seconds: 2), () {
            emit(ForgetPasswordLoaded());
          });
        }
      }
    });
  }

  validation(ForgetPasswordSubmitted data) {
    String validation = "";

    if (data.email!.isEmpty) {
      validation = "Please enter email";
    } else if (!EmailValidator.validate(data.email!)) {
      validation = "Please enter valid email";
    } else {
      validation = "";
    }
    return validation;
  }
}
