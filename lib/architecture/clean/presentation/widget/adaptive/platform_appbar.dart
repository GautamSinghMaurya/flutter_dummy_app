import 'dart:io';

import 'package:demo_flutter_app/architecture/clean/presentation/widget/adaptive/platform_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformAppBar {
  final String text;

  PlatformAppBar({required this.text});

  Widget _text(final String text) {
    return Text(text);
  }

  common() {
    return Platform.isIOS
        ? CupertinoNavigationBar(
            middle: _text(text),
          )
        : AppBar(
            title: _text(text),
          );
  }
}
