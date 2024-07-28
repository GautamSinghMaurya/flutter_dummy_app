import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/constants/app_strings.dart';
import '../../login/login_screen.dart';
import '../../reset_password/reset_password_screen.dart';

class AppDrawer extends Drawer {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        width: 280,
        height: MediaQuery.of(context).size.height * 1,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              ListTile(
                tileColor: Colors.grey,
                title: const Text(AppStrings.resetPassword),
                onTap: (){
                  Get.to(ResetPasswordScreen());
                },
              ),
              ListTile(
                tileColor: Colors.grey,
                title: const Text(AppStrings.privacyPolicy),
                onTap: _launchURL,
              ),
              ListTile(
                tileColor: Colors.grey,
                title: const Text(AppStrings.logout),
                onTap: () {
                  Get.offAll(LoginScreen());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  _launchURL() async {
    final Uri url = Uri.parse(
        'https://www.freeprivacypolicy.com/live/318123d4-67f6-4f00-ab35-382c01439ea9');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

}
