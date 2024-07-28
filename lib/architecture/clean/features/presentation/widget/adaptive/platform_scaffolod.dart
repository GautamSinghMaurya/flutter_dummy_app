import 'package:demo_flutter_app/architecture/clean/features/presentation/widget/adaptive/platform_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlatformScaffold extends PlatformWidget<CupertinoPageScaffold, Scaffold> {
  final dynamic appbar;
  final Widget body;
  final Widget? bottomNavigationBar;
  final Color? backgroundColor;

  PlatformScaffold(
      {required this.appbar,
      required this.body,
      this.backgroundColor = Colors.white,
      this.bottomNavigationBar});

  @override
  Scaffold createAndroidWidget(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: appbar,
      body: body,
      bottomNavigationBar: bottomNavigationBar,
    );
  }

  @override
  CupertinoPageScaffold createIosWidget(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: backgroundColor,
      navigationBar: appbar,
      child: body,
    );
  }
}
