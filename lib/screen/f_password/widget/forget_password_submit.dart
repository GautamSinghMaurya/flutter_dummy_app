import 'package:flutter/material.dart';

class ForgetPasswordSubmit extends StatelessWidget {
  Function() onPressed;

  ForgetPasswordSubmit({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          elevation: const MaterialStatePropertyAll(6),
          backgroundColor: const MaterialStatePropertyAll(Colors.redAccent),
          shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)))),
      onPressed: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: const Text(
          'Submit',
        ),
      ),
    );
  }
}