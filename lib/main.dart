// (c) Adrian Widjaja 2019
// Based off the Flutter Code Sample at https://api.flutter.dev/flutter/material/Card-class.html

import 'package:flutter/material.dart';
import 'package:train_facts_for_android/timeline.dart';

void main() => runApp(MyApp());

/// main app widget
class MyApp extends StatelessWidget {
  static const String _title = 'Train Facts';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: MyStatelessWidget(),
      ),
    );
  }
}
