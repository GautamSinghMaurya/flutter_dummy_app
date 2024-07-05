import 'package:demo_flutter_app/constants/app_strings.dart';
import 'package:flutter/material.dart';

class ResetPasswordSubmit extends StatelessWidget {
  Function() onPressed;

  ResetPasswordSubmit({required this.onPressed});

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
        child: const Text(AppStrings.submit,
        ),
      ),
    );
  }
}
