import 'package:demo_flutter_app/screen/home/home_screen.dart';
import 'package:demo_flutter_app/screen/signup/signup_screen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/show_message.dart';

class ForgetPasswordScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                height: 40,
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
                              if(emailController.text.toString().isEmpty) {
                                ShowMessage().snackBar("Please enter email");
                              } else if(!EmailValidator.validate(emailController.text.toString()) ) {
                                ShowMessage().snackBar("Please enter valid email");
                              } else {
                                Future.delayed(Duration(seconds: 2), () {
                                  ShowMessage().snackBar("there is something wrong while resetting the password");
                                });
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 15),
                              child: const Text(
                                'Submit',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),

                  ],
                ),
              )
            ],
          ),
        ));
  }
}
