import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../data/datasources/widget_data.dart';
import '../login/login_screen.dart';
import 'app_drawer/app_drawer.dart';
import 'detail_screen.dart';

class HomeScreen extends StatelessWidget {

  HomeScreen({super.key});

  var data = [
    WidgetData(
        title: "What is Text?",
        description:
        "The Text widget displays a string of text with single style. The string might break across multiple lines or might all be displayed on the same line depending on the layout constraints. The style argument is optional."),
    WidgetData(
        title: "What is Row?",
        description:
        "The Row widget arranges its child widgets horizontally. It's commonly used to display multiple widgets, one after another. For instance, if you want to display a text label and an icon side by side, you can use this widget."),
    WidgetData(
        title: "What is Column?",
        description:
        "A widget that displays its children in a vertical array. To cause a child to expand to fill the available vertical space, wrap the child in an Expanded widget. The Column widget does not scroll (and in general it is considered an error to have more children in a Column than will fit in the available room)."),
    WidgetData(
        title: "What is Expanded?",
        description:
        "Expanded widget in flutter comes in handy when we want a child widget or children widgets to take all the available space along the main-axis (for Row the main axis is horizontal & vertical for Column). Expanded widget can be taken as the child of Row, Column, and Flex."),
    WidgetData(
        title: "What is SizedBox?",
        description:
        "Expanded widget in flutter comes in handy when we want a child widget or children widgets to take all the available space along the main-axis (for Row the main axis is horizontal & vertical for Column). Expanded widget can be taken as the child of Row, Column, and Flex."),
   WidgetData(
        title: "What is ListTile?",
        description:
        "Expanded widget in flutter comes in handy when we want a child widget or children widgets to take all the available space along the main-axis (for Row the main axis is horizontal & vertical for Column). Expanded widget can be taken as the child of Row, Column, and Flex."),
   WidgetData(
        title: "What is SingleChildScrollView?",
        description:
        "Expanded widget in flutter comes in handy when we want a child widget or children widgets to take all the available space along the main-axis (for Row the main axis is horizontal & vertical for Column). Expanded widget can be taken as the child of Row, Column, and Flex."),
   WidgetData(
        title: "What is AppBar?",
        description:
        "Expanded widget in flutter comes in handy when we want a child widget or children widgets to take all the available space along the main-axis (for Row the main axis is horizontal & vertical for Column). Expanded widget can be taken as the child of Row, Column, and Flex."),
  WidgetData(
        title: "What is Scaffold?",
        description:
        "Expanded widget in flutter comes in handy when we want a child widget or children widgets to take all the available space along the main-axis (for Row the main axis is horizontal & vertical for Column). Expanded widget can be taken as the child of Row, Column, and Flex."),
  WidgetData(
        title: "What is Button?",
        description:
        "Expanded widget in flutter comes in handy when we want a child widget or children widgets to take all the available space along the main-axis (for Row the main axis is horizontal & vertical for Column). Expanded widget can be taken as the child of Row, Column, and Flex."),
  WidgetData(
        title: "What is Image?",
        description:
        "Expanded widget in flutter comes in handy when we want a child widget or children widgets to take all the available space along the main-axis (for Row the main axis is horizontal & vertical for Column). Expanded widget can be taken as the child of Row, Column, and Flex."),
  WidgetData(
        title: "What is Wrap?",
        description:
        "Expanded widget in flutter comes in handy when we want a child widget or children widgets to take all the available space along the main-axis (for Row the main axis is horizontal & vertical for Column). Expanded widget can be taken as the child of Row, Column, and Flex."),
  WidgetData(
        title: "What is Checkbox?",
        description:
        "Expanded widget in flutter comes in handy when we want a child widget or children widgets to take all the available space along the main-axis (for Row the main axis is horizontal & vertical for Column). Expanded widget can be taken as the child of Row, Column, and Flex."),
  WidgetData(
        title: "What is Draggable?",
        description:
        "Expanded widget in flutter comes in handy when we want a child widget or children widgets to take all the available space along the main-axis (for Row the main axis is horizontal & vertical for Column). Expanded widget can be taken as the child of Row, Column, and Flex."),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      drawer: const AppDrawer(),
      body: Column(
          children: [
            const Text(
              "Welcome to flutter demo app",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(child: ListView.builder(
                itemCount: data.length,
                shrinkWrap: true,
                physics: Platform.isIOS
                    ? const BouncingScrollPhysics()
                    : const ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  var mData = data[index];
                  return showListTile(
                      title: mData.title, description: mData.description);
                }))
          ],
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
