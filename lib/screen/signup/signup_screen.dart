import 'package:demo_flutter_app/bloc/signup_bloc/signup_bloc.dart';
import 'package:demo_flutter_app/bloc/signup_bloc/signup_event.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../bloc/signup_bloc/signup_state.dart';
import '../../constants/app_strings.dart';
import '../../utils/show_message.dart';
import '../home/home_screen.dart';
import '../login/login_screen.dart';

class SignupScreen extends StatelessWidget {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  final _signupBloc = SignupBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return _signupBloc;
      },
      child: BlocBuilder<SignupBloc, SignupState>(
        builder: (BuildContext context, SignupState state) {
          if(state is SignupValidation) {
            return ShowMessage().snackBar(state.value);
          } else if(state is SignupLoading) {
            return CircularProgressIndicator();
          } else if(state is SignupLoaded) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Signup'),
                backgroundColor: Colors.redAccent,
              ),
              body: Container(
                padding: const EdgeInsets.all(24),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Create New User',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.redAccent,
                            fontWeight: FontWeight.bold),
                      ),
                      TextField(
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.name,
                          controller: fullNameController,
                          decoration: InputDecoration(
                              hintText: 'Full name',
                              // errorText: validate ? errorText : null, focusedBorder: OutlineInputBorder(

                              border: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.black38),
                                  borderRadius: BorderRadius.circular(10)))),
                      const SizedBox(height: 10),
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
                        decoration: InputDecoration(
                          hintText: 'Password',
                          // errorText: validate ? errorText : null, focusedBorder: OutlineInputBorder( borderSide: BorderSide(color: Colors.redAccent), borderRadius: BorderRadius.circular(10)),
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.black38),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextField(
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.phone,
                          controller: phoneNumberController,
                          decoration: InputDecoration(
                            hintText: 'Phone number',
                            // errorText: validate ? errorText : null, focusedBorder: OutlineInputBorder( borderSide: BorderSide(color: Colors.redAccent), borderRadius: BorderRadius.circular(10)),
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.black38),
                                borderRadius: BorderRadius.circular(10)),
                          )),
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
                                      onPressed: () {

                                        _signupBloc.add(GetSignup(
                                            name: fullNameController.text.toString(),
                                            email: emailController.text.toString(),
                                            password: passwordController.text.toString(),
                                            phone: phoneNumberController.text.toString()
                                        ));

                                        // if (fullNameController.text.toString().isEmpty) {
                                        //   ShowMessage().snackBar("Please enter name");
                                        // } else if (fullNameController.text
                                        //     .toString()
                                        //     .length <
                                        //     3) {
                                        //   ShowMessage()
                                        //       .snackBar("Please enter valid name");
                                        // } else if (emailController.text
                                        //     .toString()
                                        //     .isEmpty) {
                                        //   ShowMessage().snackBar("Please enter email");
                                        // } else if (!EmailValidator.validate(
                                        //     emailController.text.toString())) {
                                        //   ShowMessage()
                                        //       .snackBar("Please enter valid email");
                                        // } else if (passwordController.text
                                        //     .toString()
                                        //     .isEmpty) {
                                        //   ShowMessage().snackBar("Please enter password");
                                        // } else if (passwordController.text
                                        //     .toString()
                                        //     .length <
                                        //     8) {
                                        //   ShowMessage().snackBar(
                                        //       "Password should be at least 8 characters");
                                        // } else if (phoneNumberController.text
                                        //     .toString()
                                        //     .isEmpty) {
                                        //   ShowMessage().snackBar("Please enter phone");
                                        // } else if (phoneNumberController.text
                                        //     .toString()
                                        //     .length <
                                        //     10 ||
                                        //     phoneNumberController.text.toString().length >
                                        //         10) {
                                        //   ShowMessage()
                                        //       .snackBar("Please enter valid phone");
                                        // } else {
                                        //   Future.delayed(const Duration(seconds: 2), () {
                                        //     Get.offAll(const HomeScreen(
                                        //         txt: 'Signup successfully'));
                                        //   });
                                        // }
                                      },
                                      child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 15),
                                          child: const Text(
                                            'Signup',
                                          ))),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return LoginScreen();
                                  },
                                ));
                              },
                              child: const Text(
                                'Already have an account?',
                                style: TextStyle(color: Colors.redAccent),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      )
    );
  }
}
