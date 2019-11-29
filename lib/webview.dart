/// (c) Adrian Widjaja 2019 - licensed under MIT (https://opensource.org/licenses/MIT)
/// Based off the example at https://github.com/flutter/plugins/blob/master/packages/webview_flutter/example/lib/main.dart
///   by the Chromium Authors, 2018.

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(MaterialApp(home: WebWindow()));

class WebWindow extends StatefulWidget { // use WebWindow instead of WebView to avoid package conflicts lol
  @override
  _WebWindowState createState() => _WebWindowState();
}

class _WebWindowState extends State<WebWindow> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
          initialUrl: 'https://sites.google.com/staloysius.nsw.edu.au/2019japtour/blog',
          javascriptMode: JavascriptMode.unrestricted
      ),
    );
  }
}