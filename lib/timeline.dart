// Based off the example at https://flutter.dev/docs/cookbook/networking/fetch-data and
// and modified for use by Adrian Widjaja under the BSD License
// Card format based off the example at https://api.flutter.dev/flutter/material/Card-class.html

import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

part "modelclass.dart";
part "postlist.dart";

Future<List<Post>> fetchPost() async {
  final response =
      await http.get('https://trainfacts.github.io/assets/main.json');
  return compute(parsePost, response.body);
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
      future: fetchPost(),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);
        return snapshot.hasData
            ? PostList(post: snapshot.data)
            : Center(child: CircularProgressIndicator());
      },
    );
  }
}