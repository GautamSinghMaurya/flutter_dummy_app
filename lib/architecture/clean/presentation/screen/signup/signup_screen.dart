
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/signup_bloc/signup_bloc.dart';
import '../../bloc/signup_bloc/signup_event.dart';
import '../../bloc/signup_bloc/signup_state.dart';
import '../login/login_screen.dart';

class SignupScreen extends StatefulWidget {
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
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
        child: Scaffold(
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
                  const SizedBox(height: 24),
                  TextField(
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.name,
                      controller: fullNameController,
                      decoration: InputDecoration(
                          hintText: 'Full name',
                          // errorText: validate ? errorText : null, focusedBorder: OutlineInputBorder(

                          border: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.black38),
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
                  _signupButton(),
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
                  )
                ],
              ),
            ),
          ),
        ));
  }

  _showSignInError(var context) {
    final snackBar = SnackBar(
      duration: Duration(seconds: 3),
      backgroundColor: Colors.red,
      content: Text(
        "asdf",
      ),
    );
    return ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  _signupButton() {
    return BlocBuilder<SignupBloc, SignupState>(
        bloc: _signupBloc,
        buildWhen: (mContext, state) {
          if (state is SignupValidation) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.value!)));
          }
          return state is SignupLoading ||
              state is SignupValidation ||
              state is SignupLoaded;
        },
        builder: (context, state) {
          if (state is SignupLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return SizedBox(
              width: 240,
              height: 48,
              child: ElevatedButton(
                  style: ButtonStyle(
                      elevation: const MaterialStatePropertyAll(6),
                      backgroundColor:
                          const MaterialStatePropertyAll(Colors.redAccent),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)))),
                  onPressed: () {
                    debugPrint("_signupButton---->$state");
                    _signupBloc.add(DoSignUp(
                        name: fullNameController.text.toString(),
                        email: emailController.text.toString(),
                        password: passwordController.text.toString(),
                        phone: phoneNumberController.text.toString()));
                  },
                  child: const Text(
                    'Signup',
                  )),
            );
          }
        });
  }
}
