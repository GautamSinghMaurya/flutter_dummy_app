import 'package:demo_flutter_app/architecture/clean/presentation/widget/adaptive/platform_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformTextField extends PlatformWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final int maxLines;
  final String hintText;
  final bool obscureText;
  final TextInputAction textInputAction;

  const PlatformTextField(
      {super.key, required this.controller,
      this.maxLines = 1,
      this.hintText = "",
      this.obscureText = false,
      this.textInputAction = TextInputAction.next,
      this.keyboardType = TextInputType.text});

  @override
  Widget createAndroidWidget(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      obscureText: obscureText,
      textInputAction: textInputAction,
      decoration: InputDecoration(
      hintText: hintText,
      border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black38),
          borderRadius: BorderRadius.circular(10)),
    ),
    );
  }

  @override
  Widget createIosWidget(BuildContext context) {
    return CupertinoTextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      maxLines: maxLines,
      textInputAction: textInputAction,
      placeholder: hintText,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black38,
          width: 1
        )
      ),
    );
  }
}
