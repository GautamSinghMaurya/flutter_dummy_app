import 'package:demo_flutter_app/constants/app_strings.dart';
import 'package:demo_flutter_app/screen/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'app_drawer/app_drawer.dart';
import 'detail_screen.dart';

class HomeScreen extends StatelessWidget {
  final String txt;

  const HomeScreen({super.key, required this.txt});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      drawer: AppDrawer(

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              "Welcome to flutter demo app",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const  SizedBox(
              height: 16,
            ),
            showListTile(title: "What is Text?", description: "The Text widget displays a string of text with single style. The string might break across multiple lines or might all be displayed on the same line depending on the layout constraints. The style argument is optional."),
            showListTile(title: "What is Row?", description: "The Row widget arranges its child widgets horizontally. It's commonly used to display multiple widgets, one after another. For instance, if you want to display a text label and an icon side by side, you can use this widget."),
            showListTile(title: "What is Column?", description: "A widget that displays its children in a vertical array. To cause a child to expand to fill the available vertical space, wrap the child in an Expanded widget. The Column widget does not scroll (and in general it is considered an error to have more children in a Column than will fit in the available room)."),
            showListTile(title: "What is Expanded?", description: "Expanded widget in flutter comes in handy when we want a child widget or children widgets to take all the available space along the main-axis (for Row the main axis is horizontal & vertical for Column). Expanded widget can be taken as the child of Row, Column, and Flex."),
            showListTile(title: "What is SizedBox?", description: "Comparatively, the SizedBox in Flutter can be seen as a streamlined version of the Container. It primarily functions as an empty container offering the developer control over the width, height, or both simultaneously of its child."),
            showListTile(title: "What is ListTile?", description: "Flutter ListTile is a versatile widget that represents a single fixed-height row. It's commonly used to display a single line or two lines of information, along with optional leading and trailing icons."),
            showListTile(title: "What is SingleChildScrollView?", description: "The SingleChildScrollView widget is a flexible and essential component in the Flutter widget library. It provides a simple way to create scrollable areas for content that exceeds the screen size, ensuring that all content remains accessible and visible."),
            showListTile(title: "What is AppBar?", description: "AppBar is usually the topmost component of the app (or sometimes the bottom-most), it contains the toolbar and some other common action buttons. As all the components in a flutter application are a widget or a combination of widgets."),
            showListTile(title: "What is Scaffold?", description: "Scaffold is a class in flutter which provides many widgets or we can say APIs like Drawer, Snack-Bar, Bottom-Navigation-Bar, Floating-Action-Button, App-Bar, etc. Scaffold will expand or occupy the whole device screen. It will occupy the available space."),
            showListTile(title: "What is Button?", description: "Buttons are the graphical control element that provides a user to trigger an event such as taking actions, making choices, searching things, and many more. They can be placed anywhere in our UI like dialogs, forms, cards, toolbars, etc. Buttons are the Flutter widgets, which is a part of the material design library."),
            showListTile(title: "What is Image?", description: "Flutter provides the Image widget to display different types of images. To work with images from a URL, use the Image.network() constructor. dart Image."),
            showListTile(title: "What is Wrap?", description: "A Wrap widget in Flutter is a fantastic solution to the overflow error. It automatically moves its children to the following line when there isn't enough space in the current one, a scenario often presented when dealing with multiple lines of text."),
            showListTile(title: "What is Checkbox?", description: "A Flutter checkbox is a type of input component that holds the boolean value. A GUI(Graphical User Interface) element allows users to choose multiple options from many selections. Here, users can reply only with a 'yes' or 'no' value."),
          ],
        ),
      ),
      bottomNavigationBar: ElevatedButton(
        child: const Text(AppStrings.logout),
        onPressed: () {
          Get.offAll(LoginScreen());
        },
      ),
    );
  }

  showListTile({required title, required description}) {
    return ListTile(
      title: Text(title),
      onTap: () {
        openDetailScreen(title, description);
      },
    );
  }

  openDetailScreen(var title, var description) {
    Get.to(DetailScreen(
      title: title,
      description: description,
    ));
  }
}
