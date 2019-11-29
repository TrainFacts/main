/// (c) Adrian Widjaja 2019 - licensed under MIT (https://opensource.org/licenses/MIT)
/// Based off the example at https://github.com/flutter/plugins/blob/master/packages/webview_flutter/example/lib/main.dart
///   by the Chromium Authors, 2018.

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(MaterialApp(home: TranslateWindow()));

class TranslateWindow extends StatefulWidget { // use WebWindow instead of WebView to avoid package conflicts lol
  @override
  _TranslateWindowState createState() => _TranslateWindowState();
}

class _TranslateWindowState extends State<TranslateWindow> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
          initialUrl: 'https://translate.google.com.au/#view=home&op=translate&sl=auto&tl=ja&text=Translate%20me!%20Translate%20me!',
          javascriptMode: JavascriptMode.unrestricted
      ),
    );
  }
}