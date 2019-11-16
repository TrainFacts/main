// Based off the example at https://flutter.dev/docs/cookbook/networking/fetch-data and
// https://github.com/PoojaB26/ParsingJSON-Flutter and modified for use by Adrian Widjaja under the BSD License
// Card format based off the example at https://api.flutter.dev/flutter/material/Card-class.html

import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

part "modelclass.dart";

// JSON Parse

Future<List<Post>> fetchPost() async {
  // Fetch from JSON
  final response = await http.get('https://jsonplaceholder.typicode.com/posts/');
  return parsePost(response.body);

  }


List<Post> parsePost(String responseBody) {
  // Converts JSON into a List<Post> and parses JSON in the fetchPost function
  final parsed = json.decode(responseBody).cast<List<Post>>();
  return parsed.list<Post>((json) => Post.fromJson(json)).toList();
}

// Build Main Interface

void main() => runApp(MainLine());

class MainLine extends StatefulWidget {
  MainLine({Key key}) : super(key: key);

  @override
  _MainLineState createState() => _MainLineState();
}

class _MainLineState extends State<MainLine> {
  Future<List<Post>> post;

  @override
  void initState() {
    super.initState();
    post = fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: FutureBuilder<List<Post>>(
        future: post,
        builder: (context, snapshot) {
          if (snapshot.hasError) // For some reason if else statements don't work, hmmm...
            print(snapshot.error);
          return (snapshot.hasData)
              ? // To-do
              : Center(child: CircularProgressIndicator());
        }));
    }
  }

// Create Front-End that will Display JSON
