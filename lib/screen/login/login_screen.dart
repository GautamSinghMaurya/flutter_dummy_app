import 'package:demo_flutter_app/bloc/login_bloc/login_bloc.dart';
import 'package:demo_flutter_app/bloc/login_bloc/login_event.dart';
import 'package:demo_flutter_app/bloc/login_bloc/login_state.dart';
import 'package:demo_flutter_app/screen/f_password/fpassword_screen.dart';
import 'package:demo_flutter_app/screen/home/home_screen.dart';
import 'package:demo_flutter_app/screen/login/widget/login_submit.dart';
import 'package:demo_flutter_app/screen/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

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
                TextField(
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: 'Email',
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
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    // errorText: validate ? errorText : null, focusedBorder: OutlineInputBorder(

                    border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black38),
                        borderRadius: BorderRadius.circular(10)),
                  ),
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
            Fluttertoast.showToast(msg: state.value!);
          }
          if (state is LoginError) {
            Fluttertoast.showToast(msg: "error : " + state.error!);
          }
          if (state is LoginLoaded) {
            Get.offAll(const HomeScreen(
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
            return LoginSubmit(onPressed: () {
              debugPrint("LoginSubmit---->$state");
              _loginBloc.add(LoginSubmitted(
                  email: emailController.text.toString(),
                  password: passwordController.text.toString()));
            });
          }
        });
  }
}
