import 'dart:io';

import 'package:demo_flutter_app/architecture/clean/presentation/widget/adaptive/platform_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformButton extends PlatformWidget {
  final Function() onPressed;
  final String text;

  const PlatformButton({super.key, required this.onPressed, this.text = "Submit"});

  @override
  Widget createAndroidWidget(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, child: _child());
  }

  @override
  Widget createIosWidget(BuildContext context) {
    return CupertinoButton(child: _child(), onPressed: onPressed);
  }

  _child() {
    return Text(text);
  }

}
