/// (c) Adrian Widjaja 2019 - licensed under MIT (https://opensource.org/licenses/MIT)
/// Bottom navigation based off the example at:
///   https://github.com/nisrulz/flutter-examples/blob/master/using_bottom_nav_bar/lib/main.dart


import 'package:flutter/material.dart';

import 'package:trainfacts/about.dart';
import 'package:trainfacts/lost.dart';
import 'package:trainfacts/timeline.dart';
import 'package:trainfacts/translate.dart';
import 'package:trainfacts/webview.dart';

void main() {
  runApp(MaterialApp(
      title: "Train Facts",
      // Home
      home: MyHome()));
}

class MyHome extends StatefulWidget {
  @override
  MyHomeState createState() => MyHomeState();
}

// SingleTickerProviderStateMixin is used for animation
class MyHomeState extends State<MyHome> with SingleTickerProviderStateMixin {
  // Create a tab controller
  TabController controller;

  @override
  void initState() {
    super.initState();

    // Initialize the Tab Controller
    controller = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    // Dispose of the Tab Controller
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Appbar
      appBar: AppBar(
        // Title
        title: Text("Train Facts"),
        // Set the background color of the App Bar
        backgroundColor: Colors.lightBlueAccent,
      ),
      // Set the TabBar view as the body of the Scaffold
      body: TabBarView(
        // Add tabs as widgets
        children: <Widget>[MainLine(), WebWindow(), TranslateWindow(), LostPost(), AboutApp()],
        // set the controller
        controller: controller,
      ),
      // Set the bottom navigation bar
      bottomNavigationBar: Material(
        // set the color of the bottom navigation bar
        color: Colors.deepPurpleAccent,
        // set the tab bar as the child of bottom navigation bar
        child: TabBar(
          tabs: <Tab>[
            Tab(
              // set icon to the tab
              icon: Icon(Icons.today),
            ),
            Tab(
              icon: Icon(Icons.assignment),
            ),
            Tab(
              icon: Icon(Icons.translate),
            ),
            Tab(
              icon: Icon(Icons.error_outline),
            ),
            Tab(
              icon: Icon(Icons.info),
            ),
          ],
          // setup the controller
          controller: controller,
        ),
      ),
    );
  }
}