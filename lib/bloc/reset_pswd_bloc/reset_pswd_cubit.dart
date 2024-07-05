import 'package:demo_flutter_app/bloc/reset_pswd_bloc/reset_pswd_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(ResetPasswordInitial()) {}

  void resetPassword() async {
    bool response = false;
    emit(ResetPasswordLoading());
    await Future.delayed(const Duration(seconds: 3), () {
      emit(ResetPasswordLoaded());
      response = true;
      emit(ResetPasswordSuccess(result: response));
    });
  }

  validation(
      {required String oldPswd,
      required String newPswd,
      required String confirmPswd}) {
    String validation = "";

    emit(ResetPasswordInitial());

    if (oldPswd.isEmpty) {
      validation = "Please enter old password";
    } else if (oldPswd.length < 8) {
      validation = "Please enter valid old password";
    } else if (newPswd.isEmpty) {
      validation = "Please enter new password";
    } else if (newPswd.length < 8) {
      validation = "Please enter valid new password";
    } else if (confirmPswd.isEmpty) {
      validation = "Please enter confirm password";
    } else if (confirmPswd.length < 8) {
      validation = "Please enter valid confirm password";
    } else if (newPswd != confirmPswd) {
      validation = "New password doesn't match";
    } else {
      validation = "";
    }
    if (validation != "") {
      emit(ResetPasswordValidation(value: validation));
    } else {
      resetPassword();
    }
  }
}
