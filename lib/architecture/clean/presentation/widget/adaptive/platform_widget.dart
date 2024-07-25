import 'dart:io';

import 'package:flutter/material.dart';

abstract class PlatformWidget<I extends Widget, A extends Widget> extends StatelessWidget {

  const PlatformWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? createAndroidWidget(context)
        : Platform.isIOS
            ? createIosWidget(context)
            : createAndroidWidget(context);
  }

  I createIosWidget(BuildContext context);

  A createAndroidWidget(BuildContext context);
}
