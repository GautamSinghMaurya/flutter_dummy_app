import 'package:demo_flutter_app/constants/app_strings.dart';
import 'package:demo_flutter_app/screen/f_password/fpassword_screen.dart';
import 'package:demo_flutter_app/screen/home/home_screen.dart';
import 'package:demo_flutter_app/screen/signup/signup_screen.dart';
import 'package:demo_flutter_app/utils/show_message.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ButtonStyle(
                                elevation: const MaterialStatePropertyAll(6),
                                backgroundColor: const MaterialStatePropertyAll(
                                    Colors.redAccent),
                                shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(6)))),
                            onPressed: () async {
                              if(emailController.text.toString().isEmpty) {
                                ShowMessage().snackBar("Please enter email");
                              } else if(!EmailValidator.validate(emailController.text.toString()) ) {
                                ShowMessage().snackBar("Please enter valid email");
                              } else if(passwordController.text.toString().isEmpty) {
                                ShowMessage().snackBar("Please enter password");
                              } else if(passwordController.text.toString().length < 8) {
                                ShowMessage().snackBar("Password should be at least 8 characters");
                              } else {
                                Future.delayed(const Duration(seconds: 2), () {
                                  if (passwordController.text.toString() != AppStrings.password ||
                                      emailController.text.toString() != AppStrings.username) {
                                    ShowMessage().snackBar("Please enter valid login credentials");
                                  } else {
                                    Get.offAll(const HomeScreen(txt: 'Login successfully',));
                                  }
                                });
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 15),
                              child: const Text(
                                'Login',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
        ));
  }
}
