import 'package:demo_flutter_app/architecture/clean/presentation/screen/f_password/widget/forget_password_submit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../bloc/forget_password_bloc/forget_password_bloc.dart';
import '../../bloc/forget_password_bloc/forget_password_event.dart';
import '../../bloc/forget_password_bloc/forget_password_state.dart';
import '../../widget/common/app_loading.dart';

class ForgetPasswordScreen extends StatelessWidget {
  final _forgetBloc = ForgetPasswordBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return _forgetBloc;
      },
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Forget Password"),
          ),
          body: Container(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Forgot Password ?',
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.redAccent,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  controller: _forgetBloc.emailController,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    // errorText: validate ? errorText : null, focusedBorder: OutlineInputBorder( borderSide: BorderSide(color: Colors.redAccent), borderRadius: BorderRadius.circular(10), ),
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black38),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(width: 200, child: _submitButtonBuilder()),
              ],
            ),
          )),
    );
  }

  _submitButtonBuilder() {
    return BlocBuilder(
        bloc: _forgetBloc,
        buildWhen: (context, state) {
          if (state is ForgetPasswordValidation) {
            Fluttertoast.showToast(msg: state.value);
          } else if (state is ForgetPasswordError) {
            Fluttertoast.showToast(msg: state.error!);
          } else if (state is ForgetPasswordLoaded) {
            _forgetBloc.emailController.text = "";
            Fluttertoast.showToast(msg: "OTP sent to your registered email");
          }
          return state is ForgetPasswordValidation ||
              state is ForgetPasswordLoading ||
              state is ForgetPasswordLoaded ||
              state is ForgetPasswordError;
        },
        builder: (context, state) {
          if (state is ForgetPasswordLoading) {
            return AppLoading();
          } else {
            return _submitButton();
          }
        });
  }

  _submitButton() {
    return ForgetPasswordSubmit(onPressed: () {
      _forgetBloc.add(ForgetPasswordSubmitted(
          email: _forgetBloc.emailController.text.toString()));
    });
  }
}
