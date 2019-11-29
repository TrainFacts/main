/// (c) Adrian Widjaja 2019 - licensed under MIT (https://opensource.org/licenses/MIT)
/// Based off the example at https://flutter.dev/docs/cookbook/networking/fetch-data and
///   and modified for use by Adrian Widjaja under the BSD License
/// Card format based off the example at https://api.flutter.dev/flutter/material/Card-class.html

import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'package:flushbar/flushbar.dart';
import 'package:http/http.dart' as http;

part "modelclass.dart";
part "postknight.dart";

Future<List<Post>> fetchPost(context) async {
  try {
    final response = await http.get('https://trainfacts.github.io/assets/main.json');
    return parsePost(response.body);

  }
  catch (e) {
    Flushbar(
      title: "Your device is not connected to the Internet.",
      message: "The information stored offline may be outdated, incomplete or broken, so please use at your own risk. If this is a bug, please go to trainfacts.github.io/errors (Exception Code 2).",
    )..show(context);
    final response = await rootBundle.loadString('assets/main.json');
    return parsePost(response);
  }

}

// A function that converts a response body into a List<Post>.
List<Post> parsePost(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Post>((json) => Post.fromJson(json)).toList();
}

void main() => runApp(MainLine());

class MainLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Train Facts';

    return MaterialApp(
      title: appTitle,
      home: MainLineState(title: appTitle),
    );
  }
}

class MainLineState extends StatelessWidget {
  final String title;

  MainLineState({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Post>>(
      future: fetchPost(context),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);
        return snapshot.hasData
            ? PostKnight(post: snapshot.data)
            : Center(child: CircularProgressIndicator());
      },
    );
  }
}