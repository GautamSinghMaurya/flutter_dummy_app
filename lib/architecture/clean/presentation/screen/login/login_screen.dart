import 'package:demo_flutter_app/architecture/clean/data/constants/app_strings.dart';
import 'package:demo_flutter_app/architecture/clean/presentation/widget/adaptive/platform_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../bloc/login_bloc/login_bloc.dart';
import '../../bloc/login_bloc/login_event.dart';
import '../../bloc/login_bloc/login_state.dart';
import '../../widget/adaptive/platform_textfield.dart';
import '../f_password/fpassword_screen.dart';
import '../home/home_screen.dart';
import '../signup/signup_screen.dart';
import 'widget/login_submit.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  final _loginBloc = LoginBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => _loginBloc,
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Login"),
          ),
          body: Container(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Welcome Back',
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.redAccent,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                PlatformTextField(
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  hintText: AppStrings.enter_email,
                ),
                const SizedBox(
                  height: 10,
                ),
                PlatformTextField(
                  textInputAction: TextInputAction.done,
                  controller: passwordController,
                  hintText: AppStrings.enter_password,
                  obscureText: true,
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(ForgetPasswordScreen());
                  },
                  child: const Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.redAccent),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      _loginButton(),
                      const SizedBox(
                        height: 15,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(SignupScreen());
                        },
                        child: const Text(
                          'New User? Signup Here',
                          style: TextStyle(color: Colors.redAccent),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }

  _loginButton() {
    return BlocBuilder<LoginBloc, LoginState>(
        bloc: _loginBloc,
        buildWhen: (mContext, state) {
          print(state);
          if (state is LoginValidation) {
            Fluttertoast.showToast(msg: "a" + state.value!);
          }
          if (state is LoginError) {
            Fluttertoast.showToast(msg: "error : " + state.error!);
          }
          if (state is LoginLoaded) {
            Get.offAll(HomeScreen(
              txt: 'Login successfully',
            ));
          }
          return state is LoginLoading ||
              state is LoginValidation ||
              state is LoginError;
        },
        builder: (context, state) {
          if (state is LoginLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return PlatformButton(onPressed: () {
              _loginBloc.add(LoginSubmitted(
                  email: emailController.text.toString(),
                  password: passwordController.text.toString()));
            });
          }
        });
  }
}
