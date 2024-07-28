import '../../../../core/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../bloc/reset_pswd_bloc/reset_pswd_cubit.dart';
import '../../bloc/reset_pswd_bloc/reset_pswd_state.dart';
import '../../bloc/signup_bloc/signup_state.dart';
import '../../widget/common/app_loading.dart';
import '../login/login_screen.dart';
import 'widget/reset_password_submit.dart';

class ResetPasswordScreen extends StatelessWidget {
  TextEditingController oldPswdController = TextEditingController();
  TextEditingController newPswdController = TextEditingController();
  TextEditingController confirmPswdController = TextEditingController();

  final _resetPswdCubit = ResetPasswordCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ResetPasswordCubit>(
        create: (BuildContext context) {
          return _resetPswdCubit;
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text(AppStrings.resetPassword),
            backgroundColor: Colors.redAccent,
          ),
          body: Container(
            padding: const EdgeInsets.all(24),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 24),
                  TextField(
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.name,
                      controller: oldPswdController,
                      decoration: InputDecoration(
                          hintText: AppStrings.old_password,
                          // errorText: validate ? errorText : null, focusedBorder: OutlineInputBorder(

                          border: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.black38),
                              borderRadius: BorderRadius.circular(10)))),
                  const SizedBox(height: 10),
                  TextField(
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    controller: newPswdController,
                    decoration: InputDecoration(
                      hintText: AppStrings.new_password,
                      // errorText: validate ? errorText : null, focusedBorder: OutlineInputBorder( borderSide: BorderSide(color: Colors.redAccent), borderRadius: BorderRadius.circular(10), ),
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black38),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.visiblePassword,
                    controller: confirmPswdController,
                    decoration: InputDecoration(
                      hintText: AppStrings.confirm_password,
                      // errorText: validate ? errorText : null, focusedBorder: OutlineInputBorder( borderSide: BorderSide(color: Colors.redAccent), borderRadius: BorderRadius.circular(10)),
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black38),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  _buttonBuilder(),
                ],
              ),
            ),
          ),
        ));
  }

  _buttonBuilder() {
    return BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
        buildWhen: (context, state) {
      if (state is ResetPasswordValidation) {
        Fluttertoast.showToast(msg: state.value);
      }
      if (state is ResetPasswordSuccess) {
        if (state.result!) {
          Fluttertoast.showToast(msg: AppStrings.passwordChangedSuccessfully);
          Get.back();
        } else {
          Fluttertoast.showToast(msg: AppStrings.somethingWentWrong);
        }
      }
      return ((state is ResetPasswordInitial) ||
          (state is ResetPasswordLoading) ||
          (state is ResetPasswordLoaded));
    }, builder: (context, state) {
      if (state is ResetPasswordLoading) {
        return AppLoading();
      } else {
        return ResetPasswordSubmit(onPressed: () {
          _resetPswdCubit.validation(
              oldPswd: oldPswdController.text,
              newPswd: newPswdController.text,
              confirmPswd: confirmPswdController.text);
        });
      }
    });
  }
}
